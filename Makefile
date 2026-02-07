COMPOSE = docker compose -f infra/compose.yaml --env-file infra/.env

init-env:
	@test -f infra/.env || cp infra/.env.example infra/.env

up:
	$(MAKE) init-env
	$(COMPOSE) --profile dev up -d --build

rebuild:
	$(MAKE) init-env
	$(COMPOSE) --profile dev build --no-cache
	$(COMPOSE) --profile dev up -d


down:
	$(COMPOSE) down

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs -f --tail=200

nuke:
	$(COMPOSE) down -v
