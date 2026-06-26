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

The goal is to build practical experience with modern DevOps tools and workflows by developing a monitoring platform from the ground up.

Each stage of the project focuses on understanding not only how the technology works, but also the problem it solves in a real-world environment.

---

## Current Features

### Linux Monitoring Toolkit

The current version of the project includes a Bash-based monitoring script that collects, calculates, and reports system resource usage.

Current capabilities include:

* CPU utilization monitoring
* Memory utilization monitoring
* Disk utilization monitoring
* Configurable warning thresholds
* Timestamped logging to `system.log`
* Continuous monitoring mode
* Current user detection
* Reusable Bash functions to reduce duplicated code

The project demonstrates practical Linux administration and Bash scripting concepts including:

* Variables
* Command substitution
* Functions
* Conditional statements
* Loops
* Pipes
* `grep`
* `awk`
* `tr`
* Logging
* Threshold-based monitoring

---

## Current Project Structure

```text
Devops-Lab/
├── scripts/
│   ├── system-info.sh
│   └── system.log
├── README.md
```

---

## Skills Practiced

* Linux Command Line
* Bash Scripting
* Git & GitHub
* Variables
* Command Substitution
* Functions
* Conditional Statements
* Loops
* Pipes
* `grep`
* `awk`
* `tr`
* CPU Monitoring
* Memory Monitoring
* Disk Monitoring
* Threshold-Based Monitoring
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
