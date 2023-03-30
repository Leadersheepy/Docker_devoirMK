# Utiliser une image comme base
FROM ubuntu:latest

#mettre à jour le système
RUN apt-get update

#installer le serveur web
RUN apt-get install -y nginx

# ajout de mon dossier 
ADD ./ /var/www/html/


# Exposer le port 80 pour la page web
EXPOSE 8000

# Builder mon application
CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]


###COMMANDE POUR LA PREMIERE PARTIE###
#docker build -t devoir_mk
#devoir_mk     latest    782e0677fb65   18 seconds ago   179MB
#docker run --name monSite -d -p 8000:8000 devoir_mk