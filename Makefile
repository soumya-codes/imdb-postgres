.PHONY: download-dataset clean-dataset build run clean deep-clean

download-dataset:
	@chmod +x ./scripts/download_imdb_datasets.sh
	./scripts/download_imdb_datasets.sh

clean-dataset:
	rm -rf data/*

build:
	docker-compose build

run:
	docker-compose up

clean:
	docker-compose down --rmi local

deep-clean:
	docker-compose down --rmi local -v