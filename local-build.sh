#!/bin/bash

set -e


cd ..

echo "============== Building config-server =================="
cd config-server
./mvnw spotless:apply clean spring-boot:build-image -DskipTests
cd ..

echo "============== Building api-gateway =================="
cd api-gateway
./mvnw spotless:apply clean spring-boot:build-image -DskipTests
cd ..

echo "============== Building feature-service =================="
cd feature-service
./mvnw spotless:apply clean spring-boot:build-image
cd ..

echo "============== Building user-service =================="
cd user-service
./mvnw spotless:apply clean spring-boot:build-image -DskipTests
cd ..

echo "============== Building notification-service =================="
cd notification-service
./gradlew spotlessApply clean bootBuildImage -x test
cd ..

echo "============== Building feature-tracker-angular =================="
cd feature-tracker-angular
npm install
npm run build
docker build -t sivaprasadreddy/feature-tracker-angular .
cd ..
