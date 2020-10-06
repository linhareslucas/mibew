# Mibew

"**Mibew Messenger** (also known as **Open Web Messenger**) is an open-source live support application written in PHP and MySQL. It enables one-on-one chat assistance in real-time directly from your website."

# How it works?
You should place the button of Web Messenger at your site. Your visitors click the button and chat with your operators who help them.

This image based on php:7.4-fpm-alpine.

# Getting started

Pull image in your host
```sh
# docker pull l1nh4r3s/mibew
```


Or build your own image based in my dockerfile


```sh
# docker build -t l1nh4r3s/mibew github.com/linhareslucas/mibew
```

# Quickstart

Start Mibew in docker

```sh
# docker container run -d -p 80:80 -p 443:443 l1nh4r3s/mibew 
```

Create a MySQL database with the name `mibew`

After executing it will be necessary to edit the MySQL parameters in the ***config.yml*** file located in the ***/var/www/html/mibew/configs/***, i used the command ***sed***.

```sh
# docker exec "container_id" sed -i '7s/".*"/"MySQL_HOST"/' /var/www/html/mibew/configs/config.yml
```

```sh
# docker exec "container_id" sed -i '8s/$/3306/' /var/www/html/mibew/configs/config.yml
```
```sh
# docker exec "container_id" sed -i '9s/".*"/"MIBEW_DB"/' /var/www/html/mibew/configs/config.yml
```
```sh
# docker exec "container_id" sed -i '10s/".*"/"DB_USER"/' /var/www/html/mibew/configs/config.yml
```
```sh
# docker exec "container_id" sed -i '11s/".*"/"DB_PASSWORD"/' /var/www/html/mibew/configs/config.yml
```
Using your web browser visit  `http://<yourdomain>/mibew/install`  and perform step-by-step installation via the web interface.


After complete instalation delete the `mibew/install.php` file with this command:
```sh
# docker exec "container_id" rm /var/www/html/mibew/install.php
```

Login as
 user: `admin`
 password: `<your password>`


# References
https://mibew.org/

https://docs.mibew.org/

https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html
