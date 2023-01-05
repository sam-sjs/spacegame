FROM eclipse-temurin:17-jdk-jammy as base

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
COPY src ./src

FROM base as test
RUN ["./mvnw", "test"]

FROM base as build
RUN ./mvnw package

FROM eclipse-temurin:17-jdk-jammy as production
COPY --from=build /app/target/spacegame-*.jar /spacegame.jar
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spacegame.jar"]
