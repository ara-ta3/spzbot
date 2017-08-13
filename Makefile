NPM=$(shell which npm)
slack_token=
name=spz

help:
	cat Makefile

install:
	$(NPM) install

start:
	env HUBOT_SLACK_TOKEN=$(slack_token) \
		$(NPM) run start -- --name $(name) --adapter slack
