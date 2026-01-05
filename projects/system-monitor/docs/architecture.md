# Architecture Decision Record (ADR): System Monitor
> **Project**: System Health Monitor | **Version**: 1.0.0 | **Status**: Approved

## 1. Change History
| Version | Date | Author | Description |
| :--- | :--- | :--- | :--- |
| 1.0.0 | 2026-01-04 | thebigman25 | Initial Script & Logic Definition |

## 2. System Components
* **Bash Logic (monitor.sh)**: The core engine using standard Linux utilities (`top`, `free`, `df`).
* **Log Storage (system_health.log)**: Persistent text-based logging for historical analysis.
* **Cron (Future)**: Scheduling agent for automated execution.

## 3. Data Flow & Integration
The script follows a linear data flow:
1. **Extraction**: System vitals are pulled from `/proc` via CLI tools.
2. **Transformation**: `awk` and `cut` sanitize output into integer percentages.
3. **Load**: Appends formatted strings to the local log file.



## 4. Engineering Assumptions
* **Environment**: Script assumes a Debian-based Linux environment (mafiaOS).
* **Dependencies**: Relies on `procps` (for `top` and `free`) being installed.

## 5. Decision Context
* **Constraints**: Avoided complex Python/Go dependencies to ensure zero-overhead monitoring.
* **Alternatives**: Considered `sar` (sysstat), but chose a custom script to demonstrate Bash proficiency.
