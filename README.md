Follow on Twitter [![Twitter Follow](https://img.shields.io/twitter/follow/discoverscripts.svg?style=social&label=Follow)](https://twitter.com/discoverscripts) 
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/leebaird/discover/blob/master/LICENSE)

### About
* This project is currently in the beta stage of development.
* Manage all logistical information for a pentest including clients, contacts, employees, findings, projects, scoping, and vulnerabilities.
* Special thanks to Shipul Biswas for all his help on this project! https://www.guru.com/freelancers/far-bis

### Requirements
* Install XAMPP (PHP 7.2.0): https://www.apachefriends.org/download.html

### windows Setup
* Use XAMPP control panel to start MySQL and Apache.
* cd C:\xampp\htdocs
* git clone https://github.com/pentestba/assessment-manager.git
* create database with phpmyadmin and name it amdb
* import amdb.sql to your database

### Usage
```
* Open localhost/assessment-manager/src/php/
* Default account: admin
* Default password: 1234!@#$qwerQWER
```

### Pages
```
* Clients
* Contacts
* Employees
* Findings: create finding categories with boiler plate text for your deliverables.
* Projects: track important dates and various aspects of an engagement.
* Vulnerabilities:
    Host: import Nessus and Nexpose findings.
    Web: import Burp and Acunetix findings.
```
