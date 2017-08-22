.PHONY: build run

NAME = ssh-gateway
IMAGE = connesc/$(NAME)

build:
	docker build -t $(IMAGE) .

run:
	docker run --init --rm --name $(NAME) $(IMAGE)
