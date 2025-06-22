# Changelog

All notable changes to this project will be documented in this file.

## [v1.0.0] - 2025-06-22
### Added
- `/health` endpoint to check application status.
- `/products` endpoint to retrieve all products.
- Basic CRUD operations: 
  - `POST /addProduct`
  - `POST /addProducts`
  - `GET /productById/{id}`
  - `GET /product/{name}`
  - `PUT /update`
  - `DELETE /delete/{id}`

## [v1.1.0] - 2025-06-22
### Added
- `/products/search?keyword=...` endpoint for searching products by name using a keyword.

## [v2.0.0] - 2025-06-22
### Enhanced
- Improved `/products/search` endpoint with:
  - Case-insensitive partial matching.
  - Validation and error handling for missing query parameters.
  - Response wrapping with helpful messages.