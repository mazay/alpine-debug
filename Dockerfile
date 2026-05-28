FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:3.23.4
ARG TARGETPLATFORM
LABEL maintainer="Yevgeniy Valeyev <z.mazay@gmail.com>"

# hadolint ignore=DL3018
RUN apk --no-cache add ca-certificates \
    bash \
    curl \
    wget \
    httpie \
    tcptraceroute \
    mtr \
    bind-tools
