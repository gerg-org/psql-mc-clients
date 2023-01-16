

# Copying the mc binary out of the mc image is _muuuuch_ faster than downloading it from their CDN
FROM minio/mc:latest as mc

# Start from alpine as base
FROM alpine:3

# Bitnami's kubectl image (correctly) runs as non-root, but to install our tooling, we'll
# need to temporarily elevate to root during the build process
USER root

# Install apt-based tooling we'll need, ignoring the specific versions (thanks, hadolint!)
# hadolint ignore=DL3008
RUN apk --no-cache add postgresql14-client

# Now become the non-privileged user again
USER 1001
ENTRYPOINT [ "/bin/ash" ]
