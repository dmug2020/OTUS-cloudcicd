Дополнить пайплайн шагом деплоя приложения в виде докер-образа в облачный сервис (AWS/Azure).

Мы будем деплоить в AWS ECS наше приложение из GITLAB (локального)

Ссылка на https://gitlab.com/dmug999/ugai/-/blob/master/.gitlab-ci.yml

1)скачиваем образ https://github.com/ugaidmitry/cloudcicd/blob/master/hw18/gitlab%20registy.png с локального сервера GITLAB

2)тегируем его и пушим в ECR https://github.com/ugaidmitry/cloudcicd/blob/master/hw18/aws%20ecr.png

3)разворачиваем сервис на основе docker-compose.yml https://gitlab.com/dmug999/ugai/-/blob/master/docker-compose.yml

4)https://gitlab.com/dmug999/ugai/-/blob/master/ecs-params.yml

Получаем работающий сервис : https://github.com/ugaidmitry/cloudcicd/blob/master/hw18/mango.png

