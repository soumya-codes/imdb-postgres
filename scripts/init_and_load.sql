-- Create tables
CREATE TABLE IF NOT EXISTS public.person
(
    id text,
    primary_name text,
    birth_year int,
    death_year int,
    primary_profession text,
    known_for_titles text
);

CREATE TABLE IF NOT EXISTS public.title
(
    id text,
    title_type text,
    primary_title text,
    original_title text,
    is_adult boolean,
    start_year int,
    end_year int,
    runtime_minutes int,
    genres text
);

CREATE TABLE IF NOT EXISTS public.rating
(
    title_id text,
    average_rating numeric,
    num_votes int
);

CREATE TABLE IF NOT EXISTS public.crew
(
    title_id text,
    directors text,
    writers text
);

CREATE TABLE IF NOT EXISTS public.episode
(
    id text,
    parent_title_id text,
    season_number int,
    episode_number int
);

CREATE TABLE IF NOT EXISTS public.principal
(
    title_id text,
    ordering int,
    person_id text,
    category text,
    job text,
    characters text
);

CREATE TABLE IF NOT EXISTS public.title_aka
(
    title_id text,
    ordering int,
    aka text,
    region text,
    language text,
    types text,
    attributes text,
    is_original_title boolean
);

-- Truncate tables
TRUNCATE public.person;
TRUNCATE public.title;
TRUNCATE public.rating;
TRUNCATE public.crew;
TRUNCATE public.episode;
TRUNCATE public.principal;
TRUNCATE public.title_aka;

-- Load data
\copy public.person from '/data/name.basics.tsv' with (format 'csv', delimiter E'\t', null '\N', header true, quote E'\b');
\copy public.title from '/data/title.basics.tsv' with (format 'csv', delimiter E'\t', null '\N', header true, quote E'\b');
\copy public.rating from '/data/title.ratings.tsv' with (format 'csv', delimiter E'\t', null '\N', header true, quote E'\b');
\copy public.crew from '/data/title.crew.tsv' with (format 'csv', delimiter E'\t', null '\N', header true, quote E'\b');
\copy public.episode from '/data/title.episode.tsv' with (format 'csv', delimiter E'\t', null '\N', header true, quote E'\b');
\copy public.principal from '/data/title.principals.tsv' with (format 'csv', delimiter E'\t', null '\N', header true, quote E'\b');
\copy public.title_aka from '/data/title.akas.tsv' with (format 'csv', delimiter E'\t', null '\N', header true, quote E'\b');