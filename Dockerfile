ARG REPOSITORY_ARG=ortussolutions/commandbox
FROM $REPOSITORY_ARG
COPY ./app /app
COPY ./warm.sh ${BUILD_DIR}/util/warm.sh
RUN chmod +x ${BUILD_DIR}/util/warm.sh

# WARM UP THE SERVER and install CFPM
RUN ${BUILD_DIR}/util/warm.sh

# WARM UP THE SERVER
# RUN ${BUILD_DIR}/util/warmup-server.sh