# Laravel Shared Hosting Setup Guide

This repository provides a step-by-step guide and example scripts to help you **deploy and run a Laravel project on shared hosting**. It is aimed at developers who want a lightweight, reliable setup without a VPS or dedicated server.

---

## Features

- Minimal setup for shared hosting (Hostinger, cPanel, etc.)
- Automate deployment with a simple Bash script
- Optional cron job integration for automatic updates
- Safe and repeatable workflow

---

## Prerequisites

Before starting, ensure your shared hosting account provides:

- SSH access
- Git installed
- PHP 8.x (or compatible Laravel version)
- Composer (optional, see deployment method)
- Cron job capability

---

## Setup Instructions

### 1. Upload Laravel Project

[!WARNING]
You must place your Laravel project OUTSIDE of the public_html folder
Failure to do so will give public access to ALL of the credentials in your .env file

- Clone your Laravel project locally  
OR
- Upload it to your shared hosting account via FTP

---

### 2. Set Up the Deployment Script

1. Place the files named `auto_deploy.sh` and `auto_deploy.log` outside of the public_html folder

More to come soon