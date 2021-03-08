CREATE TABLE public."user"
(
    user_id serial not null,
    first_name varchar not null,
    last_name varchar,
    email_address varchar not null,
    constraint user_pk__user_id
        primary key (user_id)
);

CREATE TABLE public.recipe
(
	recipe_id serial not null,
	owner_user_id int not null,
	title varchar not null,
	description text,
	categories varchar[],
    constraint recipe_pk__recipe_id
        primary key (recipe_id),
    constraint recipe_fk__owner_user_id
        foreign key (owner_user_id) references public."user" (user_id)
);

CREATE TABLE public.recipe_direction
(
	recipe_id integer not null,
	direction_id serial not null,
	step_number serial not null,
	direction_text text not null,
	constraint recipe_directions_pk
        primary key (recipe_id, direction_id),
    constraint recipe_directions_fk__recipe_id
        foreign key (recipe_id) references public.recipe (recipe_id)
);

CREATE TABLE public.ingredient
(
    ingredient_id serial not null,
    name varchar not null,
    description varchar,
    categories varchar[],
    constraint ingredient_pk__ingredient_id
        primary key (ingredient_id)
);

CREATE TABLE recipe_ingredient
(
	recipe_id integer not null,
	ingredient_id integer not null,
	unit varchar not null,
	amount numeric not null,
	constraint recipe_ingredient_pk
        primary key (recipe_id, ingredient_id),
    constraint recipe_ingredient_fk__recipe_id
        foreign key (recipe_id) references public.recipe (recipe_id),
    constraint recipe_ingredient_fk__ingredient_id
        foreign key (ingredient_id) references public.ingredient (ingredient_id)
);

create unique index user_uindex__user_id
	on public."user" (user_id);

create unique index recipe_uindex__recipe_id
    on public.recipe (recipe_id);

create unique index ingredient_uindex__ingredient_id
    on public.ingredient (ingredient_id);
