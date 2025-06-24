
# Reverse Proxy with NGINX and Docker Compose

This project sets up a reverse proxy architecture using ****NGINX**** and ****Docker Compose**** to run and route two backend services: one written in ****Go**** and the other in ****Python**** and an optional ****cAdvior**** container for monitoring. All services are containerized and accessible via a single port.

---

## Setup Instructions

1. ****Clone the repository****:

   ```bash
   git clone https://github.com/KBALAJI2212/docker_assignment_dpdzero.git
   ```

2. ****Start services****:

   ```bash
   docker-compose up -d
   ```

3. ****Access the services****:

   - [http://localhost:8080/service1](http://localhost:8080/service1) with /ping /hello → Go backend
   - [http://localhost:8080/service2](http://localhost:8080/service2) with /ping /hello → Python backend

   ****Recommended****:
   - You can either manually test the Health Check URLs (or) if you prefer quick testing, run the --- __**test-script.sh**__--- which will test all health checks.
    ```bash
    bash test-script.sh
   ```
---

## How Routing Works

An **NGINX container** on port `8080` is used as a reverse proxy to route traffic based on path.

| URL Path     | Routed To |
|--------------|----------------|
| `/service1`  | Go service |
| `/service2`  | Python service |

-Created a custom network called **dpdzero** for services.

-Uses **bridge networking** to communicate with both backend containers.(not accessible from outside the network.)

---
## Health Checks

Both backend services include Docker health checks to ensure containers are running properly. The status can be verified using:

```bash
docker ps (look for healthy status)
```

---

## Logging

NGINX logs all incoming requests with:

- ****Timestamp****
- ****Request Path****


Logs can be viewed using:

```bash
docker logs nginx
```

---

## Bonus Implementations
-- Implemented cAdvisor for Container and Host insights. 

Can be accessed from:     [http://localhost:8081/](http://localhost:8081) → cAdvisor dashboard.

-- Health checks for both service containers.

-- Request logging with timestamp and path.

-- Bash Script for automating health check tests.

---
