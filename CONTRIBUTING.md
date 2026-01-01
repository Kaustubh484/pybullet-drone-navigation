# Contributing to Autonomous Drone Navigation

Thank you for your interest in contributing to this project! We welcome contributions from the community.

## How to Contribute

### Reporting Bugs

Before creating bug reports, please check existing issues. When creating a bug report, include:

- **Description:** Clear description of the issue
- **Steps to Reproduce:** Minimal code example
- **Expected Behavior:** What you expected to happen
- **Actual Behavior:** What actually happened
- **Environment:** OS, Python version, PyTorch version
- **Logs:** Relevant error messages or training logs

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Use Case:** Why this enhancement would be useful
- **Description:** Clear description of the proposed functionality
- **Alternatives:** Any alternative solutions you've considered

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** with clear, descriptive commits
3. **Add tests** if you've added code that should be tested
4. **Update documentation** for any changed functionality
5. **Ensure tests pass** and code follows style guidelines
6. **Submit a pull request** with a clear description of changes

## Development Setup

```bash
# Fork and clone your fork
git clone https://github.com/YOUR_USERNAME/pybullet-drone-navigation.git
cd pybullet-drone-navigation

# Add upstream remote
git remote add upstream https://github.com/Kaustubh484/pybullet-drone-navigation.git

# Create a branch for your feature
git checkout -b feature/your-feature-name

# Install in development mode
pip install -e .
```

## Code Style

- Follow [PEP 8](https://pep8.org/) style guidelines
- Use meaningful variable and function names
- Add docstrings to all functions and classes
- Keep functions focused and modular
- Maximum line length: 100 characters

Example:

```python
def compute_reward(
    distance: float,
    prev_distance: float,
    reached_waypoint: bool,
    crashed: bool
) -> float:
    """
    Compute the reward for the current step.
    
    Args:
        distance: Current distance to target (meters)
        prev_distance: Previous distance to target (meters)
        reached_waypoint: Whether waypoint was reached
        crashed: Whether drone crashed
        
    Returns:
        Total reward value
    """
    reward = 0.5  # Survival bonus
    reward += 10.0 * (prev_distance - distance)  # Progress
    if reached_waypoint:
        reward += 100.0
    if crashed:
        reward -= 100.0
    return reward
```

## Testing

```bash
# Run tests
pytest tests/

# Run specific test
pytest tests/test_environment.py

# Run with coverage
pytest --cov=agents tests/
```

## Documentation

- Update README.md for user-facing changes
- Add docstrings following NumPy style
- Update configuration examples if adding new parameters
- Include code examples for new features

## Commit Messages

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit first line to 72 characters
- Reference issues and pull requests

Example:
```
Add SAC entropy temperature tuning

- Implement automatic temperature adjustment
- Add temperature to logged metrics
- Fixes #123
```

## Areas for Contribution

### High Priority
- Obstacle avoidance training with sensors
- Sim-to-real transfer with domain randomization
- Multi-agent coordination
- Comprehensive test suite

### Medium Priority
- Additional RL algorithms (TD3, A3C)
- Better visualization tools
- Performance optimizations
- Documentation improvements

### Good First Issues
- Add configuration validation
- Improve logging output formatting
- Add more training examples
- Fix typos in documentation

## Questions?

Feel free to:
- Open a GitHub issue
- Contact the maintainers
- Join our discussions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
