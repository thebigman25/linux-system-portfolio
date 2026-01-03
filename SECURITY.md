# Security Policy

## 1. Supported Versions
Only the latest version of this portfolio and its associated scripts are supported for security updates.

## 2. Reporting a Vulnerability
Please do not report security vulnerabilities through public GitHub issues. Instead, send an email to: **adelwilliams49@yahoo.ca**.

## 3. Security Commitments
* **Zero Secret Leakage**: We use `.gitignore` to prevent private keys and `.env` files from being committed.
* **No Sudo Abuse**: Scripts requiring elevated privileges will always prompt for confirmation or use specific, limited sudoers configurations.
* **Dependency Scanning**: Any third-party tools used in projects are vetted for known CVEs.
