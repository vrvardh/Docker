FROM alpine/git as clone
WORKDIR /app
RUN git clone https://oauth2:<TOKEN>@<GIT_URL>:project .
cd project
git checkout develop

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY –from=clone /app/project /app/group_5
RUN mvn clean install package
