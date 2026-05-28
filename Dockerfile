FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:3.14.0
ARG TARGETPLATFORM
LABEL maintainer="Yevgeniy Valeyev <z.mazay@gmail.com>"

# hadolint ignore=DL3018
RUN apk --no-cache add ca-certificates \
                       bash \
                       curl \
                       tcptraceroute \
                       bind-tools
