# Architecture Decision Record (ADR): Log Manager
> **Project**: Log Management & Rotation | **Version**: 1.0.0 | **Status**: Approved

## 1. Change History
| Version | Date | Author | Description |
| :--- | :--- | :--- | :--- |
| 1.0.0 | 2026-01-06 | thebigman25 | Initial Design: Size-based rotation |

## 2. System Components
* **Rotation Engine**: Bash script using `du` for size checking and `tar` for compression.
* **Archive Repository**: Local `/archives/` directory for historical storage.
* **Cleanup Agent**: `find` utility with `-mtime` logic for retention enforcement.

## 3. Data Flow & Integration

1. **Poll**: Script checks size of `system_health.log`.
2. **Compress**: If threshold met, `tar` creates a timestamped archive.
3. **Truncate**: `cat /dev/null` clears the active log without breaking open file descriptors.
4. **Purge**: `find` identifies and deletes archives > 7 days old.

## 4. Engineering Assumptions
* **Paths**: Hardcoded to the `linux-system-portfolio` structure for internal portability.
* **Format**: Logs are rotated into `.tar.gz` to save disk space (standard Gzip compression).

## 5. Decision Context
* **Why not logrotate?**: Building a custom script demonstrates foundational understanding of file manipulation and lifecycle logic.
