# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-29

### Added
- Initial release of ansible-security-baseline role
- SSH hardening with modern cipher suites (ChaCha20, AES-GCM, Curve25519)
- Firewall configuration using UFW with default-deny policy
- Auditd installation and configuration with 50+ security rules
- Fail2ban integration for intrusion prevention
- Sysctl kernel hardening parameters (20+ settings)
- Password policy configuration with PAM pwquality
- Environment-specific configurations (dev/stage/prod)
- Comprehensive Molecule tests with Docker
- GitHub Actions CI/CD pipeline
- Ansible Galaxy integration ready

### Security
- Disabled weak SSH algorithms (DSA, ECDSA)
- Enforced strong password requirements
- Implemented account lockout policies
- Configured audit logging for compliance
- Applied CIS benchmark recommendations

### Documentation
- Comprehensive README with usage examples
- Example inventory file
- Makefile for development workflow
- MIT License

[1.0.0]: https://github.com/vlamay/ansible-security-baseline/releases/tag/v1.0.0
