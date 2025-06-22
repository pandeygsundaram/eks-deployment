# ---- Stage 1: Build ----
FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ---- Stage 2: Run ----
FROM openjdk:8-jre-slim
WORKDIR /app

# Install wget for healthcheck
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy only the built JAR from the previous stage
COPY --from=build /app/target/*.jar app.jar

# App port
EXPOSE 8080

# Healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8000/health || exit 1


ENTRYPOINT [ "java", "-jar", "app.jar"]