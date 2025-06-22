# Changelog

All notable changes to this project will be documented in this file.

## [2.0.1](https://github.com/pandeygsundaram/eks-deployment/compare/v2.0.0...v2.0.1) (2025-06-22)


### Bug Fixes

* add permissions ([bebee79](https://github.com/pandeygsundaram/eks-deployment/commit/bebee799467a8f0e6412aee7051a89d61910a3bf))
* add release automation via Release Please ([ff6f780](https://github.com/pandeygsundaram/eks-deployment/commit/ff6f7803bf3a754547f11233026af7816715f8b8))

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
