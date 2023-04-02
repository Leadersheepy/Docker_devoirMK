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
#docker run -p 8000:80 --link some-postgres:postgres devoir_mk

#docker run --name monSite -d -p 8000:80 devoir_mk

#docker network create -d bridge devoirdockernet
##docker run --name some-postgres -p 5432:5432 --network="devoirdockernet" -e POSTGRES_PASSWORD=mysecretpassword -d postgres
#docker run --name monSite -d -p 8000:80 --network="devoirdockernet" devoir_mk
#docker exec -it some-postgres sh

#docker network inspect devoirdockernet
#[
#    {
#        "Name": "devoirdockernet",
#        "Id": "ec0f9bfde3e311d06315170428b6bf6f422838afa1102a7167060c3f8387e151",
#        "Created": "2023-04-01T16:46:33.978534202Z",
#        "Scope": "local",
#        "Driver": "bridge",
#        "EnableIPv6": false,
#        "IPAM": {
#            "Driver": "default",
#            "Options": {},
#            "Config": [
#                {
#                    "Subnet": "172.18.0.0/16",
#                    "Gateway": "172.18.0.1"
#                }
#            ]
 #       },
 #       "Internal": false,
 #       "Attachable": false,
 #       "Ingress": false,
 #       "ConfigFrom": {
 #           "Network": ""
 #       },
 #       "ConfigOnly": false,
 #       "Containers": {
 #           "6ec343cbd95e424223da6e3cbd9f9814e2ebbaca1a64c25cbffaebc9df60f1bc": {
 #               "Name": "some-postgres",
  #              "EndpointID": "5e2e5efa49bee83ac16c64fb01ddaefa657939955bb00708e885af7241748c64",
  #              "MacAddress": "02:42:ac:12:00:02",
  #              "IPv4Address": "172.18.0.2/16",
  #              "IPv6Address": ""
  #          },
  #          "845820557a568892ce91f9a77005ce2f6cb9c8fab4f330aa289c121182b45f10": {
  #              "Name": "monSite",
   #             "EndpointID": "63ef149da0a0a86056775ad293f92a796b714065774623a464bd832a0a0bada6",
    #            "MacAddress": "02:42:ac:12:00:03",
     #           "IPv4Address": "172.18.0.3/16",
      #          "IPv6Address": ""
       #     }
        #},
        #"Options": {},
        #"Labels": {}
    #}
#]

#docker network connect some-network some-postgres
#docker run -it --rm --network some-network postgres psql -h some-postgres -U postgres
