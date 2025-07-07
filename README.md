# ALX Airbnb Database

This repository contains the database models and SQL scripts for the **ALX Airbnb clone project**. It is designed to set up and manage the database infrastructure that powers the application.

---

## 📌 Project Overview

The goal of this project is to design and implement a robust relational database system that supports an Airbnb-like web application. This includes:

* Defining the database schema using MySQL.
* Writing scripts to create, update, and populate the database.
* Ensuring data integrity with constraints and relationships.

---

## 🏗️ Features

✅ Normalized database schema
✅ Tables for users, places, reviews, amenities, and more
✅ Foreign key constraints for relational integrity
✅ SQL scripts to create and populate the database
✅ Sample data for testing

---

## 🗂️ Repository Structure

```
alx-airbnb-database/
├── README.md
└── ...
```

---

## 🚀 Getting Started

### 📥 Prerequisites

* MySQL server (≥ 5.7)
* UNIX-like environment (Linux/macOS/WSL)

### ⚙️ Setup Instructions

1. Clone the repository:

```bash
git clone https://github.com/favouridowu02/alx-airbnb-database.git
cd alx-airbnb-database
```

2. Set up your development database and user:

```bash
cat setup_mysql_dev.sql | mysql -h localhost -u root -p
```

3. Create the database schema:

```bash
cat schema.sql | mysql -h localhost -u dev_user -p dev_db
```

4. Populate with sample data:

```bash
cat insert_data.sql | mysql -h localhost -u dev_user -p dev_db
```

---

## 📝 Usage

* Use the provided SQL scripts to create and manage your database.
* Modify the schema or data files as needed for your application.

---

## 🛠️ Contributing

Pull requests are welcome. Please fork the repository and open a PR with clear commits.

---

## 🪪 License

This project is licensed under the MIT License.

---

## 📧 Contact

For questions or suggestions:

* GitHub: [favouridowu02](https://github.com/favouridowu02)
* Email: [favouridowu02@gmail.com](mailto:favouridowu02@gmail.com)
