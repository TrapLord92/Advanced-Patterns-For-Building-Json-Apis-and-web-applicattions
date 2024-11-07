
---

# 🎬 Movie API - A Golang Project for Movie Lovers!

Welcome to **Movie API**, a fully featured RESTful API built in **Golang** for managing movie data. This API supports CRUD operations, user authentication, and integration with **Nexus** for artifact management, with a CI/CD pipeline set up using **Jenkins**.

## 🚀 Features

- **Full CRUD Operations**: Create, read, update, and delete movies with ease.
- **Filter, Sort & Paginate**: Search and organize movie data.
- **User Registration & Authentication**: Secure user access with token-based authentication.
- **Welcome & Activation Emails**: Send welcome and account activation emails automatically.
- **Monitoring & Logging**: Includes structured logging, error handling, rate limiting, and application health checks.
- **Cross-Origin (CORS) Support**: Access the API across different origins.
- **Metrics**: Track usage and performance stats with built-in metrics.

## 🔧 CI/CD Pipeline with Jenkins and Nexus

This project comes with an automated **CI/CD pipeline** to streamline your development process:

- **Jenkins**: Automates the build and deployment process.
- **Nexus**: Manages Docker images and binary artifacts.
- **Docker**: Containerizes the application for easy deployment.

The pipeline handles building, testing, and pushing Docker images to **Nexus**, as well as publishing raw artifacts for your movie API project.

## 🛠 Getting Started

### Prerequisites

Make sure you have the following:

- **Go 1.23.1**
- **PostgreSQL** for data storage
- **Docker** (optional, for containerization)
- **Nexus** repository for Docker and raw file storage
- **Jenkins** (for CI/CD pipeline automation)

### Database Configuration

To configure your database, fill in the following details:

1. **Set up your PostgreSQL database** with your credentials.
2. **Update the `.env` file** with your **Greenlight DB** credentials:

```bash
DB_USER=<your_db_user>
DB_PASSWORD=<your_db_password>
export GREENLIGHT_DB_DSN="postgres://<your_db_user>:<your_db_password>@db/<your_db_name>?sslmode=disable"
DB_NAME=<your_db_name>
```

### Setup

1. **Clone This Project**
   ```bash
   git clone https://github.com/yourusername/Advanced-Patterns-For-Building-Json-Apis-and-web-applicattions.git
   cd greenlight
   ```

2. **Configure Environment Variables**  
   Set up the `.env` file with your database and email configurations.

3. **Run Database Migrations**
   ```bash
   make db/migrations/up
   ```

4. **Start the API Server**
   ```bash
   make run/api
   ```

You're ready to start using the API! 🎉

## 📚 API Endpoints

### Health Check
- `GET /v1/healthcheck` - Show app health and version info.

### Movies
- `GET /v1/movies` - Show details of all movies.
- `POST /v1/movies` - Create a new movie.
- `GET /v1/movies/:id` - Show details of a specific movie.
- `PATCH /v1/movies/:id` - Update details of a specific movie.
- `DELETE /v1/movies/:id` - Delete a specific movie.

### User Management
- `POST /v1/users` - Register a new user.
- `PUT /v1/users/activated` - Activate a user account.
- `PUT /v1/users/password` - Update a user's password.

### Authentication & Tokens
- `POST /v1/tokens/authentication` - Generate an authentication token.
- `POST /v1/tokens/password-reset` - Generate a password-reset token.

### Metrics
- `GET /debug/vars` - Display application metrics.

## 📋 Makefile Commands Overview

The project includes a **Makefile** for interacting with the application, running migrations, building the API, and working with Docker. Below are the commands you can use:

### General Commands

- **`make help`**: Display all available commands.
- **`make confirm`**: Confirm an action (e.g., database migration).

### Development

- **`make run/api`**: Start the application.
- **`make db/psql`**: Connect to the database via psql.
- **`make db/migrations/new name=<name>`**: Create a new database migration.
- **`make db/migrations/up`**: Apply database migrations.

### Quality Control

- **`make audit`**: Run code formatting, vetting, and testing.
- **`make vendor`**: Manage dependencies and vendor them.

### Build and Docker Operations

- **`make build/api`**: Build the API application.
- **`make docker-build`**: Build the Docker image.
- **`make docker-tag-with-repo`**: Tag the Docker image for Nexus repository.
- **`make docker-push`**: Push the Docker image to Nexus.
- **`make raw-push`**: Push the binary artifact to Nexus.
- **`make publish`**: Publish both Docker image and raw file to Nexus.
- **`make clean`**: Clean up generated files.

### Information and Debugging

- **`make info`**: Display configuration details like Nexus URL, repository, project name, and more.

---

