Цель: Доработать пайплайн, и привести его к рабочему состоянию, выполнить можно как в отдельной ветке так и в форке проекта https://gitlab.com/sablin-otus-cicd-labs/crate
1)доработать скрипт замены плейсхолдеров .ci/config.sh, в качестве значений использовать переменные
DB_DEV
DB_DEV_USER
DB_DEV_PASS
DB_DEV_ADDR
DB_PROD
DB_PROD_USER
DB_PROD_PASS
DB_PROD_ADDR

они добавлены в секреты и будут экспортированы в окружение при запуске раннера
в качестве префикса тега докер имиджа используем свою фамилию, например $TAG=ivanov1.0.0

2) добавить stage deploy и соответствующие задачи, и запустить у на своей машине контейнер crate_api из созданного образа

* для разворачивания использовать deploy_token otus: w4w8W-ySNn9zQMibD8co

*для запуска контейнера используем комманду docker run -dp 8000:8000 --name crate_api registry.gitlab.com/sablin-otus-cicd-labs/crate/crate_api:$TAG, где тег имиджа как и в предыдущем пункте состоит из фамилии и версии
Критерии оценки: успешный запуск контейнера crate_api, скриншот страницы в браузере с адресом localhost:8000
и вывод комманды docker inspect | grep Image

Решение
1)Добработал скрипт
https://github.com/ugaidmitry/cloudcicd/blob/master/hw8/config.sh 

2)Добавил стайдж DEPLOY
https://github.com/ugaidmitry/cloudcicd/blob/master/hw8/.gitlab-ci.yml

скриншот работы https://github.com/ugaidmitry/cloudcicd/blob/master/hw8/8000port.png
docker inspect https://github.com/ugaidmitry/cloudcicd/blob/master/hw8/docker%20inspect.png
















