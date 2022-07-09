#!/bin/bash
MYSQL_ROOT_PASSWORD=root

DB_VOLUME="bookstack-db"
STORAGE_VOLUME="bookstack-storage"
PUBLIC_VOLUME="bookstack-public"
BAK_DIR_NAME="./backup/$(date +'%g_%m_%d_%H_%M_%S')/"

mkdir -p "$BAK_DIR_NAME"

docker cp bookstack:/var/www/bookstack/public "$BAK_DIR_NAME"
docker cp bookstack:/var/www/bookstack/storage "$BAK_DIR_NAME"
docker exec bookstack-db sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > "$BAK_DIR_NAME/backup.sql"
