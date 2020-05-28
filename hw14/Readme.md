Для указанного в ДЗ пайплайна (в Gitlab, Amazon Web Services или Azure DevOps на выбор) 
реализовать динамическое формирование окружения для развертывания feature-branch веток.

1)Создал кластер docker-swarm (manager - worker)
2)Настроил DNS для GITLAB CE - DIMA.COM и dev.com (regexp для субдоменов - чтобы использовать dynamic enviroment)
3)Код запушил на гитлаб
В итоге имеем две стадии
stages:
    - stage
    - production
    
    
