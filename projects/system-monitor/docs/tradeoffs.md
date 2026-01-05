# Design Tradeoffs: System Monitor
> **Project**: System Health Monitor | **Version**: 1.0.0

## 1. Constraints
* **Language**: Limited to pure Bash to ensure compatibility across all minimal Linux installs without requiring Python or Node.js.

## 2. Omissions
* **Email Alerts**: Deliberately omitted to avoid SMTP configuration complexity in a foundation-level project.
* **Graphical Output**: Chose plain-text logs over a web dashboard to prioritize system performance.

## 3. Performance Considerations
* **Resource Impact**: The script uses `top` in batch mode, which is lightweight but not "real-time."
* **Log Rotation**: Without `logrotate`, the log file will grow indefinitely. This is a known tradeoff for version 1.0.0.
