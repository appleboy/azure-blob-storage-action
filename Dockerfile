# Rebuild the original release with a patched Go runtime and supported Alpine.
FROM --platform=$BUILDPLATFORM golang:1.26.8-alpine AS build
ARG TARGETOS
ARG TARGETARCH
WORKDIR /src
ADD https://codeload.github.com/appleboy/azure-blob-storage/tar.gz/298596541772f65d3d4b46df14a0786fbc4542f2 /tmp/source.tar.gz
RUN echo "3dd13ce31af887bedfbcab96980f6eb1d7c40f96541e0f2b8447588dde13baef  /tmp/source.tar.gz" | sha256sum -c - \
    && tar -xzf /tmp/source.tar.gz --strip-components=1 -C /src \
    && CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -trimpath -o /bin/azure-blob-storage .

FROM alpine:3.23
RUN apk add --no-cache ca-certificates
COPY --from=build /bin/azure-blob-storage /bin/azure-blob-storage
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
