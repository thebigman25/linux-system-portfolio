# Security & Threat Model: System Monitor
> **Project**: System Health Monitor | **Version**: 1.0.0

## 1. Change History
| Version | Date | Description |
| :--- | :--- | :--- |
| 1.0.0 | 2026-01-04 | Initial Security Audit |

## 2. Threat Assumptions
* **Trust Boundary**: Script operates locally; assume the local user has execution rights.
* **Adversary Capability**: Low risk; potential for log tampering if directory permissions are weak.

## 3. Vulnerability Analysis & Mitigations
| Threat / Risk | Impact | Mitigation Strategy |
| :--- | :--- | :--- |
| Log Overfill (DoS) | Low | Future: Implement log rotation (logrotate). |
| Command Injection | Med | Inputs are hardcoded; no user-provided strings are evaluated. |

## 4. Secure Implementation Notes
* **Privilege Level**: Script runs as a standard user. Root is not required for monitoring basic vitals.
* **Secret Management**: No credentials or API keys are used in this module.

## 5. Security Limitations
* This script does not encrypt logs; sensitive system info is stored in plain text.
