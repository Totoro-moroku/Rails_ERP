first-build:
	docker-compose build
	docker-compose up -d

create-db:
	docker-compose run server bundle exec rails db:create
	docker-compose run server bundle exec ridgepole -c config/database.yml -E development --apply -f db/Schemafile
	docker-compose exec server bundle exec rails r db/seeds/entity.rb
	docker-compose exec server bundle exec rails r db/seeds/user.rb
	docker-compose exec server bundle exec rails r db/seeds/item.rb
	docker-compose exec server bundle exec rails r db/seeds/sublist_type.rb


build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down
