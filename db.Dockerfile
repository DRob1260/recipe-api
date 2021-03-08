FROM library/postgres

ENV POSTGRES_HOST_AUTH_METHOD trust

COPY src/main/resources/database/create_recipe_tables.sql /docker-entrypoint-initdb.d/
COPY src/main/resources/database/insert_user_records.sql /docker-entrypoint-initdb.d/
COPY src/main/resources/database/insert_ingredient_records.sql /docker-entrypoint-initdb.d/
COPY src/main/resources/database/insert_recipe_records.sql /docker-entrypoint-initdb.d/
COPY src/main/resources/database/insert_recipe_ingredient_records.sql /docker-entrypoint-initdb.d/
COPY src/main/resources/database/insert_recipe_direction_records.sql.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
