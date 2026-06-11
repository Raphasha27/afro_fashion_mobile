FROM cirrusci/flutter:3.27 AS builder

WORKDIR /app

COPY pubspec.yaml pubspec.lock* ./
RUN flutter pub get

COPY . .

RUN flutter build apk --release

FROM alpine:3.20

RUN apk add --no-cache ca-certificates

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=builder /app/build/app/outputs/flutter-apk/app-release.apk .

USER appuser

CMD ["echo", "Build artifact: app-release.apk"]
