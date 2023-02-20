docker cp backup/23_02_20_23_53_59/public bookstack:/var/www/bookstack/
docker cp backup/23_02_20_23_53_59/storage bookstack:/var/www/bookstack/

docker exec --user root bookstack chown -R www-data:www-data /var/www/bookstack/storage
docker exec --user root bookstack chown -R www-data:www-data /var/www/bookstack/public

docker cp backup/23_02_20_23_53_59/backup.sql bookstack-db:/
docker exec --user root bookstack-db chmod 777 /backup.sql
docker exec bookstack-db sh -c "mysql -uroot -proot < backup.sql"
