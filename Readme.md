# Mibew

"**Mibew Messenger** (also known as **Open Web Messenger**) is an open-source live support application written in PHP and MySQL. It enables one-on-one chat assistance in real-time directly from your website."

This image based on php:7.4-fpm-alpine.

After executing it will be necessary to edit the MySQL parameters in the ***config.yml*** file located in the ***/var/www/html/mibew/configs/***, i used the command ***sed***.


`$ docker exec "container_id" sed -i '7s/".*"/"MySQL_HOST"/' /var/www/html/mibew/configs/config.yml`

`$ docker exec "container_id" sed -i '8s/$/3306/' /var/www/html/mibew/configs/config.yml`

`$ docker exec "container_id" sed -i '9s/".*"/"MIBEW_DB"/' /var/www/html/mibew/configs/config.yml`

`$ docker exec "container_id" sed -i '10s/".*"/"DB_USER"/' /var/www/html/mibew/configs/config.yml`

`$ docker exec "container_id" sed -i '11s/".*"/"DB_PASSWORD"/' /var/www/html/mibew/configs/config.yml`




# References
https://mibew.org/
