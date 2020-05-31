Для указанного в ДЗ пайплайна (в Gitlab, Amazon Web Services или Azure DevOps на выбор) 
настроить проверку на поиск уязвимостей.


Добавил контейнер с DAST  дев окружение
https://gitlab.com/dmug999/ugai/-/blob/featureone/stackdev.yml

При развертываении дев окружения запускается контейнер owasp_zap2docker-stable:latest 
с UI где тестировщик может потестить сайт

https://github.com/ugaidmitry/cloudcicd/blob/master/hw11/owasp_zap2docker-stable:latest.png

