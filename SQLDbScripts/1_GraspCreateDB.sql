IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'GRASP')
BEGIN
CREATE DATABASE [GRASP]
END ELSE
BEGIN
USE [master]
DROP DATABASE [GRASP]
CREATE DATABASE [GRASP]
END
 
