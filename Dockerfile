# ---- Stage 1: Build ----
FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ---- Stage 2: Run ----
FROM openjdk:8-jre-slim
WORKDIR /app

# Copy only the built JAR from the previous stage
COPY --from=build /app/target/*.jar app.jar

# App port
EXPOSE 8080

# Healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/health || exit 1

COPY wait.sh .
RUN chmod +x wait.sh 

ENTRYPOINT ["./wait.sh", "mysql-db", "java", "-jar", "app.jar"]