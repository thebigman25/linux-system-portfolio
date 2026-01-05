# Testing Strategy: System Monitor
> **Project**: System Health Monitor | **Version**: 1.0.0

## 1. Test Strategy
The testing for this utility is performed via manual execution and log verification.

## 2. Unit / Integration Coverage
* **Data Extraction**: Verified that `top`, `free`, and `df` return correct values on mafiaOS.
* **Log Persistence**: Verified that script creates `system_health.log` if it does not exist.
* **Append Logic**: Verified that subsequent runs do not overwrite previous logs.

## 3. Test Results Summary
| Test Case | Method | Result | Date |
| :--- | :--- | :--- | :--- |
| Script Execution | `./monitor.sh` | PASS | 2026-01-04 |
| Threshold Logic | Manual Variable Override | PASS | 2026-01-04 |
| Log Formatting | `cat ../system_health.log` | PASS | 2026-01-04 |

## 4. Known Gaps
* No automated unit tests for Bash logic (e.g., BATS).
* Stress testing for large log file performance not yet conducted.
