FROM python:2.7
RUN apt-get update && apt-get -y install cron
RUN pip install --no-cache-dir elasticsearch-curator
ENV CURATOR_PATH /curator
RUN mkdir -p ${CURATOR_PATH} && chmod -R 777 ${CURATOR_PATH}
ENV PATH $CURATOR_PATH:$PATH
WORKDIR ${CURATOR_PATH}
RUN touch log.log
ADD crontab .
ADD run-curator.sh .
ADD entrypoint.sh .
RUN echo PATH=$PATH > curator-cron && echo CURATOR_PATH=$CURATOR_PATH && cat crontab >> curator-cron
RUN chmod 777 entrypoint.sh run-curator.sh log.log
RUN crontab curator-cron
RUN touch actions.yml && touch config.yml
ENTRYPOINT ["entrypoint.sh"]
