# Ansible Security Baseline

[![CI](https://github.com/vlamay/ansible-security-baseline/actions/workflows/ci.yml/badge.svg)](https://github.com/vlamay/ansible-security-baseline/actions/workflows/ci.yml)
[![Ansible Lint](https://img.shields.io/badge/ansible--lint-passing-brightgreen)](https://github.com/ansible/ansible-lint)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Production-grade Ansible role for hardening Linux systems based on CIS benchmarks and enterprise security best practices.

## 🎯 Overview

This role implements comprehensive security hardening for Linux systems (Ubuntu-focused, RHEL support planned) following industry standards and best practices. It's designed for DevSecOps workflows with full CI/CD integration, automated testing, and environment-specific configurations.

## ✨ Features

| Feature | Description | Configurable |
|---------|-------------|--------------|
| **SSH Hardening** | Disables root login, enforces key-based auth, modern ciphers | ✅ |
| **Firewall Management** | UFW configuration with default-deny policy | ✅ |
| **Audit Logging** | Auditd with 50+ security event rules | ✅ |
| **Intrusion Prevention** | Fail2ban for brute-force protection | ✅ |
| **System Hardening** | Sysctl tuning, kernel parameters, ASLR | ✅ |
| **Password Policy** | PAM configuration for strong passwords | ✅ |
| **Environment Profiles** | Dev/Stage/Prod configurations | ✅ |

## 📋 Requirements

- **Ansible**: 2.12 or higher
- **Target OS**: Ubuntu 20.04, 22.04, 24.04
- **Privileges**: Root or sudo access required
- **Python**: 3.8+ on control node

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/vlamay/ansible-security-baseline.git
cd ansible-security-baseline

# Install dependencies
make install
```

### Basic Usage

1. Create inventory file:

```bash
cp inventory.example inventory
# Edit inventory with your servers
```

2. Run the playbook:

```bash
ansible-playbook site.yml -i inventory
```

### Environment-Specific Configuration

```yaml
# Production - Maximum security
security_baseline_environment: production
security_baseline_password_authentication: "no"
security_baseline_enable_fail2ban: true
security_baseline_firewall_allowed_ports:
  - 22
  - 443

# Development - More flexible
security_baseline_environment: development
security_baseline_password_authentication: "yes"
security_baseline_enable_fail2ban: false
```

## 🔧 Configuration

See [`roles/security_baseline/defaults/main.yml`](roles/security_baseline/defaults/main.yml) for 150+ configurable variables:

```yaml
# SSH Configuration
security_baseline_ssh_port: 22
security_baseline_permit_root_login: "no"
security_baseline_max_auth_tries: 3

# Firewall
security_baseline_configure_firewall: true
security_baseline_firewall_allowed_ports:
  - 22

# Security Services
security_baseline_enable_auditd: true
security_baseline_enable_fail2ban: true
security_baseline_sysctl_hardening: true
```

## 🧪 Testing

```bash
# Full test cycle
make test

# Quick iteration
make test-converge

# Syntax check
make syntax

# Linting
make lint
```

## 📊 Security Controls

### SSH Hardening

| Setting | Value | Rationale |
|---------|-------|-----------|
| `PermitRootLogin` | no | Prevents direct root access |
| `PasswordAuthentication` | no (prod) | Forces key-based auth |
| `MaxAuthTries` | 3 | Limits brute-force |
| `Ciphers` | ChaCha20, AES-GCM | Modern encryption |

### Sysctl Parameters

- IP forwarding disabled
- SYN cookies enabled
- RP filter enabled
- ASLR enabled
- Core dumps restricted

## 📁 Project Structure

```
ansible-security-baseline/
├── site.yml                  # Main playbook
├── roles/security_baseline/
│   ├── defaults/main.yml    # 150+ variables
│   ├── tasks/               # 7 task files
│   ├── templates/           # 4 Jinja2 templates
│   ├── handlers/main.yml
│   └── meta/main.yml
├── molecule/default/        # Automated tests
├── .github/workflows/       # CI/CD pipeline
└── Makefile                 # Dev shortcuts
```

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Run tests: `make test`
4. Commit changes: `git commit -m 'Add amazing feature'`
5. Push and create Pull Request

## 📝 License

MIT License - see [LICENSE](LICENSE) file

## 👤 Author

**Vladyslav Maidaniuk**
- GitHub: [@vlamay](https://github.com/vlamay)
- LinkedIn: [Vladyslav Maidaniuk](https://www.linkedin.com/in/maidaniuk/)
- Email: vla.maidaniuk@gmail.com

## 🔗 Related Projects

- [ai-platform-infra](https://github.com/vlamay/ai-platform-infra) - Kubernetes infrastructure
- [ai-platform-services](https://github.com/vlamay/ai-platform-services) - AI microservices

## 📚 References

- [CIS Ubuntu Benchmark](https://www.cisecurity.org/benchmark/ubuntu_linux)
- [Ansible Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)
