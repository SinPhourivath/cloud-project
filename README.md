## Local Setup Instructions

1. Clone the repository: `git clone <repo-url>`
2. Install Docker
3. Build the Docker image: `docker build -t todo-app .`
4. Run the container: `docker run -d -p 3000:3000 --name todo-app-container todo-app`
5. Access the application at: `http://localhost:3000`