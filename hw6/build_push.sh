tee $DOCKERFILE <<-EOL
FROM node:current-alpine
RUN addgroup -S app && adduser -SDH -g "" -G app app
COPY code /code
RUN cd /code/api && npm run setup && cd /code/web && npm run setup
WORKDIR ${WORKDIR}
USER app
EXPOSE ${EXPOSE_PORT}
ENTRYPOINT ["npm", "start"]
EOL
docker build --no-cache -t ${IMAGE_NAME}:${VERSION} -f ${DOCKERFILE} .