# Inception
Inception is a project undertaken as part of the curriculum of 42 schools. This project allows you to discover and become familiar with Docker and its tools. Of course, given that at 42 even an initiation is always pushed, ban on using ready-made containers. The entire project is carried out using docker "virgins" on which we are asked to choose between alpine and debian buster and to install and fully configure the tools we need.

----

## Launching Inception

To see all available commands :

``make help``

To start all the dockers (docker compose) :

``make``

Une fois le projet lance, Open a browser and type :

``https://localhost``

You will arrive on my “CV” static page dating from the time I was on the project. By clicking on the inception project present on the holygraph you will come across the configuration page giving you access to all the administration of the device.

The default passwords, given that the project is for educational purposes, are in clear text in the .env file provided and are extremely insecure. You can modify logins and passwords as you wish.

**Never post .env files or any other file containing real identifiers on a public page!**

----

## Features :

- An NGINX web server
- MariaDB
- Wordpress functional, installed, configured with 2 users
- Redis
- Portainer
- An FTP server
- Adminer


----

## Cleanup
**Stop Inception & Clean inception docker (prune -f)**

``make clean``

**To remove both the object files and the compiled library**:

**Warning !** Remove all dockers on this system & Remove persistant datas

``make fclean``

----

## Contribution
If you encounter any bugs or wish to add features, please feel free to open an issue or submit a pull request.
