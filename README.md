# Hospital Database Project

**Authors:** Ketanreddy Ambati, Kevin Knapp, Allen Tran  
**Institution:** San Jose State University  
**Course:** CS 157A: Database Project  
**Professor:** Jahan Ghofraniha  
**Date:** December 3, 2023


## Executive Summary

This report outlines the design and implementation of a database for a hospital from the conceptual to physical. The database serves to be a hospital’s information management system that can provide visual reports and information manipulation for endpoint users on important hospital data. The MySQL database is hosted using AWS RDS. Connected to AWS, the database was created and populated using MySQL Workbench. The database’s graphical user interface is made with Retool. Testing procedures are executed on the database to ensure functionality, data integrity and security. The database can be deployed from the command line using Docker giving quick query access from anywhere. Resources such as links related to the project can be found in the appendix.



## Background and Introduction

A hospital is made of a complex organization and structure of people and resources. With this in mind, hospitals need to also store plenty of important data for its regular operations and record keeping. A hospital is made up of staff, patients, appointments, and all similarly related entities. These entities will have some form of connection to other entities. For example, each patient has their own medical record, invoices, and appointments scheduled with doctors within the hospital. This information and more is secured in a database to be stored and accessed as needed. The database also allows updates to data entries for the changing and dynamic information that occurs within a hospital. It also needs to be flexible due to the dynamic environment, meaning that every record could have the ability to remain blank until it is updated later. This is mostly because new patients being admitted to a hospital might have incomplete information, for example, if they were admitted into the ER.



## Problem Statement

The healthcare industry demands a large and expansive database to retrieve, process, and change information regarding patients and staff members to facilitate a fast and dynamic environment.



## Design

### Conceptual Design

The conceptual design is made of hospital entities and their basic relationships. The entities shown in the image above were chosen based on a hospital having patients, employees, doctors, etc. Employees can be doctors. Patients and Employees can be scheduled to appointments at the hospital. A patient will be given invoices that need to be paid. Every patient has one medical record which has a many to many relationship with medications, allergies and immunizations. For example, a patient with a medical record may be given many medications and on the other hand medications can also be administered to multiple patients. The medical record entity allows the hospital to keep track of their medication distribution among patients.

### Logical Design

The logical design consists of the entities with attributes added to them. Some attributes are assigned either as primary or foreign keys based on the entity relationships. For instance with the Patient entity, its attributes consist of the patient’s personal information and its primary key is the medical record number because that is the unique id assigned to every patient. The medical record holds attributes related to the patient’s health and medical history and can also be uniquely identified with the medical record number as its primary key.
The medication record has three primary keys. The first two attributes, ‘Medical Record Number’ and ‘Medication ID’, are primary keys because the medication record entity is the junction table between the many to many relationship of the medical record and medication entities. The third primary key, ‘Date Administered’, is there because a patient can be administered the same type of medication that has the same medication id multiple times.
	The logical design is normalized at least up to the third normal form. There are no multi-valued attributes as the design is able to support repeating attribute values in separate entries when applicable, making the design normalized to the first form. The entities with a composite primary key, being the junction tables, are in second normal form because the few non-primary attributes are fully dependent on their primary keys. The design is in the third normal form as well because all non-primary key attributes in the design are not transitively dependent on the primary key but are within the same entity because they fully depend on the primary key and only the primary key.

### Physical Design

The physical design as implemented in the database features different data types for its columns. The typical data types are varchars for text data and integers for data that are numbers. The columns that are related to time are assigned the date and time types. The data type enum is used as well for columns that can only hold a predefined set of values such as can be seen in the patient or employee table.


## Implementation, Application Architecture, and User Views

The database server is hosted on Amazon Web Services (AWS) using their Relational Database Service (RDS). From there, a MySQL database instance was created, running MySQL Community as the engine. In the settings the instance was made publicly accessible but also had its VPC security group configured. The security group was modified to only allow inbound permission access from select ip addresses. If the database is inaccessible it means that the database has either been shut down or that the user’s ip address has not been correctly configured to the security group. 

The database was primarily constructed and populated with MySQL Workbench. Workbench allows for quick database modifications while maintaining a visual interface and view of live changes. The database can be accessed from MySQL Workbench by connecting to the hostname through the correct port with a standard TCP connection and by providing the username and password which is all given in the appendix. A SQL file that can create the entire database from scratch populated with dummy records is available in the GitHub repository found in the appendix.
The graphical user interface (GUI) for the database was made with and accessible by Retool. The link to the GUI is accessible in the appendix and requires an invite through email. If the professor’s email does not have access please let the authors know. Retool provides a friendly user interface to relatively easily create web applications quickly. The GUI is set up so that Retool connects to AWS RDS and can make queries to it. The GUI features a header which gives access to two features. 

The ‘DB UI’ feature allows the user to interact directly with entries in the database tables. One can add a new entry, modify an existing record, or delete a record. 

The ‘User View on Patients’ feature allows the user to view the database views as seen in the next images. The three user views are reports on hospital appointments, invoices, and medical information, which each query data from multiple entries and tables. The SQL queries for creating the view are also in the GitHub repository.


## Deployment

For any end user to access the database, there needs to be a fast and easy way to get query access from any machine. This can be done using Docker, which can save a portable package called an image that comes with all the files, configuration, and dependencies pre-built for the purpose it is needed for. For this deployment, a machine with Docker installed is required. Using the command line interface (CLI) of the machine, a pre-built image will be pulled from the cloud using Docker and installed in the machine. Then a command will run the image to give the machine quick access to MySQL in the CLI in which one can execute SQL commands. At this point, a connection to the database can be requested and approved after logging in. Now, the user is connected and can begin querying the hospital database. The CLI entries to achieve this are given below.


```
docker pull kevinknapp/hospitaldbrepo

docker run -it --name deployed kevinknapp/hospitaldbrepo

mysql -h [redacted] -u [redacted] -p

[redacted]

use hospitaldb;
```


## Conclusions

This report has outlined the process of the design, creation, and implementation of a hospital database. When deployed, users will be able to have control of data on patients, employees, appointments, and other entities required for operations within a hospital with the database. This database is easy to understand for its users and is flexible enough to be in a hospital environment. The database offers a graphical user interface for employees who only need to conduct basic day to day operations that require interaction with the database. The graphical user interface presents three user views that would be relevant to operations at the front desk of the hospital. The database has been proven to operate nominally through testing queries. Users can get access to the database server by deploying it themselves on a client side machine.


## Appendix

- **Retool GUI:** [Retool Hospital Database GUI](https://kevinknapp.retool.com/apps/713471d8-859a-11ee-9c96-43bb0660ad45/Hospital%20DB/Patient%20Views)
- **GitHub Repository:** [Hospital Database GitHub](https://github.com/knappkevin/Hospital-DB-Project)
