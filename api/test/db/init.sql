CREATE USER useradmin with PASSWORD 'lozinka123';
create database church owner useradmin;
\c church
create table dioceses (
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    name varchar(30) UNIQUE not null,
);

insert into diocese (uid, name) values
    ('5L62ELIbTGUaaNTKIEZuFyns05crmR', 'Varaždinska biskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crma', 'Sisačka biskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crmb', 'Zagrebačka nadbiskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crmc', 'Bjelovarko-križevačka biskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crmd', 'Dubrovačka biskupija');

create table deaneries (
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    name varchar(30) UNIQUE not null,
    diocese char(30),
)

create table parishes (
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    name varchar(30) UNIQUE not null,
    deanery char(30),
)

create table writers {
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    username varchar(30) not null UNIQUE,
    password varchar(60) not null,
    first varchar(30) not null,
    last varchar(30) not null,
    title varchar(30),
    in_charge_of_community_id char(30) not null,
}

create table articles {
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    title varchar(30) not null,
    content text not null,
    create_at timestamp not null default now(),
    author char(30) not null,
    created_for_community_id char(30) not null
}