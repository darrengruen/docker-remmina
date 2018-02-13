FROM debian:jessie 

CMD ["remmina"]

ENTRYPOINT ["remmina"]

RUN apt-get update \
    && apt-get install -y remmina

ARG BUILD_DATE
ARG GIT_SHA

LABEL org.label-schema.build-date=$(BUILD_DATE) \
      org.label-shema.vcs-ref=$(GIT_SHA) \
      org.label-schema.vendor="gruen" \
      org.label-schema.name="remmina \
      site.gruen.author="Darren Green <darren@gruen.site>" \
      site.gruen.tag="alpine:3.1"

