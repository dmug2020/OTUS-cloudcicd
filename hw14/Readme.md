Для указанного в ДЗ пайплайна (в Gitlab, Amazon Web Services или Azure DevOps на выбор) 
реализовать динамическое формирование окружения для развертывания feature-branch веток.

1)Создал кластер docker-swarm (manager - worker) https://github.com/ugaidmitry/cloudcicd/blob/master/hw14/swarm.png

2)Настроил DNS для GITLAB CE - DIMA.COM и dev.com https://github.com/ugaidmitry/cloudcicd/blob/master/hw14/dns%20home.png
(regexp для субдоменов - чтобы использовать dynamic enviroment)

3)Код запушил на гитлаб https://gitlab.com/dmug999/ugai


В итоге имеем две стадии
stages:
    - stage
    - production

при при пушинге в branche - featureone - руками можно запустить окружение 
environment:
        name: stage/$CI_COMMIT_REF_NAME
        url: http://$CI_COMMIT_REF_SLUG.dev.com:8090 https://github.com/ugaidmitry/cloudcicd/blob/master/hw14/featureone.png
а также удалить его

stage-env-destroy:
    stage: stage
    variables:
      GIT_STRATEGY: none
      DOCKER_HOST: tcp://192.168.1.19:2376
      DOCKER_TLS_VERIFY: 1
      DOCKER_CERT_PATH: "/certs"
       
    tags:
    - dima
    before_script:
        #- eval $(ssh-agent -s)
        #- ssh-add <(echo "$SSH_PRIVATE_KEY")
    script:
    - echo "Destroy stage"
    - docker stack rm stage   --- здесь удаляем наш стек 
    - rm -rf $DOCKER_CERT_PATH
  
   
    environment:
        name: stage/$CI_COMMIT_REF_NAME
        url: http://$CI_COMMIT_REF_SLUG.dev.com
        action: stop
     
    when: manual  
    
 Также в пайплайне можно запушить в продакшен

prod-env:
      stage: production
      variables:
        DOCKER_HOST: tcp://192.168.1.19:2376 
        DOCKER_TLS_VERIFY: 1
        DOCKER_CERT_PATH: "/certs"
         
      tags:
      - dima
      before_script:
          #- eval $(ssh-agent -s)
          #- ssh-add <(echo "$SSH_PRIVATE_KEY")
      script:
      - echo "Deploy to production"
      - mkdir -p $DOCKER_CERT_PATH
      - echo "$TLSCACERT" > $DOCKER_CERT_PATH/ca.pem
      - echo "$TLSCERT" > $DOCKER_CERT_PATH/cert.pem
      - echo "$TLSKEY" > $DOCKER_CERT_PATH/key.pem
      
      - docker login dima.com:4567 -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD
      - docker pull dima.com:4567/root/mango:latest  --- скачиваем образ с тегом лайтест
     
      
      - docker stack deploy -c stack.yml prod --with-registry-auth
      - rm -rf $DOCKER_CERT_PATH

     
      environment:
          name: production/$CI_COMMIT_REF_NAME
          url: http://dev.com --- это наш продакешен 
          сайт https://github.com/ugaidmitry/cloudcicd/blob/master/hw14/poruction%20env.png
      
      only:
        - master
     
      when: manual

