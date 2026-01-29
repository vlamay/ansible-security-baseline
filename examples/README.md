# Environment-Specific Examples

Example configurations for different environments.

## Production

```yaml
# group_vars/production.yml
security_baseline_environment: production
security_baseline_password_authentication: "no"
security_baseline_enable_fail2ban: true
security_baseline_fail2ban_maxretry: 3
security_baseline_password_min_length: 16
security_baseline_firewall_allowed_ports:
  - 22
  - 443
```

## Development

```yaml
# group_vars/development.yml
security_baseline_environment: development
security_baseline_password_authentication: "yes"
security_baseline_enable_fail2ban: false
security_baseline_configure_firewall: false
security_baseline_password_min_length: 12
```

## High Security Profile

```yaml
# For sensitive environments
security_baseline_max_auth_tries: 2
security_baseline_fail2ban_bantime: 86400  # 24 hours
security_baseline_password_min_length: 20
security_baseline_disable_usb_storage: true
```
