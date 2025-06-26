# Changelog

All notable changes to this project will be documented in this file.

## [2.2.0](https://github.com/pandeygsundaram/eks-deployment/compare/v2.1.0...v2.2.0) (2025-06-26)


### Features

* add latest namespace ([24ac04a](https://github.com/pandeygsundaram/eks-deployment/commit/24ac04ab9055bf7cfa97cec0a057fa9ba6577930))
* add terraform ([08bf013](https://github.com/pandeygsundaram/eks-deployment/commit/08bf013a786af4ec739678fb8e836fc5de1da39f))
* code refactor ([51b0b02](https://github.com/pandeygsundaram/eks-deployment/commit/51b0b02c666140498bacf7419f84b02568cd695d))
* more fixes ([b84c4a1](https://github.com/pandeygsundaram/eks-deployment/commit/b84c4a1ca296eb46120781c1f477cdf305f5a6ba))


### Bug Fixes

* add server address ([868ff8b](https://github.com/pandeygsundaram/eks-deployment/commit/868ff8bf4c7a631b313e6a85bcf03172bf5f44fc))
* add storageClassName to mysql PVC ([7121939](https://github.com/pandeygsundaram/eks-deployment/commit/7121939049000800318e7e637f371938ea4e953b))
* iam policy modify ([7924724](https://github.com/pandeygsundaram/eks-deployment/commit/792472434085840ad7a6acc499d5f4048ebd5140))
* iam policy modify 2 ([6c73830](https://github.com/pandeygsundaram/eks-deployment/commit/6c73830c6d6d3b4f77bb4ae0a2b43bcc08b273d5))
* minor fix ([7d89b8f](https://github.com/pandeygsundaram/eks-deployment/commit/7d89b8f3a577c6fd169ad7e297cc69e608b422a5))

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
