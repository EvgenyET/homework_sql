create table if not exists musicians (
	id serial primary key,
	musician text,
	nickname text 
);
create table if not exists albums (
	id serial  primary key,
	name_album text,
	year_of_release_album integer
);

create table if not exists tracks (
	id serial primary key,
	name_track text,
	duration numeric,
	album_id  integer references albums(id)
);

create table if not exists genres (
	id serial primary key,
	name_genre text
);

create table if not exists digests (
	id serial primary key,
	name_digest text,
	year_of_release_digest integer
);

create table if not exists genre_musician (
	id serial primary key,
	genres_id  integer references genres(id),
	musician_id  integer references musicians(id)
);

create table if not exists musicians_albums (
	id serial primary key,
	musician_id  integer references musicians(id),
	album_id  integer references albums(id)
	
);

create table if not exists composition_digest (
	id serial primary key,
	digest_id  integer references digests(id),
	track_id  integer references tracks(id)
);