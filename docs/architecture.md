
# GCP Architecture Overview

This document outlines the structure and relationships of Google Cloud resources provisioned by the Helm charts in this repository.

## Core Resource Relationships

```plaintext
[VPC Network]
   └── [Subnetwork]
         ├── [Compute Router]
         │     └── [Cloud NAT]
         ├── [GKE or Workloads]
         └── [Compute Address]
              └── [External DNS]
                    └── [DNS Zone]

[Service Account] ─┬── Used by External DNS
                   └── Used by GKE workloads

[IAM Policy Members] ─── Binds roles to the above SA

[Custom IAM Role] ────── Used by Policy Members

[Bucket] ─── Used for evidence/logs/backups
```

## End-State GCP Diagram

```plaintext
                +---------------------+
                |    Cloud DNS Zone   |
                +---------+-----------+
                          |
                +---------v------------+
                |   External DNS       |
                |   (K8s Controller)   |
                +---------+------------+
                          |
             +------------v-------------+
             |    Static IP Address     |
             +------------+-------------+
                          |
       +------------------v------------------+
       |        Cloud NAT + Compute Router   |
       +------------------+------------------+
                          |
                +---------v------------+
                |     Subnetwork       |
                +---------+------------+
                          |
              +-----------v-----------+
              |     VPC Network       |
              +-----------------------+

Other independent components:
- Storage Bucket (audit/backups)
- IAM bindings for Service Accounts
```
