FROM ortussolutions/commandbox:latest
COPY ./app /app


# WARM UP THE SERVER WITH THE NEW EXTENSION
RUN ${BUILD_DIR}/util/warmup-server.sh