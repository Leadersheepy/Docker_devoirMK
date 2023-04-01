# Utiliser une image comme base
FROM ubuntu:latest

#mettre à jour le système
RUN apt-get update

#installer le serveur web
RUN apt-get install -y nginx

#installer la partie network donc mysql
RUN apt-get install -y mysql-client

# ajout de mon dossier 
ADD src/ /var/www/html/


#Se connecter à la base de donnée postgres
ENV PGHOST=postgres
ENV PGPORT=5432
ENV PGPASSWORD=mysecretpassword


# Exposer le port 80 pour la page web
EXPOSE 80

# Builder mon application
CMD [ "/usr/sbin/nginx", "-g", "daemon off;" , "bash"]


###COMMANDE POUR LA PREMIERE PARTIE###
#docker build -t devoir_mk .
#devoir_mk     latest    782e0677fb65   18 seconds ago   179MB
#docker run --name monSite -d -p 8000:80 devoir_mk 
#eed8803c16da   devoir_mk   "/usr/sbin/nginx -g …"   2 minutes ago   Created             monSite
#
#
#ssh Marinouh@52.172.250.107
#
#docker network create ""
#docker network ls
#sudo docker  build -t devoir_mk .

#docker run --name some-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
#MYSQL plante sur mon pc donc je passe sur postgres

#docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres
#docker run -p 3000:3000 --link some-postgres:postgres myapp