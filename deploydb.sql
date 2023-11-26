-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: hospitaldb.cbg3zeqsdjrx.us-east-1.rds.amazonaws.com    Database: hospitaldb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
/*SET @@SESSION.SQL_LOG_BIN= 0*/;

--
-- GTID state at the beginning of the backup 
--

--
-- SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
--

--
-- Table structure for table `Allergy`
--

DROP TABLE IF EXISTS `Allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergy` (
  `Allergy_ID` int NOT NULL,
  `Allergy_Name` varchar(50) NOT NULL,
  `Allergy_Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Allergy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergy`
--

LOCK TABLES `Allergy` WRITE;
/*!40000 ALTER TABLE `Allergy` DISABLE KEYS */;
INSERT INTO `Allergy` VALUES (1,'Peanuts','Itchy throat, hives, difficulty breathing'),(2,'Penicillin','Skin rash, swelling, fever'),(3,'Shellfish','Abdominal pain, nausea, vomiting'),(4,'Tree Pollen','Sneezing, runny nose, itchy eyes'),(5,'Dust Mites','Coughing, wheezing, nasal congestion'),(6,'Mold','Sneezing, itchy eyes, skin rash'),(7,'Cats','Sneezing, runny nose, skin itching'),(8,'Eggs','Skin rash, stomach cramps, diarrhea'),(9,'Latex','Skin redness, itching, hives'),(10,'Grass Pollen','Sneezing, runny nose, itchy throat'),(11,'Soy','Abdominal pain, bloating, diarrhea'),(12,'Wheat','Itchy skin, nausea, vomiting'),(13,'Fish','Swelling, hives, difficulty breathing'),(14,'Insect Stings','Localized swelling, itching, redness'),(15,'Milk','Abdominal cramps, diarrhea, skin rash'),(16,'Pollen Mix','Sneezing, runny nose, itchy eyes'),(17,'Nuts','Swelling, itching, difficulty breathing'),(18,'Sesame','Skin redness, itching, hives'),(19,'Mango','Skin rash, itching, swelling'),(20,'Sunflower Pollen','Sneezing, runny nose, itchy throat');
/*!40000 ALTER TABLE `Allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Allergy_Record`
--

DROP TABLE IF EXISTS `Allergy_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergy_Record` (
  `Medical_Record_Number` int NOT NULL,
  `Allergy_ID` int NOT NULL,
  PRIMARY KEY (`Medical_Record_Number`,`Allergy_ID`),
  KEY `FK_Allergy_Allergy_Record` (`Allergy_ID`),
  CONSTRAINT `FK_Allergy_Allergy_Record` FOREIGN KEY (`Allergy_ID`) REFERENCES `Allergy` (`Allergy_ID`),
  CONSTRAINT `FK_Medical_Record_Allergy_Record` FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Medical_Record` (`Medical_Record_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergy_Record`
--

LOCK TABLES `Allergy_Record` WRITE;
/*!40000 ALTER TABLE `Allergy_Record` DISABLE KEYS */;
INSERT INTO `Allergy_Record` VALUES (8,2),(19,3),(6,4),(11,6),(17,7),(14,8),(5,9),(19,10),(3,11),(12,13),(6,14),(17,15),(20,17),(5,19);
/*!40000 ALTER TABLE `Allergy_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `Appointment_ID` int NOT NULL,
  `Employee_ID` int NOT NULL,
  `Medical_Record_Number` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `FK_Employee_Appointment` (`Employee_ID`),
  KEY `FK_Medical_Record_Number_Appointment` (`Medical_Record_Number`),
  CONSTRAINT `FK_Employee_Appointment` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `FK_Medical_Record_Number_Appointment` FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Patient` (`Medical_Record_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES (1,1,1,'2023-11-06','09:00:00','Cardiology Checkup'),(2,3,2,'2023-11-07','10:30:00','Pediatric Consultation'),(3,5,3,'2023-11-08','14:00:00','Orthopedic Evaluation'),(4,7,4,'2023-11-09','11:15:00','Neurology Follow-up'),(5,10,5,'2023-11-10','13:45:00','OB-GYN Appointment'),(6,2,6,'2023-11-11','08:30:00','General Checkup'),(7,4,7,'2023-11-12','15:30:00','Pediatric Vaccination'),(8,6,8,'2023-11-13','12:00:00','Orthopedic Consultation'),(9,8,9,'2023-11-14','09:45:00','Neurology MRI'),(10,10,10,'2023-11-15','11:00:00','OB-GYN Ultrasound'),(11,1,2,'2023-11-16','14:30:00','Cardiology Stress Test'),(12,3,4,'2023-11-17','10:00:00','Pediatric Checkup'),(13,5,6,'2023-11-18','12:45:00','Orthopedic Surgery Consult'),(14,7,8,'2023-11-19','16:15:00','Neurology EEG'),(15,2,10,'2023-11-20','13:00:00','General Physical Examination');
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctor` (
  `Employee_ID` int NOT NULL,
  `Specialization` varchar(50) NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `FK_Employee_Doctor` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Cardiologist','Cardiology'),(3,'Pediatrician','Pediatrics'),(5,'Orthopedic Surgeon','Orthopedics'),(7,'Neurologist','Neurology'),(10,'OB-GYN','Obstetrics and Gynecology');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_ID` int NOT NULL,
  `Employee_FName` varchar(50) NOT NULL,
  `Employee_LName` varchar(50) NOT NULL,
  `Employee_DoB` date NOT NULL,
  `Employee_Gender` enum('M','F') DEFAULT NULL,
  `Employee_Address` varchar(50) NOT NULL,
  `Employee_Phone_Number` int NOT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'James','Smith','1980-05-15','M','123 Main St',2147483647),(2,'Emily','Johnson','1992-08-22','F','456 Oak St',2147483647),(3,'Michael','Davis','1985-11-08','M','789 Pine St',2147483647),(4,'Sophia','Martinez','1998-03-17','F','101 Elm St',2147483647),(5,'William','Brown','1979-09-30','M','202 Cedar St',2147483647),(6,'Olivia','Garcia','1991-07-12','F','303 Maple St',2147483647),(7,'Benjamin','Taylor','1987-04-25','M','404 Birch St',2147483647),(8,'Ava','Wilson','1996-02-03','F','505 Walnut St',2147483647),(9,'Daniel','Clark','1982-06-19','M','606 Spruce St',2147483647),(10,'Ella','Thomas','1995-12-08','F','707 Pine St',2147483647);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Immunization`
--

DROP TABLE IF EXISTS `Immunization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Immunization` (
  `Immunization_ID` int NOT NULL,
  `Immunization_Name` varchar(50) NOT NULL,
  `Immunization_Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Immunization_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Immunization`
--

LOCK TABLES `Immunization` WRITE;
/*!40000 ALTER TABLE `Immunization` DISABLE KEYS */;
INSERT INTO `Immunization` VALUES (1,'DTaP','Diphtheria, Tetanus, and Pertussis Vaccine'),(2,'MMR','Measles, Mumps, and Rubella Vaccine'),(3,'Hepatitis B','Hepatitis B Vaccine'),(4,'Varicella','Varicella (Chickenpox) Vaccine'),(5,'Hib','Haemophilus influenzae type b Vaccine'),(6,'Polio','Polio Vaccine'),(7,'PCV13','Pneumococcal Conjugate Vaccine'),(8,'Hepatitis A','Hepatitis A Vaccine'),(9,'Rotavirus','Rotavirus Vaccine'),(10,'HPV','Human Papillomavirus Vaccine'),(11,'MenACWY','Meningococcal Conjugate Vacc (Serogroups ACWY)'),(12,'Influenza','Influenza (Flu) Vaccine'),(13,'Td','Tetanus and Diphtheria Vaccine'),(14,'Typhoid','Typhoid Vaccine'),(15,'Rabies','Rabies Vaccine');
/*!40000 ALTER TABLE `Immunization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Immunization_Record`
--

DROP TABLE IF EXISTS `Immunization_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Immunization_Record` (
  `Medical_Record_Number` int NOT NULL,
  `Immunization_ID` int NOT NULL,
  `Date_Administered` date NOT NULL,
  `Provider` varchar(50) NOT NULL,
  PRIMARY KEY (`Medical_Record_Number`,`Immunization_ID`,`Date_Administered`),
  KEY `FK_Immunization_Immunization_Record` (`Immunization_ID`),
  CONSTRAINT `FK_Immunization_Immunization_Record` FOREIGN KEY (`Immunization_ID`) REFERENCES `Immunization` (`Immunization_ID`),
  CONSTRAINT `FK_Medical_Record_Immunization_Record` FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Medical_Record` (`Medical_Record_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Immunization_Record`
--

LOCK TABLES `Immunization_Record` WRITE;
/*!40000 ALTER TABLE `Immunization_Record` DISABLE KEYS */;
INSERT INTO `Immunization_Record` VALUES (1,1,'2023-01-15','HealthCareCorp'),(1,2,'2023-02-02','MediShot'),(1,3,'2025-01-15','VaxCare'),(2,3,'2023-02-20','WellnessClinic'),(3,4,'2023-05-15','CareFirst'),(3,5,'2023-03-25','VaxCare'),(4,7,'2023-04-10','MediShot'),(5,6,'2023-09-28','HealthGuard'),(5,9,'2023-05-05','HealthGuard'),(6,11,'2023-06-18','CareFirst'),(7,13,'2023-07-22','VaxCare'),(8,15,'2023-08-30','WellnessClinic'),(9,2,'2023-09-12','MediShot'),(10,4,'2023-10-08','HealthGuard'),(11,6,'2023-11-14','CareFirst'),(12,8,'2023-12-01','MediShot'),(13,10,'2024-01-05','VaxCare'),(14,12,'2024-02-19','HealthCareCorp'),(15,14,'2024-03-25','WellnessClinic'),(16,1,'2024-05-10','VaxCare'),(17,3,'2024-06-22','WellnessClinic'),(18,5,'2024-08-14','CareFirst'),(19,7,'2024-10-03','MediShot'),(20,9,'2024-11-28','HealthGuard');
/*!40000 ALTER TABLE `Immunization_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice` (
  `Invoice_Number` int NOT NULL,
  `Medical_Record_Number` int NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Cost` int NOT NULL,
  `Total` int NOT NULL,
  PRIMARY KEY (`Invoice_Number`),
  KEY `FK_Patient_Invoice` (`Medical_Record_Number`),
  CONSTRAINT `FK_Patient_Invoice` FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Patient` (`Medical_Record_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,1,'Cardiology Consultation',150,150),(2,2,'Pediatric Vaccination',80,80),(3,3,'Orthopedic Evaluation',200,200),(4,4,'Neurology MRI',300,300),(5,5,'OB-GYN Ultrasound',250,250),(6,6,'General Checkup',100,100),(7,7,'Pediatric Checkup',120,120),(8,8,'Orthopedic Surgery Consult',180,180),(9,9,'Neurology EEG',220,220),(10,10,'OB-GYN Appointment',170,170),(11,2,'Cardiology Stress Test',200,200),(12,4,'Pediatric Consultation',130,130),(13,6,'Orthopedic Consultation',150,150),(14,8,'Neurology Follow-up',90,90),(15,10,'General Physical Examination',120,120),(16,1,'Cardiology Follow-up',100,100),(17,3,'Pediatric Follow-up',80,80),(18,5,'Orthopedic Follow-up',120,120),(19,7,'Neurology Consultation',150,150),(20,9,'OB-GYN Checkup',130,130),(21,1,'Cardiology ECG',80,80),(22,3,'Pediatric Immunization',100,100),(23,5,'Orthopedic X-ray',120,120),(24,7,'Neurology Medication Adjustment',90,90),(25,9,'OB-GYN Sonogram',180,180),(26,2,'Cardiology Angiogram',250,250),(27,4,'Pediatric Allergy Test',120,120),(28,6,'Orthopedic MRI',200,200),(29,8,'Neurology Headache Assessment',100,100),(30,10,'OB-GYN Fertility Consultation',140,140);
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medical_Record`
--

DROP TABLE IF EXISTS `Medical_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medical_Record` (
  `Medical_Record_Number` int NOT NULL,
  `Treatment_History` varchar(50) NOT NULL,
  `Surgical_History` varchar(50) NOT NULL,
  `Doctor_Notes` varchar(50) NOT NULL,
  PRIMARY KEY (`Medical_Record_Number`),
  CONSTRAINT `FK_Patient_Medical_Record` FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Patient` (`Medical_Record_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medical_Record`
--

LOCK TABLES `Medical_Record` WRITE;
/*!40000 ALTER TABLE `Medical_Record` DISABLE KEYS */;
INSERT INTO `Medical_Record` VALUES (1,'Cardiology Checkup, Flu Shot','Appendectomy in 2010','No significant notes'),(2,'Pediatric Vaccination, Allergy Test','Tonsillectomy in 2015','Patient is doing well'),(3,'Orthopedic Evaluation','Fracture repair in 2018','Recommend physiotherapy'),(4,'Neurology MRI, EEG','No surgical history','Prescribed medication for migraines'),(5,'OB-GYN Ultrasound, Pregnancy Consultation','No surgical history','Healthy pregnancy'),(6,'General Checkup','No surgical history','Patient in good health'),(7,'Pediatric Checkup','No surgical history','Child is growing well'),(8,'Orthopedic Consultation','ACL reconstruction in 2016','Recommend follow-up MRI'),(9,'Neurology Consultation','No surgical history','Patient experiencing headaches'),(10,'OB-GYN Appointment','No surgical history','Routine checkup'),(11,'Cardiology Stress Test','No surgical history','Stress test results normal'),(12,'Pediatric Consultation','No surgical history','Child is healthy'),(13,'Orthopedic Surgery Consult','Hip replacement in 2019','Patient recovering well'),(14,'Neurology Follow-up','No surgical history','Prescribed medication for epilepsy'),(15,'General Physical Examination','No surgical history','Patient in good health'),(16,'Cardiology ECG, Blood Pressure Monitoring','No surgical history','Monitoring cardiovascular health'),(17,'Pediatric Immunization, Growth Assessment','No surgical history','Child is meeting growth milestones'),(18,'Orthopedic X-ray, Joint Pain Evaluation','Knee arthroscopy in 2017','Recommend physical therapy'),(19,'Neurology Medication Adjustment','No surgical history','Adjusting medication for optimal effect'),(20,'OB-GYN Sonogram, Fertility Consultation','No surgical history','Discussion on fertility options');
/*!40000 ALTER TABLE `Medical_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medication`
--

DROP TABLE IF EXISTS `Medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medication` (
  `Medication_ID` int NOT NULL,
  `Medication_Name` varchar(50) NOT NULL,
  `Medication_Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Medication_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medication`
--

LOCK TABLES `Medication` WRITE;
/*!40000 ALTER TABLE `Medication` DISABLE KEYS */;
INSERT INTO `Medication` VALUES (1,'Aspirin','Pain reliever and anti-inflammatory'),(2,'Ibuprofen','Nonsteroidal anti-inflammatory drug (NSAID)'),(3,'Acetaminophen','Pain reliever and fever reducer'),(4,'Lisinopril','Angiotensin-converting enzyme (ACE) inhibitor'),(5,'Levothyroxine','Thyroid hormone replacement'),(6,'Metformin','Antidiabetic medication'),(7,'Atorvastatin','Statin for cholesterol management'),(8,'Losartan','Angiotensin II receptor blocker (ARB)'),(9,'Omeprazole','Proton pump inhibitor (PPI) for stomach issues'),(10,'Simvastatin','Statin for cholesterol management'),(11,'Metoprolol','Beta-blocker for hypertension'),(12,'Sertraline','Selective serotonin reuptake inhibitor (SSRI)'),(13,'Hydrochlorothiazide','Diuretic for fluid retention'),(14,'Gabapentin','Anticonvulsant and nerve pain medication'),(15,'Warfarin','Anticoagulant (blood thinner)'),(16,'Citalopram','Selective serotonin reuptake inhibitor (SSRI)'),(17,'Amlodipine','Calcium channel blocker for hypertension'),(18,'Albuterol','Bronchodilator for respiratory conditions'),(19,'Fluoxetine','Selective serotonin reuptake inhibitor (SSRI)'),(20,'Metronidazole','Antibiotic for bacterial infections');
/*!40000 ALTER TABLE `Medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medication_Record`
--

DROP TABLE IF EXISTS `Medication_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medication_Record` (
  `Medical_Record_Number` int NOT NULL,
  `Medication_ID` int NOT NULL,
  `Date_Administered` date NOT NULL,
  `Usage_Instructions` varchar(50) NOT NULL,
  PRIMARY KEY (`Medical_Record_Number`,`Medication_ID`,`Date_Administered`),
  KEY `FK_Medication_Medication_Record` (`Medication_ID`),
  CONSTRAINT `FK_Medical_Record_Medication_Record` FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Medical_Record` (`Medical_Record_Number`),
  CONSTRAINT `FK_Medication_Medication_Record` FOREIGN KEY (`Medication_ID`) REFERENCES `Medication` (`Medication_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medication_Record`
--

LOCK TABLES `Medication_Record` WRITE;
/*!40000 ALTER TABLE `Medication_Record` DISABLE KEYS */;
INSERT INTO `Medication_Record` VALUES (1,1,'2023-01-15','Take with food'),(1,3,'2023-02-02','As needed for fever'),(1,5,'2025-01-15','Take in the morning'),(2,3,'2023-02-20','As needed for pain'),(3,5,'2023-03-25','Take in the morning'),(3,5,'2023-05-15','Take in the morning'),(4,7,'2023-04-10','At bedtime'),(5,7,'2023-09-28','At bedtime'),(5,9,'2023-05-05','Empty stomach, one hour before meals'),(6,11,'2023-06-18','Once daily in the evening'),(7,13,'2023-07-22','Take with a full glass of water'),(8,15,'2023-08-30','Follow doctor’s instructions'),(9,2,'2023-09-12','With or after a meal'),(10,4,'2023-10-08','Take at the same time every day'),(11,6,'2023-11-14','Twice daily with meals'),(12,8,'2023-12-01','Check blood pressure regularly'),(13,10,'2024-01-05','Take with food or milk'),(14,12,'2024-02-19','Once daily in the morning'),(15,14,'2024-03-25','For nerve pain, as prescribed'),(16,1,'2024-05-10','Take with a full glass of water'),(17,3,'2024-06-22','As needed for pain'),(18,5,'2024-08-14','Once daily in the evening'),(19,7,'2024-10-03','Take with food'),(20,9,'2024-11-28','Check blood sugar regularly');
/*!40000 ALTER TABLE `Medication_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `Medical_Record_Number` int NOT NULL,
  `Patient_FName` varchar(50) NOT NULL,
  `Patient_LName` varchar(50) NOT NULL,
  `Patient_DoB` date NOT NULL,
  `Patient_Gender` enum('M','F') DEFAULT NULL,
  `Patient_Address` varchar(50) NOT NULL,
  `Patient_Phone_Number` int NOT NULL,
  `Patient_Emergency_Contact` int NOT NULL,
  `Blood_Type` varchar(50) NOT NULL,
  `Insurance` varchar(50) NOT NULL,
  PRIMARY KEY (`Medical_Record_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'John','Doe','1990-01-15','M','123 Main St',2147483647,2147483647,'O+','XYZ Insurance'),(2,'Jane','Smith','1985-05-22','F','456 Oak St',2147483647,2147483647,'A-','ABC Insurance'),(3,'Bob','Johnson','1978-11-08','M','789 Pine St',2147483647,2147483647,'B+','DEF Insurance'),(4,'Alice','Williams','1995-03-17','F','101 Elm St',2147483647,2147483647,'AB+','GHI Insurance'),(5,'Michael','Brown','1982-09-30','M','202 Cedar St',2147483647,2147483647,'O-','JKL Insurance'),(6,'Sara','Garcia','1993-07-12','F','303 Maple St',2147483647,2147483647,'A+','MNO Insurance'),(7,'Daniel','Martinez','1989-04-25','M','404 Birch St',2147483647,2147483647,'B-','PQR Insurance'),(8,'Emily','Davis','1998-02-03','F','505 Walnut St',2147483647,2147483647,'AB-','STU Insurance'),(9,'Ryan','Taylor','1976-06-19','M','606 Spruce St',2147483647,2147483647,'O+','VWX Insurance'),(10,'Megan','Clark','1991-12-08','F','707 Pine St',2147483647,2147483647,'A-','YZA Insurance'),(11,'Alex','Miller','1987-08-14','M','808 Oak St',2147483647,2147483647,'A+','ABC Insurance'),(12,'Olivia','Wright','1996-01-25','F','909 Pine St',2147483647,2147483647,'B-','DEF Insurance'),(13,'Ethan','Lee','1980-04-02','M','101 Cedar St',2147483647,2147483647,'AB+','GHI Insurance'),(14,'Sophia','Hill','1999-11-11','F','202 Elm St',2147483647,2147483647,'O-','JKL Insurance'),(15,'Logan','Baker','1984-07-08','M','303 Maple St',2147483647,2147483647,'A+','MNO Insurance'),(16,'Ava','Carter','1997-03-19','F','404 Birch St',2147483647,2147483647,'B-','PQR Insurance'),(17,'Mason','Cooper','1988-09-26','M','505 Walnut St',2147483647,2147483647,'AB-','STU Insurance'),(18,'Emma','Fisher','1994-05-03','F','606 Spruce St',2147483647,2147483647,'O+','VWX Insurance'),(19,'Jackson','Gordon','1979-12-22','M','707 Pine St',2147483647,2147483647,'A-','YZA Insurance'),(20,'Isabella','Hudson','1992-06-05','F','808 Oak St',2147483647,2147483647,'B+','BCD Insurance');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;
/*SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;*/
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-22 12:34:37
