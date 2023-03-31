# Utiliser une image comme base
FROM ubuntu:latest

#mettre à jour le système
RUN apt-get update

#installer le serveur web
RUN apt-get install -y nginx

# ajout de mon dossier 
ADD src/ /var/www/html/


# Exposer le port 80 pour la page web
EXPOSE 80

# Builder mon application
CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]


###COMMANDE POUR LA PREMIERE PARTIE###
#docker build -t devoir_mk .
#devoir_mk     latest    782e0677fb65   18 seconds ago   179MB
#docker run --name monSite -d -p 8000:80 devoir_mk 
#eed8803c16da   devoir_mk   "/usr/sbin/nginx -g …"   2 minutes ago   Created             monSite
#
#
#ssh Marinouh@52.172.250.107
#
