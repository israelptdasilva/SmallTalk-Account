# A Smalltalk Study
This SmallTalk app connects to a MySQL database to make read and write operations. 


## Techonologies
* [GNU Smalltalk User’s Guide: Tutorial](https://www.gnu.org/software/smalltalk/manual/html_node/Tutorial.html#Tutorial)


## Requirements
* [Docker: Accelerated, Containerized Application Development](https://www.docker.com/)


## Start Docker Containers
```bash
git clone git@github.com:israelptdasilva/Smalltalk-Account-App.git smalltalk

cd smalltalk

docker compose up -d
```


## Run Sample Application
Enter the application container to the gnu-smalltalk binaries:
```bash
docker exec -it smalltalk /bin/bash
```

Create a snapshot of the SmallTalk application:
```bash
gst source/* -S
```

Run the sample application:
```bash
 gst -f main.st
```

Running the command should output the following:
```bash
balance -> 5   date ->  2022-12-01T14:57:36+00:00   
balance -> 0   date ->  2022-12-01T14:57:36+00:00
```

## Run Sample Tests
Make sure a snapshot of the application is created. Skip this if you have already created a snapshot in the `Run Sample Application` section. This part assumes you are already inside the application container.

```bash
gst source/* -S
```

Run tests. If there’s no output then it means all tests passed.
```bash
gst-sunit -f tests/AccountControllerTestCase.st
```

