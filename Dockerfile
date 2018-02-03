FROM alpine:3.7

LABEL org.label-schema.build-date=$(BUILD_DATE) \
      org.label-shema.vcs-ref=$(GIT_SHA) \
      org.label-schema.vendor="gruen" \
      org.label-schema.name="remmina" \
      site.gruen.author="Darren Green <darren@gruen.site>" \
      site.gruen.version=$(VERSION) \
      site.gruen.tag="alpine:3.7"

CMD ["remmina"]

RUN apk add --no-cache --upgrade remmina
