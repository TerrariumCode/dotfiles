## Build, Lint, and Test

- No dedicated build/lint/test scripts - this is a dotfiles repository
- Run Ansible playbooks to validate changes: `cd playbooks && make run-play`
- Use `uv run ansible-playbook -K playbook-play.yaml` for direct execution
- Test individual roles by uncommenting them in playbook-play.yaml

## Code Style

### Ansible
- Use full module names: `ansible.builtin.apt`, `ansible.builtin.file`
- Use `become: true` for privilege escalation tasks
- Use `loop: "{{ variable }}"` for iteration over lists/variables
- Document tasks with descriptive `name:` fields
- Use YAML format with proper indentation (2 spaces)
- Variables in `vars/main.yml`, tasks in `tasks/main.yml`

### Fish Shell
- Use `set -Ux` for universal exports, `set -gx` for global exports
- Use `fish_add_path` for PATH modifications
- Conditional blocks: `if status is-interactive` for interactive-only commands
- Aliases use standard `alias name='command'` syntax

### Configuration Files
- Keep dotfiles clean, organized, and well-commented
- Follow existing directory structure when adding new configs
- Use symlinks in Ansible playbooks for file management
- Maintain separate configs for work/play environments (-work/-play suffixes)
