
all: build_4.6

.PHONY: build
build_%:
	docker build -t victoriapb/docker_sci:$* -f Dockerfile .

.PHONY: push_%
push_%: build_%
	docker push victoriapb/docker_sci:$*

.PHONY: clean_images
clean_images:
	docker images -a | grep "victoriapb/docker_sci" | awk '{print $$3}' | xargs docker rmi

