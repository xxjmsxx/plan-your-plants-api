# Plan Your Plants API

Welcome to the backend API for Plan Your Plants, a web application designed to help users manage their plant collections and care routines.

## Overview

Plan Your Plants API provides endpoints to manage plant data, user authentication, and user profiles. It is built with Ruby on Rails and integrates seamlessly with the Plan Your Plants frontend, built in React.

## Installation

To run the Plan Your Plants API locally, follow these steps:

1. Clone this repository.
2. Install Ruby (version X.X.X) and Rails (version X.X.X).
3. Install dependencies with `bundle install`.
4. Set up database configurations in `config/database.yml`.
5. Run migrations with `rails db:migrate`.
6. Start the Rails server with `rails s`.

## Configuration

The following environment variables are required for configuration:

- `DATABASE_URL`: Connection string for the database.
- `SECRET_KEY_BASE`: Secret key for Rails.

## Usage

### Authentication

The API uses JWT (JSON Web Token) for authentication. Include the token in the `Authorization` header for protected endpoints.

### API Endpoints

#### Plants

- `GET /api/plants`: Retrieve all plants.
- `POST /api/plants`: Create a new plant.
- `GET /api/plants/:id`: Retrieve details of a specific plant.
- `PUT /api/plants/:id`: Update details of a specific plant.
- `DELETE /api/plants/:id`: Delete a specific plant.

#### Users

- `POST /api/signup`: Create a new user account.
- `POST /api/login`: Authenticate and log in a user.
- `GET /api/user/profile`: Retrieve the authenticated user's profile information.

### Example Requests

#### Creating a New Plant

```http
POST /api/plants
Content-Type: application/json
Authorization: Bearer {token}

{
  "name": "Monstera Deliciosa",
  "species": "Monstera deliciosa",
  "watering_schedule": "Every 7-10 days",
  "light_requirements": "Indirect sunlight"
}
