# Utiliser une image comme base
FROM ubuntu:latest

#mettre à jour le système
RUN apt-get update

#installer le serveur web
RUN apt-get install -y nginx

#installer la partie network donc mysql
RUN apt-get install -y postgresql-client

# ajout de mon dossier 
ADD src/ /var/www/html/


#Se connecter à la base de donnée postgres
ENV POSTGRES_HOST=some-postgres
ENV PGHOST=postgres
ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV PGPORT=5432
ENV PGPASSWORD=mysecretpassword


# Exposer le port 80 pour la page web
EXPOSE 80

# Builder mon application
CMD [ "/usr/sbin/nginx", "-g", "daemon off;" , "bash"]

