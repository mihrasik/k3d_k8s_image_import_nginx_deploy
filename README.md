# Theme Park Ride Operations Project

## Overview
This project is designed to manage operations for a theme park ride using Kubernetes. It includes a Dockerized Nginx application and a MariaDB database, deployed in a k3s cluster. The project follows best practices for DevOps and container orchestration.

## Project Structure
```
theme-park-ride-ops-5
├── k8s
│   ├── nginx-deployment.yaml      # Kubernetes deployment configuration for Nginx
│   ├── nginx-service.yaml         # Kubernetes service definition for Nginx
│   ├── vars.yaml                  # Variables for deployment configuration
│   └── .env                       # Environment variables for Kubernetes deployment
├── scripts
│   └── deploy-to-k8s.sh           # Script to deploy the application to Kubernetes
├── Dockerfile                      # Dockerfile for building the Nginx container
├── .env                            # Environment variables for the overall project
└── README.md                       # Project documentation
```

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd theme-park-ride-ops-5
   ```

2. **Install Dependencies**
   Ensure you have Docker and k3d installed. You can use the provided Ansible playbook to install necessary DevOps tools.

3. **Build the Docker Image**
   Use the Dockerfile to build the Nginx container image:
   ```bash
   docker build -t nginx-ssh .
   ```

4. **Create a Tar Archive of the Image**
   Save the Docker image as a tar file:
   ```bash
   docker save nginx-ssh -o nginx-ssh.tar
   ```

5. **Deploy to Kubernetes**
   Run the deployment script:
   ```bash
   ./scripts/deploy-to-k8s.sh
   ```

## Configuration Files

- **k8s/nginx-deployment.yaml**: Contains the deployment configuration for the Nginx container, including SSH accessibility settings.
- **k8s/nginx-service.yaml**: Defines the service for the Nginx deployment, specifying how to access the application.
- **k8s/vars.yaml**: Stores sensitive information such as passwords, logins, and network configurations.
- **k8s/.env**: Contains environment variables used during the Kubernetes deployment process.
- **.env**: General environment variables for the project.

## Usage
After deployment, you can access the Nginx application through the specified service. Ensure that the necessary ports are open and configured correctly.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.