CREATE TABLE guest_type
(
    id   serial primary key,
    name varchar
);

CREATE TABLE guest
(
    id         serial primary key,
    first_name varchar,
    last_name  varchar,
    email      varchar,
    type_id    integer,
    foreign key (type_id) references guest_type (id)
);

CREATE TABLE reservation
(
    id         serial primary key,
    room       integer,
    guest      integer,
    start_date timestamp,
    end_date   timestamp,
    check_in   boolean not null,
    check_out  boolean not null,
    foreign key (guest) references guest (id),
    foreign key (room) references room (id)
);

CREATE TABLE room
(
    id          serial primary key,
    name        varchar,
    description varchar,
    floor       number,
    max_guests  number,
    type_id     integer,
    hotel_id    integer,
    foreign key (type_id) references room_type (id),
    foreign key (hotel_id) references hotel (id)
);

CREATE TABLE room_type
(
    id   serial primary key,
    name varchar
);

CREATE TABLE hotel
(
    id          serial primary key,
    name        varchar,
    description varchar,
    stars       number
);

CREATE TABLE bitacora_reservaciones
(
    id               serial primary key,
    hotel_name       varchar,
    room_name        varchar,
    guest_first_name varchar,
    guest_last_name  varchar,
    guest_email      varchar,
    start_date       timestamp,
    end_date         timestamp
);