FROM ubuntu:slim

LABEL org.label-schema.build-date=$(BUILD_DATE) \
      org.label-shema.vcs-ref=$(GIT_SHA) \
      org.label-schema.vendor="gruen" \
      org.label-schema.name="remmina" \
      site.gruen.author="Darren Green <darren@gruen.site>" \
      site.gruen.version=$(VERSION)

RUN apt-get update \
    && apt-get install remmina -y

CMD ["remmina"]
