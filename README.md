# IMDb Data Loader with Docker Compose

## Project Objective

Set up a PostgreSQL database and load IMDb data using Docker Compose to facilitate analysis and querying.

## Prerequisites and Infrastructure

- Any machine with Docker and Docker Compose installed.
- `wget` for downloading IMDb datasets.

## Project Description

This project uses Docker Compose to set up a PostgreSQL database and load data from IMDb datasets. The data is downloaded, unzipped, and inserted into PostgreSQL tables.

## IMDb Data

The IMDb datasets used include:
- `name.basics.tsv.gz`: Information about people involved in the film industry. ([Download URL](https://datasets.imdbws.com/name.basics.tsv.gz))
- `title.basics.tsv.gz`: Information about film titles. ([Download URL](https://datasets.imdbws.com/title.basics.tsv.gz))
- `title.crew.tsv.gz`: Crew information for each title. ([Download URL](https://datasets.imdbws.com/title.crew.tsv.gz))
- `title.episode.tsv.gz`: Information about TV episodes. ([Download URL](https://datasets.imdbws.com/title.episode.tsv.gz))
- `title.principals.tsv.gz`: Principal cast and crew information. ([Download URL](https://datasets.imdbws.com/title.principals.tsv.gz))
- `title.ratings.tsv.gz`: User ratings for each title. ([Download URL](https://datasets.imdbws.com/title.ratings.tsv.gz))
- `title.akas.tsv.gz`: Alternative titles for each title in different languages and regions. ([Download URL](https://datasets.imdbws.com/title.akas.tsv.gz))

## Schema Loaded into Tables

| Table Name       | Columns                                                                                                |
|------------------|--------------------------------------------------------------------------------------------------------|
| **person**       | id, primary_name, birth_year, death_year, primary_profession, known_for_titles                         |
| **title**        | id, title_type, primary_title, original_title, is_adult, start_year, end_year, runtime_minutes, genres |
| **rating**       | title_id, average_rating, num_votes                                                                    |
| **crew**         | title_id, directors, writers                                                                           |
| **episode**      | id, parent_title_id, season_number, episode_number                                                     |
| **principal**    | title_id, ordering, person_id, category, job, characters                                               |
| **title_aka**    | title_id, ordering, aka, region, language, types, attributes, is_original_title                        |

## Steps to Run the Setup

1. **Clone the repository**:

    ```sh
    git clone git@github.com:soumya-codes/imdb-postgres.git
    cd imdb-postgres
    ```

2. **Download IMDb data files**:

    ```sh
    make download-dataset
    ```

3. **Start the Docker Compose setup**:

    ```sh
    make run
    ```

## Teardown the Setup

To stop and remove the Docker containers and network created by Docker Compose:

```sh
make teardown
```