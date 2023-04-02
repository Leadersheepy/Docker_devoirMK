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
