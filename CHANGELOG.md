# Changelog

All notable changes to this project will be documented in this file.

## [2.1.0](https://github.com/pandeygsundaram/eks-deployment/compare/v2.0.1...v2.1.0) (2025-06-23)


### Features

* contanerised the application ([3fd2578](https://github.com/pandeygsundaram/eks-deployment/commit/3fd25781fc73bceaa9292be0f76e9fe2fe81bc06))


### Bug Fixes

* add files to track commits ([4835bf1](https://github.com/pandeygsundaram/eks-deployment/commit/4835bf121d826a0f8dc8ebd993804f2b813c4683))
* more fixes ([be1c5aa](https://github.com/pandeygsundaram/eks-deployment/commit/be1c5aaf83618cc247d0da850e2110526091ad45))
* optimisation in docker image ([405192d](https://github.com/pandeygsundaram/eks-deployment/commit/405192d47227ea04dad72cf4038d441e31b94dbe))
* properties updated ([d91e1be](https://github.com/pandeygsundaram/eks-deployment/commit/d91e1be72dc759309b57c92fdfea30f007afccf0))

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
