NPM=$(shell which npm)
HEROKU=$(shell which heroku)
slack_token=
name=spz
heroku_app_name=spzbot
env=.env

help:
	cat Makefile

install:
	$(NPM) install

start/local: $(env)
	source $< && HUBOT_SLACK_TOKEN=$$HUBOT_SLACK_TOKEN \
		$(NPM) run start -- --name $(name) --adapter slack

start/local/shell:
	$(NPM) run start -- --name $(name)

deploy/heroku:
	git push heroku master

deploy/heroku/env:
	$(HEROKU) config:push --app $(heroku_app_name) --file $(env)

deploy/heroku/setup: $(HEROKU)
	$(HEROKU) git:remote --app $(heroku_app_name)
	$(HEROKU) plugins:install heroku-config

$(HEROKU):
	which heroku || echo 'please install heroku cli https://devcenter.heroku.com/articles/heroku-cli'

.env:
	cp -f env.sample $@
