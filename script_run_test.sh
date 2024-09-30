#!/bin/bash

# 1 шаг - Удалить старый контейнер
docker stop playwright-tests-container
docker rm playwright-tests-container

# 2 шаг - Запустить контейнер и смонтировать в него проект с тестами
docker run --net=host --privileged -it -d --name "playwright-tests-container" \
-v "$(pwd)":"/usr/src/app" \
-w "/usr/src/app" mcr.microsoft.com/playwright:v1.47.2-noble /bin/bash

# 3 шаг - Перейти внутрь контейнера
#docker exec -it playwright-tests-container bash

# 4 шаг - запустить тесты
docker exec playwright-tests-container npx playwright test

