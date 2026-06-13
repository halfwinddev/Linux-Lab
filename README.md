# Linux Lab — Self-Healing Nginx Monitoring

## Overview

This project demonstrates a lightweight self-healing Linux service monitoring setup using:

* Ubuntu (WSL2)
* systemd
* nginx
* Bash scripting
* cron automation
* logging and recovery workflows

The objective was to understand how Linux services, networking, daemons, and automation interact in a real operational workflow.

---

## Architecture

```text
Linux Node
├── nginx daemon
├── monitoring script
├── cron scheduler
└── recovery logging
```

Flow:

```text
nginx failure
↓
cron executes monitor script
↓
script checks service state
↓
service automatically restarted
↓
event logged with timestamp
```

---

## Technologies Used

* Ubuntu 24.04 (WSL2)
* systemd
* nginx
* Bash
* cron
* curl
* SSH

---

## Key Concepts Practiced

### Linux Services

Managed services using `systemctl`.

Examples:

```bash
systemctl status nginx
systemctl start nginx
systemctl stop nginx
```

---

### SSH and Remote Operations

Configured and tested SSH locally using:

```bash
ssh localhost
```

This demonstrated:

* daemon-based remote access
* localhost networking
* authenticated shell sessions
* port-based communication

---

### Socket and Port Inspection

Used:

```bash
ss -tulnp
```

to inspect:

* listening services
* ports
* TCP/UDP sockets
* daemon ownership

---

### HTTP Service Validation

Validated nginx functionality using:

```bash
curl localhost
```

This simulated a local HTTP client request to the nginx daemon.

---

## Monitoring Script

`monitor_nginx.sh`

```bash
#!/bin/bash

if ! systemctl is-active --quiet nginx
then
    echo "$(date) - Service was down, restarting" >> /var/log/my_monitor.log
    sudo systemctl restart nginx
fi
```

---

## Cron Automation

Configured cron to run the monitor every minute:

```cron
* * * * * /home/aravind/linux-lab/monitor_nginx.sh
```

This enabled autonomous service monitoring and recovery.

---

## Logging

Recovery events are written to:

```text
/var/log/my_monitor.log
```

Example:

```text
Sat Jun 13 14:40:22 UTC 2026 - Service was down, restarting
```

---

## Operational Test Performed

### Manual Failure Simulation

```bash
sudo systemctl stop nginx
```

### Recovery Validation

* cron detected outage
* monitor script executed automatically
* nginx restarted successfully
* recovery logged with timestamp

---

## Important Learning Outcomes

* Difference between services and shell sessions
* localhost and loopback networking
* daemon lifecycle management
* socket and port visibility
* autonomous monitoring concepts
* infrastructure observability basics
* self-healing service architecture

---

## Next Planned Enhancements

* Telegram Bot API integration
* Remote alerting
* Docker deployment
* Reverse proxy configuration
* HTTPS support
* Containerized service monitoring

---

## Project Goal

This repository is part of a broader effort to build practical infrastructure and edge-node operational knowledge for future Vision Labs deployments and autonomous Linux-based service environments.

