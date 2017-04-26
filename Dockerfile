FROM geodata/gdal:2.1.3

LABEL maintainer="Nick Buchanan <nbuchanan@gmail.com>"

ENV APP_DIR /app

RUN pip install logging boto psutil && \
    mkdir -p ${APP_DIR}/data  && \
    mkdir -p ${APP_DIR}/tmp  && \
    mkdir -p /z/mrfcache  && \
    mkdir -p ${APP_DIR}/output

COPY . ${APP_DIR}

WORKDIR ${APP_DIR}

ENTRYPOINT ["python", "OptimizeRasters.py"]