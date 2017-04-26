FROM geodata/gdal:2.1.3

LABEL maintainer="Nick Buchanan <nbuchanan@gmail.com>"

# Set primary directory
ENV APP_DIR /app

# Install needed Python libraries and create relevant directories
RUN pip install logging boto psutil && mkdir -p ${APP_DIR}/data ${APP_DIR}/tmp /z/mrfcache ${APP_DIR}/output

# Copy current snapshot of code to container
COPY . ${APP_DIR}

# Set working directory to app location
WORKDIR ${APP_DIR}

# Override default configuration with Docker specific configuration
RUN mv OptimizeRasters-Docker.xml OptimizeRasters.xml

# Set default operation
ENTRYPOINT ["python", "OptimizeRasters.py"]