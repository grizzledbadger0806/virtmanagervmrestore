# 🧰 VM Restore Utility (Fedora / libvirt / qcow2)

A simple, controlled Bash utility for restoring KVM/QEMU virtual machines from **golden qcow2 backups** with interactive selection and safe confirmation steps.

---

## 🚀 Features

- Interactive VM selection (`virsh list`)
- Golden image restore workflow
- Safe confirmation prompt before changes
- Progress bar using `rsync`
- Root ownership enforcement (`root:root`)
- Designed for Fedora + libvirt + virt-manager

---

## 📦 Prerequisites

 - Before using this utility, ensure your system has the required tools and services installed and configured.
 - Assumes the qcow2 disks are the same name as the VM

---

### Notes & Warnings

 **⚠️ Shut off all VMs before running.** Writing to a live disk image will corrupt it. The script checks state and skips running VMs, but verify beforehand.

 **⚠️ Script assumes the qcow2 disk names are the same as the VMs.**

---

### 🧱 Required Packages

Install required dependencies:
 - libvirt
 - libvirt-client
 - qemu-kvm
 - rsync

---
## ⚠️ WARNING
 **⚠️ RUN SCRIPT IN TEST ENVIRONMENT FIRST. CREATOR AND COLLABORATORS AREN'T RESPONSIBLE FOR ANYTHING.** 

 ---

## 📜 License

This repository is licensed under the MIT License.