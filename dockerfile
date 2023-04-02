# Utiliser une image comme base
FROM ubuntu:latest

#mettre à jour le système
RUN apt-get update

#installer le serveur web
RUN apt-get install -y nginx

#installer la partie network donc mysql
RUN apt-get install -y mysql-client

# Installer python et pip
RUN apt-get install -y python3 python3-pip

# Installer les requirements python
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# ajout de mon dossier 
ADD src/ /var/www/html/
ADD App/ /App


#Se connecter à la base de donnée postgres
ENV POSTGRES_HOST=some-postgres
ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV PGPORT=5432
ENV PGPASSWORD=mysecretpassword


# Exposer le port 80 pour la page web
#EXPOSE 80
EXPOSE 8000

# Builder mon application
#CMD [ "/usr/sbin/nginx", "-g", "daemon off;" , "bash"]
CMD ["uvicorn", "App.main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]


###COMMANDE POUR LA PREMIERE PARTIE###
#docker build -t devoir_mk .
#devoir_mk     latest    782e0677fb65   18 seconds ago   179MB
#docker run --network some-network --name monSite -d -p 8000:8000 devoir_mk
#eed8803c16da   devoir_mk   "/usr/sbin/nginx -g …"   2 minutes ago   Created             monSite
#
#
#ssh Marinouh@52.172.250.107
#
#docker network create "some-network"
#docker network ls
#sudo docker  build -t devoir_mk .

#docker run --name some-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
#MYSQL plante sur mon pc donc je passe sur postgres

#docker run --network some-network --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres
#docker run -p 3000:3000 --link some-postgres:postgres myapp