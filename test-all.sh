#!/bin/bash

set -e


cd ..

echo "============== Test config-server =================="
cd config-server
./mvnw spotless:apply clean verify
cd ..

echo "============== Test api-gateway =================="
cd api-gateway
./mvnw spotless:apply clean verify
cd ..

echo "============== Test feature-service =================="
cd feature-service
./mvnw spotless:apply clean verify
cd ..

echo "============== Test user-service =================="
cd user-service
./mvnw spotless:apply clean verify
cd ..

echo "============== Test notification-service =================="
cd notification-service
./gradlew spotlessApply clean test
cd ..

#echo "============== Test feature-tracker-angular =================="
#cd feature-tracker-angular
#npm install
#npm test
#cd ..
