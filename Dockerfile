FROM centos:latest

ARG AQUA_USERNAME
ARG AQUA_PASSWORD
 
RUN curl -u ${AQUA_USERNAME}:${AQUA_PASSWORD}  https://download.aquasec.com/scanner/2022.4.46/scannercli-arm64 --output scannercli-arm64 
RUN echo ${AQUA_USERNAME} && echo ${AQUA_PASSWORD}
RUN chmod +x scannercli-arm64 
CMD ["./scannercli-arm64"]
