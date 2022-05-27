image: Dockerfile docker-compose.yml id_rsa.pub
	./build-container.sh

id_rsa.pub: $(HOME)/.ssh/id_rsa.pub
	cp $^ id_rsa.pub
