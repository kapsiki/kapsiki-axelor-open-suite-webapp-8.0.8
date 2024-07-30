Axelor Open Suite
================================

Axelor Open Suite reduces the complexity and improve responsiveness of business processes. Thanks to its modularity, you can start with few features and  then activate other modules when needed.

Axelor Open Suite includes the following modules :

* Customer Relationship Management
* Sales management
* Financial and cost management
* Human Resource Management
* Project Management
* Inventory and Supply Chain Management
* Production Management
* Multi-company, multi-currency and multi-lingual

Axelor Open Suite is built on top of [Axelor Open Platform](https://github.com/axelor/axelor-open-platform)


Installation
================================

To compile and run from source, you will need to clone Axelor Open Suite modules, which is a
[git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) repository, using following commands:

```bash
$ git clone git@github.com:axelor/open-suite-webapp.git
$ cd open-suite-webapp
$ git checkout master
$ git submodule init
$ git submodule update
$ git submodule foreach git checkout master
$ git submodule foreach git pull origin master
```

You can find more detailed [installation instructions](https://docs.axelor.com/abs/5.0/install/index.html) on our documentation.


How i proceeded:

```bash
1. git clone git@github.com:bertiniawara/open-suite-webapp.git
2. cd open-suite-webapp
3. git checkout -b main
4. cd modules/axelor-open-suite
5. git submodule init
6. git submodule update --depth=1
7. cd ..
8. cat .git/config
9. cat .gitmodules
10. ls -la modules/axelor-open-suite
11. git submodule update
12. created a Dockerfile and docker-compose.yaml
13. editted the ${db.default.url} in the src/main/resources 
14. ./gradlew clean build -x test
15. docker-compose down -v  
16. docker-compose up --build


TO CHECK ALL THIS 

docker ps -a 
docker exec -it 765985d5152b  /bin/bash
docker volume ls
docker volume inspect open-suite-webapp_postgres-data

To check database

docker exec -it open-suite-webapp_db_1 psql -U axelor -d greatness
SELECT current_database();
SELECT 
    pid, 
    usename, 
    application_name, 
    client_addr, 
    state, 
    query 
FROM 
    pg_stat_activity;

```