USE master
GO
IF DB_ID('UniversityMedicalCenter') IS NOT NULL
  DROP DATABASE UniversityMedicalCenter;
GO
CREATE DATABASE UniversityMedicalCenter;
GO