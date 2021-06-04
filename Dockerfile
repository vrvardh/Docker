FROM alpine/git as clone
WORKDIR /app
RUN git clone https://oauth2:jjddeNr6FtkgZY4eQ62w@git.ecdf.ed.ac.uk/sd202021groups/group_5.git:project .
cd project
git checkout develop

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY –from=clone /app/project /app/group_5
RUN mvn clean install package
