all: dns_client dns_server

dns_client: dns_client.o client_handler.o utility.o client.o
	g++ dns_client.o client_handler.o client.o utility.o -o client

dns_server: dns_server.o server.o utility.o dns.o cache.o
	g++ dns_server.o server.o utility.o dns.o cache.o -pthread -o server

dns_client.o: dns_client.cpp
	g++ -c dns_client.cpp

utility.o:
	g++ -c utility.cpp

client_handler.o:
	g++ -c client_handler.cpp

client.o:
	g++ -c client.cpp

dns_server.o:
	g++ -c dns_server.cpp

server.o:
	g++ -c server.cpp

dns.o:
	g++ -c dns.cpp

cache.o:
	g++ -c cache.cpp -pthread 

clean:
	rm *.o client server