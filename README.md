# DevOps Monitoring Platform

## Project Goal

Build a DevOps Monitoring Platform from scratch while learning real-world DevOps tools and workflows.

The project begins with Linux and Bash scripting and will evolve into a complete deployment pipeline using:

* Linux
* Bash
* Git & GitHub
* Flask
* Docker
* GitHub Actions
* Azure
* Kubernetes

The goal is to understand each component deeply enough to explain it in a technical interview and demonstrate practical DevOps skills through a working project.

---

## Current Features

### Linux Monitoring Script

The current version collects and displays:

* CPU information
* Memory usage
* Disk usage
* Current user
* Current directory
* Date and time

The script also includes:

* Variables
* Command substitution
* Pipes
* Conditional logic
* Threshold checks
* Logging

---

## Current Project Structure

```text
Devops-Lab/
├── scripts/
│   ├── hello.sh
│   └── system-info.sh
├── logs/
├── README.md
```

---

## Skills Practiced

* Linux Command Line
* Bash Scripting
* Variables
* Command Substitution
* Pipes
* grep
* awk
* Conditional Statements
* Memory Monitoring
* Disk Monitoring
* Logging

---

## Planned Architecture

```text
Linux Monitoring Script
        ↓
     Flask API
        ↓
 Docker Container
        ↓
 GitHub Actions
        ↓
 Azure Deployment
        ↓
 Kubernetes
```

---

## What I Learned

* How Linux system information is collected
* How Bash variables store data
* How command output can be filtered using pipes
* How monitoring scripts calculate resource usage
* How conditional logic generates warnings
* How logging captures system information

---

## Next Steps

* Create Flask API
* Containerize application with Docker
* Build CI/CD pipeline with GitHub Actions
* Deploy to Azure
* Deploy to Kubernetes
* Create dashboard and monitoring views

---

## Author

Erick Rodriguez

Building practical DevOps skills through hands-on projects and real-world deployment workflows.
