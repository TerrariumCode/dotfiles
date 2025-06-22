## Build, Lint, and Test

- There are no dedicated build, lint, or test scripts.
- Validate changes by running the relevant Ansible playbooks.

## Code Style

### Ansible

- Use full module names (e.g., `ansible.builtin.apt`).
- Use `become: true` for tasks requiring privilege escalation.
- Use `loop: "{{ ... }}"` for iterating over lists.
- Keep plays and tasks well-documented with comments.

### General

- This is a dotfiles repository. Keep configuration files clean, organized, and well-commented.
- When adding new roles or playbooks, follow the existing directory structure.
- For any new packages or dependencies, ensure they are added to the appropriate package list.
