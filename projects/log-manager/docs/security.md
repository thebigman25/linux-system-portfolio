# Security & Threat Model: Log Manager
> **Project**: Log Management & Rotation | **Version**: 1.0.0

## 1. Change History
| Version | Date | Description |
| :--- | :--- | :--- |
| 1.0.0 | 2026-01-06 | Initial Security Audit |

## 2. Threat Assumptions
* **Trust Boundary**: Script assumes it has write access to the project directory.
* **Adversary Capability**: Risk of a user symlinking a sensitive file (like `/etc/shadow`) to the log path, causing the script to truncate it.

## 3. Vulnerability Analysis & Mitigations
| Threat / Risk | Impact | Mitigation Strategy |
| :--- | :--- | :--- |
| File Truncation Error | High | Script checks `-f` (is it a regular file) before rotation. |
| Accidental Deletion | Med | Cleanup restricted only to files ending in `.tar.gz`. |

## 4. Secure Implementation Notes
* **Privilege Level**: Runs as standard user `adel`. No `sudo` required.
* **Atomicity**: Rotation uses a copy-then-truncate method to prevent log loss during rotation.

## 5. Security Limitations
* Archives are not encrypted; any user with read access to the folder can view historical logs.
