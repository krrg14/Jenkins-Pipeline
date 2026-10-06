# Jenkins-Pipeline
This project demonstrates an end-to-end CI/CD pipeline using Jenkins, GitHub, Node.js, and Docker.
Whenever code is pushed to GitHub, Jenkins can automatically trigger the pipeline, install dependencies, test the application, build a Docker image, and deploy the application as a Docker container.

# 🏗️ Architecture
```
Developer
   │
   ▼
GitHub Repository
   │
   │ Webhook
   ▼
Jenkins
   │
   ├── Checkout Code
   ├── Install Dependencies
   ├── Run Tests
   ├── Build Application
   ├── Build Docker Image
   ├── Push Docker Image
   └── Deploy Container
          │
          ▼
       Docker
          │
          ▼
     Node.js Application  
```

## 🛠️ Technologies Used
- Git & GitHub
- Jenkins
- Jenkins Pipeline
- Node.js / npm
- Docker
- Linux
- GitHub Webhook
- AWS EC2

## 📂 Project Structure
```
Jenkins-Pipeline/
│
├── app.js
├── package.json
├── package-lock.json
├── Dockerfile
├── Jenkinsfile
└── README.md
```

## workflow

```
git push
   ↓
GitHub Webhook
   ↓
Jenkins
   ↓
Checkout
   ↓
npm ci
   ↓
Test
   ↓
Docker Build
   ↓
Docker Push
   ↓
Docker Deploy
```
# SNAPSHOT
<img width="1919" height="1013" alt="Screenshot 2026-10-07 023206" src="https://github.com/user-attachments/assets/dcd43ea1-232b-4e9c-8560-a656156d6b23" />

---

<img width="1806" height="1024" alt="Screenshot 2026-10-07 023045" src="https://github.com/user-attachments/assets/8c54a54a-f017-480a-a42a-b44866d25c10" />

---
