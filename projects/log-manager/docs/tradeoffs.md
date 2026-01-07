# Design Tradeoffs: Log Manager
> **Project**: Log Management & Rotation | **Version**: 1.0.0

## 1. Constraints
* **Disk Space**: Chose `tar.gz` (Gzip) over `xz` or `bzip2`. While `xz` has better compression, Gzip is faster and has lower CPU overhead during the rotation process.

## 2. Omissions
* **Remote Offloading**: Deliberately omitted S3/Rsync integration to keep the project focused on local system management foundations.
* **Dynamic Config**: Pathing is hardcoded rather than using an external `.conf` file to minimize file-read dependencies.

## 3. Performance Considerations
* **Rotation Timing**: By using a 1MB threshold, rotation is frequent enough to keep individual archives small, ensuring `tar` operations are nearly instantaneous.
