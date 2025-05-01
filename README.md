# Healing Hands ⚕️

## Overview
A **Rails 8** application designed to manage a **Receptionist & Doctor Portal**, enabling:
- **Secure Authentication** (Rails 8 Auth)
- **User Role Management** via **Single Table Inheritance (STI)**
- **Patient Registration & Management**
- **Analytics & Data Visualization** with **Chartkick**
- **Tailwind CSS** for styling

---

## Features
### 🔐 **Authentication & Role Management**
- Single **Login Page** for Receptionists & Doctors (implemented using **Rails 8 Auth**)
- **STI-based Users** (`Doctor`, `Receptionist` subclasses) for role separation
- Each role has **independent dashboards** with **restricted access**

### 🏥 **Receptionist Portal**
- Can **register new patients** and **perform CRUD operations** on patient records

### 🩺 **Doctor Portal**
- View **all registered patients**
- Access **visual analytics** for **patient registrations vs appointment dates**
- View **real-time search & filtering** with Turbo Streams

### 📊 **Data Visualization**
- **Chartkick** for interactive **graphs**
- Graphs for:
  - **Patients registered per day**
  - **Appointments scheduled per day**
