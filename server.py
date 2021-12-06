import socket
import json

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Cria um socket TCP/IP


server.bind(('192.168.0.8',3333)) # Seta o ip e a porta do servidor

server.listen(1) # Configura servidor para escutar 1 cliente

files = {
    "OpCode": 610,
    "IdMsg": 1,
    "Files": [100, 101, 103, 105, 106, 109, 111, 118, 119, 124, 214]
}
i = 0;
while True:
    print('Esperando pela conexao...')
    connection, client_address = server.accept() # Servidor fica esperando para aceitar um cliente

    try:
        print('Cliente conectado: ', client_address)
        while True:
            data = connection.recv(512)
            if data:
                message = json.loads(data.decode())
                
                if message["OpCode"] == 500: # Teste de conexão
                    idMsg = -1
                    if "IdMsg" in message:
                        idMsg = message["IdMsg"]
                    idMsg = idMsg + 1
                    response = { "OpCode": 510, "IdMsg": idMsg }
                    connection.sendall(json.dumps(response).encode())
                
                elif message["OpCode"] == 100: # Avaliacao do ECG
                    idMsg = -1
                    if "IdMsg" in message:
                        idMsg = message["IdMsg"]
                    idMsg = idMsg + 1
                    ecgFile = message['ECGFile']
                    if i == 0:
                        response = { "OpCode": 400, "IdMsg": idMsg, "ECGFile": ecgFile, "FreqCard": 74, "GoodComplex": 11, "BadComplex": 2 }
                        i += 1;
                    else:
                        response = { "OpCode": 400, "IdMsg": idMsg, "ECGFile": ecgFile, "FreqCard": 90, "GoodComplex": 0, "BadComplex": 0 }
                        i -= 1;

                    connection.sendall(json.dumps(response).encode())
                
                elif message["OpCode"] == 600: # Listagem dos arquivos
                    connection.sendall(json.dumps(files).encode())
                
                # ADICIONEI ESSA LINHA PARA DESCONECTAR
                elif message["OpCode"] == 700:
                    connection.close()
                
                else:
                    response = { "OpCode": 404 } # Caso o servidor receba uma requisicao não esperada retorna 404
                    connection.sendall(json.dumps(response).encode())
    except:
        print("caiu no except\n")
        connection.close()
    finally:
        connection.close()

