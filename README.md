# My Ruby on Rails API

This is an API built with Ruby on Rails 7.1.3 and Ruby 3.2.2. The database used is SQLite, and environment variables are managed with dotenv. The API is mounted on the `api::v1::` module and uses JWT for authentication. The server runs on port 3001.

## Requirements

- Ruby 3.2.2
- Rails 7.1.3
- SQLite
- dotenv

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/al-lo-co/products_api
    cd products_api
    ```

2. **Install the required gems:**

    ```bash
    bundle install
    ```

3. **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

4. **Set up environment variables:**

    Create a `.env` file in the root of the project and add your environment variables. For example:

    ```plaintext
    AUTHENTICATION_TOKEN=your-auth-key
    ```

5. **Run the server:**

    ```bash
    rails server -p 3001
    ```

## API Endpoints

The API is mounted on the `api::v1::` module. Here are some example endpoints:

- **Products registration:**

    ```http
    POST /api/v1/products
    ```

- **Product index:**

    ```http
    POST /api/v1/login
    ```

- **Get Product:**

    ```http
    GET /api/v1/products/:id
    ```

## Authentication

This API uses JWT for authentication. To access protected routes, you need to include the JWT token in the `Authorization` header of your requests:

```http
Authorization: Bearer your_jwt_token
