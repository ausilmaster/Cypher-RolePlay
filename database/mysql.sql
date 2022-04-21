/*
 Navicat MySQL Data Transfer

 Source Server         : ta
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : cypher

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 21/04/2022 15:37:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Skin` int NOT NULL,
  `Admin` int NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Sex` int NOT NULL,
  `Lifetime` float NOT NULL,
  `Jacket` float NOT NULL,
  `Deaths` int NOT NULL,
  `Kill` int NOT NULL,
  `Faction` int NOT NULL,
  `Rank` int NOT NULL,
  `Job` int NOT NULL,
  `Cash` int NOT NULL,
  `Interior` int NOT NULL,
  `VW` int NOT NULL,
  `Age` int NOT NULL,
  UNIQUE INDEX `ID`(`ID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (6, 'Ausil_Ausil', 'zxzc', 250, 9, 1828.89, -1843.5, 13.578, 0, 100, 0, 0, 0, 0, 0, 0, 550, 0, 0, 30);

SET FOREIGN_KEY_CHECKS = 1;
