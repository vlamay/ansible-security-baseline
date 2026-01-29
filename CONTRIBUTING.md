# Contributing to Ansible Security Baseline

Thank you for your interest in contributing!

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/ansible-security-baseline.git`
3. Create a feature branch: `git checkout -b feature/your-feature`

## Development Setup

```bash
# Install dependencies
make install

# Run linting
make lint

# Run tests
make test
```

## Code Style

- Use 2 spaces for YAML indentation
- Use `snake_case` for variable names
- Prefix role variables with `security_baseline_`
- Add comments for complex logic
- Use meaningful task names

## Pull Request Process

1. Update documentation if needed
2. Add tests for new features
3. Ensure all CI checks pass
4. Update CHANGELOG.md

## Commit Messages

Use conventional commits:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `test:` Test changes
- `refactor:` Code refactoring

## Questions?

Open an issue with the `question` label.

## License

By contributing, you agree that your contributions will be licensed under MIT License.
