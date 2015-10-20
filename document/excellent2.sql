/*
Navicat MySQL Data Transfer

Source Server         : excellent
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : excellent2

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-10-20 17:55:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `academy`
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academy
-- ----------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Passwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `award`
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `ID` bigint(20) NOT NULL,
  `Content` text,
  `StudentID` int(11) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentID` (`StudentID`),
  KEY `TeacherID` (`TeacherID`),
  CONSTRAINT `award_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`ID`),
  CONSTRAINT `award_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of award
-- ----------------------------

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `StudyModel` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `ID` int(11) NOT NULL,
  `Content` text,
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `NewsID` int(11) DEFAULT NULL,
  `MessageID` int(11) DEFAULT NULL,
  `CommentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NewsID` (`NewsID`),
  KEY `MessageID` (`MessageID`),
  KEY `CommentID` (`CommentID`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`ID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`NewsID`) REFERENCES `news` (`ID`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`MessageID`) REFERENCES `message` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Summary` text,
  `EnterpriseTraining` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `library`
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Summary` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of library
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `ID` int(11) NOT NULL,
  `Content` text,
  `StudentID` int(11) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `ID` int(11) NOT NULL,
  `Content` text,
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ClassID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `recruit`
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit` (
  `ID` int(11) NOT NULL,
  `Content` text,
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CompanyID` (`CompanyID`),
  CONSTRAINT `recruit_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit
-- ----------------------------

-- ----------------------------
-- Table structure for `resume`
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `ID` int(11) NOT NULL,
  `Content` text,
  `Time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `StudentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `resume_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `Name` varchar(0) DEFAULT NULL,
  `BornDate` time DEFAULT NULL,
  `PhotoLink` varchar(255) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `GraduationDes` varchar(255) DEFAULT NULL,
  `PersonalInt` text,
  PRIMARY KEY (`ID`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `class` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `BornDate` date DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `PhotoLink` varchar(255) DEFAULT NULL,
  `AcademyId` int(11) DEFAULT NULL,
  `PersonalInt` text,
  `LiblaryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AcademyId` (`AcademyId`),
  KEY `LiblaryId` (`LiblaryId`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`AcademyId`) REFERENCES `academy` (`ID`),
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`LiblaryId`) REFERENCES `library` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
