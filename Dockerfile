FROM dart:2.19.0-374.2.beta AS build
# FROM dart:2.19.0-146.1.beta AS build
# FROM dart:2.18.5 AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get
COPY . .
CMD ["dart", "run", "/app/bin/demo.dart"]
