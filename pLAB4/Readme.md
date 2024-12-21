# LAB 4 

# Overview
pLAB4 is a Java-based project that utilizes various technologies including Spring Boot, Angular, and Maven for building a robust web application. This project is designed to demonstrate the integration of front-end and back-end technologies, providing a seamless user experience.

# Table of Contents
- Features
- Technologies Used
- Installation
- Usage
- Project Structure
- Contributing
- License

# Features
- Spring Boot: A powerful framework for building Java applications with ease.
- Angular: A modern front-end framework for building dynamic web applications.
- Maven: A build automation tool used for managing project dependencies.
- RESTful API: Provides a backend service that can be consumed by the Angular frontend.
- Responsive Design: Ensures the application is usable on various devices.

# Technologies Used
- Java 17
- Spring Boot
- Angular 18
- Maven
- HTML/CSS
- TypeScript
- Git

# Installation
To set up the project locally, follow these steps:

## Clone the repository:
``
git clone https://github.com/Medamine-Bahassou/LABs-JEE.git
cd pLAB4
``
## Install dependencies:

### For the backend (Spring Boot):
``
cd backend
mvn install
``

### For the frontend (Angular):
``
cd frontend
npm install
``

## Run the application:

### Start the backend server:
``
cd backend
mvn spring-boot:run
``

### Start the frontend application:
``
cd frontend
ng serve
``

### Access the application:
Open your web browser and navigate to http://localhost:4200 to view the application.

# Usage
The application provides a user-friendly interface for interacting with the backend services. Users can perform various operations as defined in the application features. Refer to the documentation for specific usage instructions related to the functionalities provided.

# Project Structure
The project is organized as follows:

``
/pLAB4
│
├── /backend                # Spring Boot backend
│   ├── src
│   ├── pom.xml            # Maven configuration file
│   └── ...
│
├── /frontend               # Angular frontend
│   ├── src
│   ├── package.json        # NPM configuration file
│   └── ...
│
└── README.md               # Project documentation
``

# Contributing
Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (git checkout -b feature/YourFeature).
3. Make your changes and commit them (git commit -m 'Add some feature').
4. Push to the branch (git push origin feature/YourFeature).
5. Open a pull request.
