### Devoir Docker mk
 
 # --------- IMPORTANT ! A LIRE ---------
 
 #### Voici le devoir docker à rendre, vous trouverez dans ce readme des informations concernant la réalisation du projet.
 
Bonne lecture !

----
***Schema architecture***
![image](https://github.com/Leadersheepy/Docker_devoirMK/assets/43178189/1df03f4c-f13a-4a8a-9e26-e490ec55ffa5)

***Construction de l'image et run***

`docker build -t devoir_mk .`

`docker run --name monSite -d -p 8000:80 devoir_mk`

***Pour la VM***

`ssh Marinouh@52.172.250.107`

![image](https://user-images.githubusercontent.com/43178189/229358260-489f4ee0-c93d-4563-b929-a361c1b4a79a.png)



***Lancer le conteneur mysql/postgre***

`docker run --name some-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql`


:bulb: MYSQL ne fonctionnait pas sur mon pc donc je passes sur postgres


`docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres`

(Utilisation de dbeaver pour gérer la partie BDD)
![image](https://user-images.githubusercontent.com/43178189/229358338-0819580c-1020-40c5-b579-5c3f025eac2e.png)


***Docker network***

`docker network create ""`

`#docker network create -d bridge devoirdockernet`

`docker network ls`

`docker run -p 8000:80 --link some-postgres:postgres devoir_mk`

***Relier les deux contenaires par le même network***

`docker run --name some-postgres -p 5432:5432 --network="devoirdockernet" -e POSTGRES_PASSWORD=mysecretpassword -d postgres`

`docker run --name monSite -d -p 8000:80 --network="devoirdockernet" devoir_mk`

***Voir si la connexion est bien faite***
`docker network inspect devoirdockernet`

```
       "Containers": {
            "6ec343cbd95e424223da6e3cbd9f9814e2ebbaca1a64c25cbffaebc9df60f1bc": {
                "Name": "some-postgres",
                "EndpointID": "5e2e5efa49bee83ac16c64fb01ddaefa657939955bb00708e885af7241748c64",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            },
            "845820557a568892ce91f9a77005ce2f6cb9c8fab4f330aa289c121182b45f10": {
                "Name": "monSite",
                "EndpointID": "63ef149da0a0a86056775ad293f92a796b714065774623a464bd832a0a0bada6",
               "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            }
        },
 ```

***Autre manière pour connecter les deux***

`docker run -it --rm --network some-network postgres psql -h some-postgres -U postgres
`
`docker network connect some-network some-postgres`


***Pour rentrer dans le contenaire***

`docker exec -it some-postgres sh`

***Test du projet***
![image](https://github.com/Leadersheepy/Docker_devoirMK/assets/43178189/a63aa49c-3f3d-4d9d-a3c1-cdd60cebdc35)
![image](https://github.com/Leadersheepy/Docker_devoirMK/assets/43178189/ee546f03-c5d8-4979-8c8a-b5fd894673be)

***Projet image***
![image](https://github.com/Leadersheepy/Docker_devoirMK/assets/43178189/560a1b6f-b357-41eb-b9fc-ba1869be7d35)
![image](https://github.com/Leadersheepy/Docker_devoirMK/assets/43178189/fd940862-3a88-41f1-a6f3-f968cd6a2041)

***Swagger***
![image](https://github.com/Leadersheepy/Docker_devoirMK/assets/43178189/e8e660c7-0f0c-4c7a-9e39-df1f2fd1caf9)


***Docker desktop***
![image](https://user-images.githubusercontent.com/43178189/229358419-fff1e2f5-371d-4051-9bdc-9f334a335d22.png)


***Git Action***
![image](https://user-images.githubusercontent.com/43178189/229361512-71a7bdb9-07e9-4c43-bcce-6ce0b4bdc468.png)

***Prometheus***
![image](https://github.com/Leadersheepy/Docker_devoirMK/assets/43178189/8b2f17f6-8a89-4e9c-8a75-2db03d0acbad)


***Docker hub***
![image](https://user-images.githubusercontent.com/43178189/229361580-9e28d171-0f61-4d32-84ad-ff02a4c24462.png)

