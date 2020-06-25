Разработка пайплайна для деплоя приложения в AZURE 
https://github.com/hkalexling/Mango

Репозиторий:https://gitlab.com/dmug999/ugai/-/blob/master/.gitlab-ci.yml
Слайды:https://github.com/ugaidmitry/cloudcicd/blob/master/projecrt/ugaidmitry.odp

Реализовано 

stages:

    - build
    
    - deploy_dev_azure #динамическое окружение
    
    - remove_dev_azure #динамическое окружение
    
    - deploy_to_stage #динамическое окружение
    
    - deploy_to_prod
    
    
    
    Они запускаются в локальном GITLAB CE (virtual box)
    
    Контейнер деплоится в AZURE CONTAINER REGISTRY и далее разворачивается через AZURE WEB APP 
    
    (c помощью mango - deploytoprod https://github.com/ugaidmitry/cloudcicd/blob/master/projecrt/webhook.png) при каждом пуше в ACR
    
    с тегом mango:latest разворачивается контейнер с приложением который доступен по адресу dmug.fun



