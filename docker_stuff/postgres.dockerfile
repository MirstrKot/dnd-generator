FROM postgres
ADD ./dump/postgres.sql /docker-entrypoint-initdb.d/