/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50633
 Source Host           : localhost:3306
 Source Schema         : mobilescm

 Target Server Type    : MySQL
 Target Server Version : 50633
 File Encoding         : 65001

 Date: 20/12/2017 11:22:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for basic_accessorytype
-- ----------------------------
DROP TABLE IF EXISTS `basic_accessorytype`;
CREATE TABLE `basic_accessorytype`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `specification` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `produceFactory` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_accessorytype
-- ----------------------------
INSERT INTO `basic_accessorytype` VALUES ('njy-001', '玻璃屏', '套', '大猩猩玻璃', '大猩猩', '曲面屏', '诺基亚');
INSERT INTO `basic_accessorytype` VALUES ('ry-001', '手机充电器', '个', '5V', '富士通', '平面', '荣耀');
INSERT INTO `basic_accessorytype` VALUES ('ry-002', '耳机', '副', '立体声', '索尼', '荣耀引擎耳机', '荣耀');
INSERT INTO `basic_accessorytype` VALUES ('ry-003', '手机壳', '个', '硅胶', '荣耀', '透明手机壳', '荣耀');

-- ----------------------------
-- Table structure for basic_account
-- ----------------------------
DROP TABLE IF EXISTS `basic_account`;
CREATE TABLE `basic_account`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` decimal(15, 2) DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `departmentId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_account
-- ----------------------------
INSERT INTO `basic_account` VALUES ('36192E9DEEEB4F1399DFE9198252D44D', NULL, '农行账户', 10000.00, '重庆农业银行', '47DAF9B6E0F54A7FAC847F209719E913');
INSERT INTO `basic_account` VALUES ('9A629AF7EC4A44A4A72ED9D13A818FC9', NULL, '公司总账户', 500000000.00, '总是总账', '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `basic_account` VALUES ('CB952D1FB70C4ADE94EA5A8750092FC8', NULL, '商业银行', 20000.00, '重庆农村商业银行', '47DAF9B6E0F54A7FAC847F209719E913');

-- ----------------------------
-- Table structure for basic_bonustype
-- ----------------------------
DROP TABLE IF EXISTS `basic_bonustype`;
CREATE TABLE `basic_bonustype`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_bonustype
-- ----------------------------
INSERT INTO `basic_bonustype` VALUES ('3AE719D7F07D44E9838FB2C2445DD7F7', '达量返', '达到一定数量后返利');
INSERT INTO `basic_bonustype` VALUES ('A0828FAD3EBF469E815071A8499737F3', '基本返', '基本返利');
INSERT INTO `basic_bonustype` VALUES ('F4F61772251845EA8FD8D1EA82D60327', '追加返', '追加返利');

-- ----------------------------
-- Table structure for basic_brand
-- ----------------------------
DROP TABLE IF EXISTS `basic_brand`;
CREATE TABLE `basic_brand`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_brand
-- ----------------------------
INSERT INTO `basic_brand` VALUES ('05237EDEBFBE48E183CADC0B5FF943DD', '荣耀');
INSERT INTO `basic_brand` VALUES ('0B7D4C7C0F6B4D5FB06027968F097470', '小米');
INSERT INTO `basic_brand` VALUES ('18036B3285F849A486DA8DD7C274F759', '诺基亚');
INSERT INTO `basic_brand` VALUES ('8B143B1695AE462DB2676F26D9C608F7', '华为');
INSERT INTO `basic_brand` VALUES ('FFE8D5A4D60A401389F7F87388844D5D', '三星');

-- ----------------------------
-- Table structure for basic_color
-- ----------------------------
DROP TABLE IF EXISTS `basic_color`;
CREATE TABLE `basic_color`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_color
-- ----------------------------
INSERT INTO `basic_color` VALUES ('0227864DEC02402B9E01A76FF9CC2206', '极光蓝');
INSERT INTO `basic_color` VALUES ('3C6C39887F484E9196ADBFF9D87848EB', '粉色');
INSERT INTO `basic_color` VALUES ('7D1961CBC5F144E79441C633AE5CD630', '黑色');
INSERT INTO `basic_color` VALUES ('AFB89961125240AEBF58751582E168DC', '红色');
INSERT INTO `basic_color` VALUES ('F7A152FC74AA4BEF8034ED5AA38A8236', '白色');

-- ----------------------------
-- Table structure for basic_config
-- ----------------------------
DROP TABLE IF EXISTS `basic_config`;
CREATE TABLE `basic_config`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_config
-- ----------------------------
INSERT INTO `basic_config` VALUES ('375D680F3A5B4AE4A8501A373CF10BF8', '一电一充+耳机');
INSERT INTO `basic_config` VALUES ('580562209759462C9EEB8CA3E5CB2CAC', '保护壳');
INSERT INTO `basic_config` VALUES ('C886284C708843F5B1734C7E682BC6CC', '一电一充');

-- ----------------------------
-- Table structure for basic_customer
-- ----------------------------
DROP TABLE IF EXISTS `basic_customer`;
CREATE TABLE `basic_customer`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkMan` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customerTypeId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_customer
-- ----------------------------
INSERT INTO `basic_customer` VALUES ('C_001', '诺基亚北碚销售点', '小贝罗', '023-43898232', 'xiaobeiluo@163.com', '重庆市北碚区重百', '9023894', '合作期限6个月', 'CT_DUANQI');
INSERT INTO `basic_customer` VALUES ('C_002', '华为北碚区销售的', '小贝', '023-54782984', 'xiaobei@163.com', '重庆北碚区天生路', '', '每月20台订单', 'CT_CHANGQI');
INSERT INTO `basic_customer` VALUES ('C_004', '华为重庆沙坪坝区', '小沙', '182378747263', 'xiaosha@163.com', '重庆市沙坪坝区', '89873827', '1000台客户', 'CT_CHANGQI');

-- ----------------------------
-- Table structure for basic_customerprice
-- ----------------------------
DROP TABLE IF EXISTS `basic_customerprice`;
CREATE TABLE `basic_customerprice`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10, 3) NOT NULL DEFAULT 0.000,
  `customerId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobileType_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for basic_customertype
-- ----------------------------
DROP TABLE IF EXISTS `basic_customertype`;
CREATE TABLE `basic_customertype`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_customertype
-- ----------------------------
INSERT INTO `basic_customertype` VALUES ('CT_CHANGQI', '长期合作客户', '3年以上');
INSERT INTO `basic_customertype` VALUES ('CT_DUANQI', '短期合作客户', '3年以下');

-- ----------------------------
-- Table structure for basic_mobilebonus
-- ----------------------------
DROP TABLE IF EXISTS `basic_mobilebonus`;
CREATE TABLE `basic_mobilebonus`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bonusPrice` decimal(10, 3) DEFAULT 0.000,
  `mobileTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bonusTypeId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_mobilebonus
-- ----------------------------
INSERT INTO `basic_mobilebonus` VALUES ('0530004E01C242A7A6CB023D263F3253', 66.000, 'hw-003', 'A0828FAD3EBF469E815071A8499737F3');
INSERT INTO `basic_mobilebonus` VALUES ('3C2D7DE7C412476D991259E09695430E', 23.000, 'hw-002', 'A0828FAD3EBF469E815071A8499737F3');
INSERT INTO `basic_mobilebonus` VALUES ('60B8D47D4C4346D8A9F09D3D20608A99', 43.000, 'hw-003', '3AE719D7F07D44E9838FB2C2445DD7F7');
INSERT INTO `basic_mobilebonus` VALUES ('E7C4B8CABE1742D2BA1EEF1A2D021D60', 43.000, 'HW-001', '3AE719D7F07D44E9838FB2C2445DD7F7');
INSERT INTO `basic_mobilebonus` VALUES ('EBDDAE6E239647BC8D92418CA22FA63A', 54.000, 'hw-002', '3AE719D7F07D44E9838FB2C2445DD7F7');

-- ----------------------------
-- Table structure for basic_mobiletype
-- ----------------------------
DROP TABLE IF EXISTS `basic_mobiletype`;
CREATE TABLE `basic_mobiletype`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyPrice` decimal(10, 2) DEFAULT 0.00,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_mobiletype
-- ----------------------------
INSERT INTO `basic_mobiletype` VALUES ('HW-001', '华为A', 3300.00, '华为手机', '华为', NULL);
INSERT INTO `basic_mobiletype` VALUES ('hw-002', 'hw-002', 6543.00, 'hw-002', '华为', NULL);
INSERT INTO `basic_mobiletype` VALUES ('hw-003', 'hw-003', 6534.00, '华为', '华为', NULL);
INSERT INTO `basic_mobiletype` VALUES ('NN-001', '诺基亚N8', 3333.00, '建议零售价3555', '诺基亚', NULL);

-- ----------------------------
-- Table structure for basic_supplier
-- ----------------------------
DROP TABLE IF EXISTS `basic_supplier`;
CREATE TABLE `basic_supplier`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkMan` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplierTypeId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_supplier
-- ----------------------------
INSERT INTO `basic_supplier` VALUES ('HUAWEI_CQ', '华为供应商', '小华', '023-54686205', 'xiaohua@huawei.com', '重庆市沙坪坝区华为批发城', '华为重庆地区批发部', 'ST_PIFA');
INSERT INTO `basic_supplier` VALUES ('NOKIA_CQ', '诺基亚手机供应商', '小诺', '18523225327', 'xiaonuo@nokia.com', '重庆市渝中区电子城', '诺基亚大众化西南区批发部', 'ST_PIFA');

-- ----------------------------
-- Table structure for basic_suppliertype
-- ----------------------------
DROP TABLE IF EXISTS `basic_suppliertype`;
CREATE TABLE `basic_suppliertype`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_suppliertype
-- ----------------------------
INSERT INTO `basic_suppliertype` VALUES ('ST_001', '本地供应商', '重庆地区');
INSERT INTO `basic_suppliertype` VALUES ('ST_002', '厂家供货', '华为、诺基亚、iPhone');
INSERT INTO `basic_suppliertype` VALUES ('ST_003', '华南区供应商', '华南区');
INSERT INTO `basic_suppliertype` VALUES ('ST_JIAMENG', '加盟型供应商', '优点是合同加盟，指导运作，不像批发商商品出门以后就不管了，缺点是现在用这种方式经营的骗子太多，而且加盟商收取加盟费不规范。');
INSERT INTO `basic_suppliertype` VALUES ('ST_LIANSHUO', '连锁型供应商', '');
INSERT INTO `basic_suppliertype` VALUES ('ST_PIFA', '批发型供应商', '批发型供应商优势的商品批量大，价格低，缺点是对购买批量小的客户他一般不接纳');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkman` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('47DAF9B6E0F54A7FAC847F209719E913', '销售部', '3层502', '57843898', 'XiaoShou', '销售人员');
INSERT INTO `department` VALUES ('5106D66DE2AD42B5986F944D8E865444', '董事会', '18层董事局', '54686205', 'ChiangchouBO', '丽洲集团');
INSERT INTO `department` VALUES ('65EBF040B74E4E73B3D7C475F01AFDC8', '技术部', '科技园区', '5893787', 'Ji.Shu', '这个人很厉害啊');
INSERT INTO `department` VALUES ('B92AE7713BBF4FD38A997F92B33D98C9', '人力资源部', '5层', '54433892', '王毅', '外交部长');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `departmentId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1D22C965DE3F432B8E484C59AF477303', '李白', '1239873872', 1, '销售人才', NULL, '47DAF9B6E0F54A7FAC847F209719E913');
INSERT INTO `employee` VALUES ('4ECC27BC694D47318BD85D21F4F274A5', 'Ji.Shu', '189372874923', 2, '首席架构师', '9E304DAFFC4B40788477A61D1D99B510', '65EBF040B74E4E73B3D7C475F01AFDC8');
INSERT INTO `employee` VALUES ('92695BBC5575446EB1A109A0C2F0590A', 'Mr.Java', '18782378473', 2, '程序员', '703368B5B8FF40F3AC92F347D76CBF92', '65EBF040B74E4E73B3D7C475F01AFDC8');
INSERT INTO `employee` VALUES ('BC18434ABFBC4B958A6E0EEF2EAB8F7F', 'wangan', '18523225327', 2, 'CEO拥有所有权限！', '84D1E33948DA486D85B08C21AAC7BA59', '5106D66DE2AD42B5986F944D8E865444');

-- ----------------------------
-- Table structure for stock_mobilestock
-- ----------------------------
DROP TABLE IF EXISTS `stock_mobilestock`;
CREATE TABLE `stock_mobilestock`  (
  `numberOne` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `numberTwo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileStorageId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstSupplierId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstStockDate` datetime(0) DEFAULT NULL,
  `lastSupplierId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastStockDate` datetime(0) DEFAULT NULL,
  `buyPrice` decimal(10, 2) DEFAULT NULL,
  `cost` decimal(10, 2) DEFAULT NULL,
  `lossAmount` decimal(10, 2) DEFAULT NULL,
  `departmentId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`numberOne`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_mobilestock
-- ----------------------------
INSERT INTO `stock_mobilestock` VALUES ('9087654353455', '', 'HW-001201704241500', 'HW-001', '黑色', '', 'HUAWEI_CQ', '2017-04-24 15:00:19', NULL, NULL, 5435.00, 5435.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);
INSERT INTO `stock_mobilestock` VALUES ('N8-001-D', '', 'NN-001201606041540', 'NN-001', '蓝色', '一电一充', 'NOKIA_CQ', '2017-04-04 15:40:53', NULL, NULL, 1600.00, 1600.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);
INSERT INTO `stock_mobilestock` VALUES ('RY7-001', 'RY7-001-S', '003201606041500', 'hh-003', '蓝色', '一电一充+耳机', 'HUAWEI_CQ', '2017-04-04 15:00:56', NULL, NULL, 1400.00, 1400.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);
INSERT INTO `stock_mobilestock` VALUES ('RY7-001-D', '', '003201606041500', 'hh-003', '蓝色', '一电一充+耳机', 'HUAWEI_CQ', '2017-04-04 15:00:56', NULL, NULL, 1400.00, 1400.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);
INSERT INTO `stock_mobilestock` VALUES ('RY7-002', 'RY7-002-S', '003201606041500', 'hh-003', '蓝色', '一电一充+耳机', 'HUAWEI_CQ', '2017-04-04 15:00:56', NULL, NULL, 1400.00, 1400.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);
INSERT INTO `stock_mobilestock` VALUES ('RY7-002-D', '', '003201606041500', 'hh-003', '蓝色', '一电一充+耳机', 'HUAWEI_CQ', '2017-04-04 15:00:56', NULL, NULL, 1400.00, 1400.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);
INSERT INTO `stock_mobilestock` VALUES ('RY7-003', 'RY7-003-S', '003201606041500', 'hh-003', '蓝色', '一电一充+耳机', 'HUAWEI_CQ', '2017-04-04 15:00:56', NULL, NULL, 1400.00, 1400.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);
INSERT INTO `stock_mobilestock` VALUES ('RY7-003-D', '', '003201606041500', 'hh-003', '蓝色', '一电一充+耳机', 'HUAWEI_CQ', '2017-04-04 15:00:56', NULL, NULL, 1400.00, 1400.00, 0.00, '5106D66DE2AD42B5986F944D8E865444', 1);

-- ----------------------------
-- Table structure for supplier_mobilereturn
-- ----------------------------
DROP TABLE IF EXISTS `supplier_mobilereturn`;
CREATE TABLE `supplier_mobilereturn`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `supplierId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `returnPrice` decimal(10, 2) DEFAULT NULL,
  `amount` decimal(10, 0) DEFAULT NULL,
  `totalMoney` decimal(15, 2) DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputDate` date DEFAULT NULL,
  `inputUserId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkDate` datetime(0) DEFAULT NULL,
  `checkUserId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `departmentId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_mobilereturn
-- ----------------------------
INSERT INTO `supplier_mobilereturn` VALUES ('hw-003201704241651', 'HUAWEI_CQ', 'hw-003', 654.00, 1, 654.00, '这手机有问题啊', '2017-04-24', '84D1E33948DA486D85B08C21AAC7BA59', '2017-04-24 16:56:09', '84D1E33948DA486D85B08C21AAC7BA59', 1, '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `supplier_mobilereturn` VALUES ('NN-001201606091028', 'NOKIA_CQ', 'NN-001', 1800.00, 2, 3600.00, '手机损坏退货', '2017-04-24', '84D1E33948DA486D85B08C21AAC7BA59', '2016-06-09 10:43:34', '84D1E33948DA486D85B08C21AAC7BA59', 1, '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `supplier_mobilereturn` VALUES ('NN-001201606091056', 'NOKIA_CQ', 'NN-001', 1800.00, 1, 1800.00, '手机缺损换货', '2017-04-24', '84D1E33948DA486D85B08C21AAC7BA59', '2016-06-09 10:59:09', '84D1E33948DA486D85B08C21AAC7BA59', 1, '5106D66DE2AD42B5986F944D8E865444');

-- ----------------------------
-- Table structure for supplier_mobilereturnnumber
-- ----------------------------
DROP TABLE IF EXISTS `supplier_mobilereturnnumber`;
CREATE TABLE `supplier_mobilereturnnumber`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobileReturnId` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `numberOne` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numberTwo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_mobilereturnnumber
-- ----------------------------
INSERT INTO `supplier_mobilereturnnumber` VALUES ('9D5A1FC511974E8C96E152CBB6B82670', 'hw-003201704241651', '2345678987654', '');
INSERT INTO `supplier_mobilereturnnumber` VALUES ('A1B90F17F587484DA2D1813C3EC9102C', 'NN-001201606091028', 'N8-002-D', '');
INSERT INTO `supplier_mobilereturnnumber` VALUES ('A34B95C320FE4338BC1C9273FFA4C33B', 'NN-001201606091056', 'N8-002', 'N8-002-S');
INSERT INTO `supplier_mobilereturnnumber` VALUES ('BD87BBBE810644ADB4611F8D34F27B1D', 'NN-001201606091028', 'N8-001', 'N8-001-S');

-- ----------------------------
-- Table structure for supplier_mobilestorage
-- ----------------------------
DROP TABLE IF EXISTS `supplier_mobilestorage`;
CREATE TABLE `supplier_mobilestorage`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `supplierId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyPrice` decimal(10, 2) DEFAULT NULL,
  `amount` decimal(10, 0) DEFAULT NULL,
  `totalMoney` decimal(15, 2) DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputDate` date DEFAULT NULL,
  `inputUserId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkDate` datetime(0) DEFAULT NULL,
  `checkUserId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `departmentId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_mobilestorage
-- ----------------------------
INSERT INTO `supplier_mobilestorage` VALUES ('hh-003201606041500', 'HUAWEI_CQ', 'hh-003', '蓝色', '一电一充+耳机', 1400.00, 6, 8400.00, '2015年荣耀旗舰机', '2016-06-04', '84D1E33948DA486D85B08C21AAC7BA59', NULL, NULL, 0, '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `supplier_mobilestorage` VALUES ('HW-001201704241103', 'HUAWEI_CQ', 'HW-001', '极光蓝', '', 6878.00, 1, 6878.00, '华为手机', '2017-04-24', '84D1E33948DA486D85B08C21AAC7BA59', '2017-04-24 14:18:24', '84D1E33948DA486D85B08C21AAC7BA59', 1, '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `supplier_mobilestorage` VALUES ('HW-001201704241115', 'HUAWEI_CQ', 'HW-001', '极光蓝', '', 4567.00, 1, 4567.00, '华为手机', '2017-04-24', '84D1E33948DA486D85B08C21AAC7BA59', NULL, NULL, 0, '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `supplier_mobilestorage` VALUES ('HW-001201704241500', 'HUAWEI_CQ', 'HW-001', '黑色', '', 5435.00, 1, 5435.00, '华为手机', '2017-04-24', '84D1E33948DA486D85B08C21AAC7BA59', NULL, NULL, 0, '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `supplier_mobilestorage` VALUES ('hw-003201704241638', 'HUAWEI_CQ', 'hw-003', '黑色', '保护壳', 3455.00, 1, 3455.00, '华为供应商', '2017-04-24', '84D1E33948DA486D85B08C21AAC7BA59', '2017-04-24 16:40:25', '84D1E33948DA486D85B08C21AAC7BA59', 1, '5106D66DE2AD42B5986F944D8E865444');
INSERT INTO `supplier_mobilestorage` VALUES ('NN-001201606041540', 'NOKIA_CQ', 'NN-001', '蓝色', '一电一充', 1600.00, 4, 6400.00, '诺基亚最新款', '2016-06-04', '84D1E33948DA486D85B08C21AAC7BA59', '2016-06-04 15:44:37', '84D1E33948DA486D85B08C21AAC7BA59', 1, '5106D66DE2AD42B5986F944D8E865444');

-- ----------------------------
-- Table structure for supplier_serialnumber
-- ----------------------------
DROP TABLE IF EXISTS `supplier_serialnumber`;
CREATE TABLE `supplier_serialnumber`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobileStorageId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `numberOne` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numberTwo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_serialnumber
-- ----------------------------
INSERT INTO `supplier_serialnumber` VALUES ('0ED03E819993416AA6678F19FBD66BD7', 'hh-003201606041500', 'RY7-003', 'RY7-003-S');
INSERT INTO `supplier_serialnumber` VALUES ('4128A9DF30EA40EE893DF1AB5D467FBE', 'hh-003201606041500', 'RY7-003-D', '');
INSERT INTO `supplier_serialnumber` VALUES ('463E4EE4D92B4971A7B03F6714A8D953', 'hh-003201606041500', 'RY7-002-D', '');
INSERT INTO `supplier_serialnumber` VALUES ('4CCB64C2C0184581BA2E766BE2EEE5C3', 'HW-001201704241500', '9087654353455', '');
INSERT INTO `supplier_serialnumber` VALUES ('662FDA00BFA64B9980A0B31CBA72EE5B', 'hw-002201704241457', '743765757567', '');
INSERT INTO `supplier_serialnumber` VALUES ('6BB7A78AC89244C89689AD2EE6C44CE9', 'hh-003201606041500', 'RY7-001-D', '');
INSERT INTO `supplier_serialnumber` VALUES ('7294E25D5D544190A9621AD973DE0B28', 'hh-003201606041500', 'RY7-002', 'RY7-002-S');
INSERT INTO `supplier_serialnumber` VALUES ('8BFD80AB99224E6A90BE3560BE43297A', 'hh-003201606041500', 'RY7-001', 'RY7-001-S');
INSERT INTO `supplier_serialnumber` VALUES ('90006681549C4E0FAA9B7A8540DC0A3E', 'NN-001201606041540', 'N8-002', 'N8-002-S');
INSERT INTO `supplier_serialnumber` VALUES ('97397FFF39DE42BE905636905B177FB9', 'NN-001201606041540', 'N8-001-D', '');
INSERT INTO `supplier_serialnumber` VALUES ('B8F6EA7F5128475F93B18D7D40ADF3F2', 'NN-001201606041540', 'N8-002-D', '');
INSERT INTO `supplier_serialnumber` VALUES ('C24FB36A635D4C1D98E93BF65E713831', 'hw-003201704241638', '2345678987654', '');
INSERT INTO `supplier_serialnumber` VALUES ('CDE6148DD5DC46DCA2BFC86B843496DA', 'NN-001201606041540', 'N8-001', 'N8-001-S');

-- ----------------------------
-- Table structure for supplier_tradedetail
-- ----------------------------
DROP TABLE IF EXISTS `supplier_tradedetail`;
CREATE TABLE `supplier_tradedetail`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(11) DEFAULT 0,
  `supplierId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tradeType` int(11) DEFAULT NULL,
  `typeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `unitPrice` decimal(10, 2) DEFAULT NULL,
  `inputDate` datetime(0) DEFAULT NULL,
  `inputUserId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkDate` datetime(0) DEFAULT NULL,
  `checkUserId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalMoney` decimal(15, 2) DEFAULT NULL,
  `departmentId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_tradedetail
-- ----------------------------
INSERT INTO `supplier_tradedetail` VALUES ('hh-003201606041500', 0, 'HUAWEI_CQ', 1, 'hh-003', 6, 1400.00, '2017-04-24 15:00:56', '84D1E33948DA486D85B08C21AAC7BA59', '2016-06-09 10:57:08', '', 8400.00, '5106D66DE2AD42B5986F944D8E865444', '2015年荣耀旗舰机');
INSERT INTO `supplier_tradedetail` VALUES ('HW-001201704241500', 0, 'HUAWEI_CQ', 1, 'HW-001', 1, 5435.00, '2017-04-24 15:00:19', '84D1E33948DA486D85B08C21AAC7BA59', NULL, NULL, 5435.00, '5106D66DE2AD42B5986F944D8E865444', '华为手机');
INSERT INTO `supplier_tradedetail` VALUES ('hw-003201704241638', 1, 'HUAWEI_CQ', 1, 'hw-003', 1, 3455.00, '2017-04-24 16:38:11', '84D1E33948DA486D85B08C21AAC7BA59', '2017-04-24 16:40:25', '84D1E33948DA486D85B08C21AAC7BA59', 3455.00, '5106D66DE2AD42B5986F944D8E865444', '华为供应商');
INSERT INTO `supplier_tradedetail` VALUES ('hw-003201704241651', 1, 'HUAWEI_CQ', 2, 'hw-003', 1, 654.00, '2017-04-24 16:51:35', '84D1E33948DA486D85B08C21AAC7BA59', '2017-04-24 16:56:09', '84D1E33948DA486D85B08C21AAC7BA59', 654.00, '5106D66DE2AD42B5986F944D8E865444', '这手机有问题啊');
INSERT INTO `supplier_tradedetail` VALUES ('NN-001201606041540', 1, 'NOKIA_CQ', 1, 'NN-001', 4, 1600.00, '2017-04-24 15:40:53', '84D1E33948DA486D85B08C21AAC7BA59', '2016-06-09 10:43:34', '84D1E33948DA486D85B08C21AAC7BA59', 6400.00, '5106D66DE2AD42B5986F944D8E865444', '诺基亚最新款');
INSERT INTO `supplier_tradedetail` VALUES ('NN-001201606091028', 1, 'NOKIA_CQ', 2, 'NN-001', 2, 1800.00, '2017-04-24 10:28:56', '84D1E33948DA486D85B08C21AAC7BA59', '2016-06-09 10:43:34', '84D1E33948DA486D85B08C21AAC7BA59', 3600.00, '5106D66DE2AD42B5986F944D8E865444', '手机损坏退货');
INSERT INTO `supplier_tradedetail` VALUES ('NN-001201606091056', 1, 'NOKIA_CQ', 2, 'NN-001', 1, 1800.00, '2017-04-24 10:56:37', '84D1E33948DA486D85B08C21AAC7BA59', '2016-06-09 10:59:09', '84D1E33948DA486D85B08C21AAC7BA59', 1800.00, '5106D66DE2AD42B5986F944D8E865444', '手机缺损换货');

-- ----------------------------
-- Table structure for sys_action
-- ----------------------------
DROP TABLE IF EXISTS `sys_action`;
CREATE TABLE `sys_action`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `menuId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_action
-- ----------------------------
INSERT INTO `sys_action` VALUES ('044F1AF835DE41D49E3CD7D458EC88A9', '/accessoryType/list', 1, '748EBE8CC7F141E1B5DC55518CB6B23F', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('0C2C597331A549769AD008344BB125D0', '123', 1, '933383AFB268462A9054E0C7EAF99030', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('0CEEF819CE984E679D65FF7B8F60BFCD', '/role/roleList', 1, '7952ADCE8BE94659903BF32E3737A322', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('0F4925205C8341DF83B7D0A11F3C6DD5', '/mobileReturn/list', 1, 'EF99DA4BBF394222A73C4B9DA87DA100', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('15427E2887F9478D9D734F1FD264151A', '/user/listUser', 1, 'ACB72617219F474DBC60CA01DC74D4A2', '获取用户集合');
INSERT INTO `sys_action` VALUES ('1F5FC38D7EFD4AAB8655B5B7EEFA97B9', '', 1, '5803FEDE878344F69290B99ECF12DF8A', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('3008227DA614435A875F6FCDBF40CF53', '/mobileStorage/list', 1, '7812E5294DC6406D8229D384F2D538AA', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('4260C6E4F9264D98A7D9C6959EFD9E51', '123', 1, '63D2CACCF63E4AA8B72194C3851B0A78', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('44DF836F0C2B4873B6E658E8A73EF9B9', '/tradeDetail/list', 1, '2B82868A0EAA45F6B1728328764247DD', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('4E283D7758EA4DA4B7F3D5751771B83C', '/supplier/list', 1, '0ED688E8C9C64A189488A6EFFDC756ED', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('532145EE5140486DBE72F0ED95B6AA12', '/user/toModifyPasswdView', 1, '5F0D2570016B41D18E0CEB83FF8F2AE5', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('5B5006ADEE5E4121BC79BD08DA0E061A', '/bonusType/list', 1, '533F50404E084706A7268ABC328DEFB5', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('5CDB1667EDC342248A96730E51B1488D', '/basic/listDepartment', 1, '691BB7442DED45F2A2D36F802C33E7B6', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('5FBDF1FD0CE64478AD72CC6D757EDF84', '123', 1, '3B814410C63849DEAA88106D3CDBA695', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('7F42531633B14474B43038FAAE5DC44A', '/basic/listEmployee', 1, '5BBE507F8451446DAAE0085EBC9DCD74', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('819AFD28DF284BCB84D5C57D6BB9B594', 'javascript:;', 1, '9946C289C49D4ADD93E9EB7B6E3AA9BE', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('8D4C935FF36C45BAA3327E0D9A57CF4B', '123', 1, 'C0AF0B9E269842239DABAEFF7CBC913A', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('8DDBE487A1554B24BA1D6FEDA1060C3C', '123', 1, '8B2ADEFD065648D8BFBE73BEB62AE83E', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('9223B77EDCF546CA8944C67D636277BD', '123', 1, 'B72883980749409999720272F6D5841C', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('92C65D688A48462190F9E3199978A271', '/mobileBasic/list?table=basic_brand', 1, '4BD95DC3380F44B0B280CC11FD31433C', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('932AD6493FE84278ABF9714DCE67252F', '/menu/toMenuTreeView', 1, '0AC72214D36F4B69B02EC662A055E0DF', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('9CC2AA30FD924F3BA5F0F829727DB5C8', '/supplierType/list', 1, 'C6CB628964FB453EB7362BA20DE422FA', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('A886DA9DD9AB4A2682713DE8510E9F2F', '/log/listLog', 1, 'BE2E58BAFA8E4AF19E42FCB32BFBB4F0', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('AF4DA5A8AB99437FB9BB4E2299CD045B', '/chart/list', 1, '48021C719844402A9FCA39D5CE824B75', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('B1AE02248D0A43BAAE275C9411FFB903', '123', 1, '6EC307FA700E41AB8DD27143D8A33043', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('B49B30EA330F4D818237A558897F1B27', '/privilege/toPrivilegeView', 1, 'D5DBBFDE5EC549FF8E179C505C7B662A', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('BD171B799F6D4E78BF84E2862D1DCE19', '/account/list', 1, 'FBE4F586D926425AB7D7593F3EAF73A8', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('BFAF2F1C7F4B4892B9AA85E243D738BE', '/mobileBasic/list?table=basic_config', 1, '896ADEE7EFC345748E1EA5FF8DC0C1C4', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('C3A35B2B56CD4918BBFB40DE7217C7B7', '/accessoryStorage/list', 1, '9F9BB192B89E402C98E143E69DFAF7AA', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('C9F5C6851B5642A29402DBB0FE872A1A', '/customer/list', 1, '66CE47589138475F9FD6C22EF4C9F027', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('E71F4C5235F34BABAD0B2D7E11F527E8', '/mobileBasic/list?table=basic_color', 1, '9F5250BD90D74A278ABC8112293A5C7C', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('FE1D1F656BB9415D9AE322E35410DF69', '/mobileType/list', 1, '1F312FD42DCC48A48528E1285C36F321', '菜单所属动作');
INSERT INTO `sys_action` VALUES ('FF72ADAA77074F5292D0A528D0822705', '/customerType/list', 1, '98BE1D75CDF54D18A84923BC74A946A1', '菜单所属动作');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `actionName` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameter` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `operTime` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('003F824E819545F080005DF901399B48', 'menuTree', '[time:1493898893250]', 'wangan', '2017-05-04 19:54:53');
INSERT INTO `sys_log` VALUES ('0040FA5E77814B899FBF88B330E2F395', 'scmSystem', '', 'wangan', '2017-05-04 20:50:02');
INSERT INTO `sys_log` VALUES ('0065D362824242BA90FDAA4C9EED1CC0', 'menuTree', '[time:1493898455755]', 'wangan', '2017-05-04 19:47:36');
INSERT INTO `sys_log` VALUES ('00793B3391CB4FABA527DDB067969CC3', 'error', '[id:703368B5B8FF40F3AC92F347D76CBF92]', 'wangan', '2017-05-06 14:55:41');
INSERT INTO `sys_log` VALUES ('007A07794ABC426DB151B01392A807AD', 'list', '', 'wangan', '2017-04-26 18:30:59');
INSERT INTO `sys_log` VALUES ('009C1108968F480CA31703B350E23060', 'toModifyPasswdView', '', 'wangan', '2017-05-04 19:52:26');
INSERT INTO `sys_log` VALUES ('00C2A1E343104AC588E3A6EB5E678AF5', 'listLog', '[beginDate:2017-04-19],[endDate:2017-04-27],[userAccount:]', 'wangan', '2017-04-26 17:48:01');
INSERT INTO `sys_log` VALUES ('00C3221A4FCF44F09231E1A8C78C6274', 'scmSystem', '', 'jishu', '2017-05-06 16:33:34');
INSERT INTO `sys_log` VALUES ('00C327B63C774DC0AEFF663B1E8BF190', 'list', '', 'wangan', '2017-05-04 19:53:38');
INSERT INTO `sys_log` VALUES ('00E5BBD5A0914412B7ED8CC5D3B58AC4', 'menuDetail', '[menuId:0AC72214D36F4B69B02EC662A055E0DF],[menuType:2]', 'wangan', '2017-05-04 22:00:35');
INSERT INTO `sys_log` VALUES ('00E8B250D3B84F2685418BC0F33D4986', 'toAddRoleView', '', 'wangan', '2017-05-02 22:19:14');
INSERT INTO `sys_log` VALUES ('00F127B7AFD84D9B9C3AE1827C16512F', 'toEditUserView', '[id:9E304DAFFC4B40788477A61D1D99B510]', 'wangan', '2017-05-04 22:02:22');
INSERT INTO `sys_log` VALUES ('00F635A65DFD4CE1A5869C7F6F59B51D', 'welcome', '', 'wangan', '2017-05-06 15:27:49');
INSERT INTO `sys_log` VALUES ('010B57935AAE46289FC674C19283557B', 'loadPrivilege', '[roleId:C968B245101E4687A476AE7582ED1620],[ts:1493898669348]', 'wangan', '2017-05-04 19:51:09');
INSERT INTO `sys_log` VALUES ('010BF1B3356C45B5840583540FE617BF', 'menuTree', '[time:1493906452520]', 'wangan', '2017-05-04 22:00:53');
INSERT INTO `sys_log` VALUES ('01113F1BFADD4CBBA6EB9A82D76D779E', 'listLog', '', 'wangan', '2017-04-26 17:57:32');
INSERT INTO `sys_log` VALUES ('0116AA8E807C4CBF8F305274E40AEDB9', 'list', '', 'wangan', '2017-05-04 21:35:58');
INSERT INTO `sys_log` VALUES ('01878E92DF1E455588B44E62083D0F1A', 'menuTree', '[time:1494054002701]', 'java', '2017-05-06 15:00:03');
INSERT INTO `sys_log` VALUES ('0196DCFE6E014CBB984023EA4E7397CA', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 20:18:36');
INSERT INTO `sys_log` VALUES ('01B2B4968D3045A584EAA1AE9C86B702', 'getVCode', '', NULL, '2017-04-26 17:55:45');
INSERT INTO `sys_log` VALUES ('01DAD4C132E04D61A3BAFC8A351CA93C', 'success', '', 'wangan', '2017-04-26 17:46:05');
INSERT INTO `sys_log` VALUES ('02308061EE114F6FAF185FAEC6A8BCA1', 'menuTree', '[time:1493272989696]', 'wangan', '2017-04-27 14:03:10');
INSERT INTO `sys_log` VALUES ('023BB56873D649EBAE606E4CBD4038D1', 'list', '', 'wangan', '2017-05-04 19:55:11');
INSERT INTO `sys_log` VALUES ('0243108876B94359A18C0A9316807D08', 'menuTree', '[time:1494059764281]', 'java', '2017-05-06 16:36:04');
INSERT INTO `sys_log` VALUES ('02B3C47BE0E340C6A218C65255E7D3F1', 'error', '', NULL, '2017-04-27 11:21:38');
INSERT INTO `sys_log` VALUES ('02D53C018DD7470D978B9A66C930B596', 'login', '', 'wangan', '2017-05-04 20:19:46');
INSERT INTO `sys_log` VALUES ('0331E1A0AF8D4E9D9A41E9B0B90D7F08', 'menuTree', '[time:1494055792639]', 'jishu', '2017-05-06 15:29:53');
INSERT INTO `sys_log` VALUES ('035BD6BFC7414701A1329945E916811A', 'menuTree', '[time:1493904503252]', 'wangan', '2017-05-04 21:28:23');
INSERT INTO `sys_log` VALUES ('0367F36DC9A84C63A2A25D8F15436C44', 'menuTree', '[time:1493272333614]', 'wangan', '2017-04-27 13:52:14');
INSERT INTO `sys_log` VALUES ('037C270D8F804BA88E7F35B7447A7AC3', 'menuTree', '[time:1493273787223]', 'wangan', '2017-04-27 14:16:27');
INSERT INTO `sys_log` VALUES ('03832219CABF4E8F9F4C60F731172437', 'toAddMenuView', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA]', 'wangan', '2017-04-27 16:48:29');
INSERT INTO `sys_log` VALUES ('03ADAE9BE9964EB9915893D8E7D88B5D', 'toMenuTreeView', '', 'jishu', '2017-05-06 16:33:47');
INSERT INTO `sys_log` VALUES ('03B1BE60709A49B79D1676A621A331F1', 'menuDetail', '[menuId:694819DEB27249EBADAC1CC284A2C84B],[menuType:1]', 'wangan', '2017-05-02 16:12:56');
INSERT INTO `sys_log` VALUES ('03C380752AF84899A681B816209404C4', 'menuTree', '[time:1493273707302]', 'wangan', '2017-04-27 14:15:07');
INSERT INTO `sys_log` VALUES ('0440145CBB774729A8B11610E4FA09C3', 'menuTree', '[time:1493273735388]', 'wangan', '2017-04-27 14:15:35');
INSERT INTO `sys_log` VALUES ('04688F0AEC394CBF9DB56515A5FE80B9', 'logout', '', 'java', '2017-05-06 16:40:51');
INSERT INTO `sys_log` VALUES ('046D92FD389F490E9ED0104412EB3853', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-28 17:06:39');
INSERT INTO `sys_log` VALUES ('050C4217DFDA4143AE6CD0C6B2968E1D', 'login', '', NULL, '2017-04-26 18:13:04');
INSERT INTO `sys_log` VALUES ('052DD0A5113E41A69E311C7930757AC4', 'menuTree', '[time:1493904226664]', 'wangan', '2017-05-04 21:23:47');
INSERT INTO `sys_log` VALUES ('0543FCA601C64F65877054A0ED91C49F', 'toAddMenuView', '[menuId:D012F1DD21F1473B838382E04A011BF7]', 'wangan', '2017-04-27 14:10:49');
INSERT INTO `sys_log` VALUES ('05613278C30D44CDAAD58502EBF49FFB', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493906580085]', 'wangan', '2017-05-04 22:03:00');
INSERT INTO `sys_log` VALUES ('0566C48A6346450EB2BD206B4762E5FB', 'scmSystem', '', 'wangan', '2017-05-04 21:31:31');
INSERT INTO `sys_log` VALUES ('0675054C77964BA1A2749714760EA064', 'menuTree', '[time:1493899753228]', 'wangan', '2017-05-04 20:09:13');
INSERT INTO `sys_log` VALUES ('0685352A1EA84195968F9485D29EA120', 'getVCode', '', NULL, '2017-04-27 10:37:39');
INSERT INTO `sys_log` VALUES ('06C2A23AE7764F41B4442541935074C8', 'loadPrivilege', '[roleId:FE3C747252B14163AC962623EFA4B850],[ts:1493906589318]', 'wangan', '2017-05-04 22:03:09');
INSERT INTO `sys_log` VALUES ('077ADFC047E44B2E88BFB7041F501E94', 'menuTree', '[time:1493282880455]', 'wangan', '2017-04-27 16:48:01');
INSERT INTO `sys_log` VALUES ('07B7A847514B45AE8006F888D6C874B7', 'scmSystem', '', 'wangan', '2017-05-04 20:47:23');
INSERT INTO `sys_log` VALUES ('07C00E52BAA540EE89A5729B9F9B84C5', 'menuTree', '[time:1493898479002]', 'wangan', '2017-05-04 19:47:59');
INSERT INTO `sys_log` VALUES ('07C4505A15A147828F53C12185AD4003', 'menuTree', '[time:1511422622064]', 'wangan', '2017-11-23 15:37:02');
INSERT INTO `sys_log` VALUES ('07C797B416B44CC0AE6CBB000F697621', 'menuTree', '[time:1494058647056]', 'jishu', '2017-05-06 16:17:27');
INSERT INTO `sys_log` VALUES ('07C890E594EA471CA41B6E5C0693BAF6', 'scmSystem', '', 'wangan', '2017-11-22 16:22:25');
INSERT INTO `sys_log` VALUES ('07E5E0EAD0B7423081F538EF6354638B', 'menuTree', '[time:1493273810625]', 'wangan', '2017-04-27 14:16:51');
INSERT INTO `sys_log` VALUES ('07FF7D75C04744CEBFDAA94B6589CB70', 'toAddMenuView', '[menuId:root]', 'wangan', '2017-04-27 14:03:15');
INSERT INTO `sys_log` VALUES ('0822AF08F6324CF79470C2511B2359B7', 'menuTree', '[time:1494054060845]', 'java', '2017-05-06 15:01:01');
INSERT INTO `sys_log` VALUES ('0831FF42029C4A8AB159E408B44012D8', 'menuTree', '[time:1493906437070]', 'wangan', '2017-05-04 22:00:37');
INSERT INTO `sys_log` VALUES ('083E40AA197649D085798443B6AFBC3E', 'menuTree', '[time:1493275816718]', 'wangan', '2017-04-27 14:50:17');
INSERT INTO `sys_log` VALUES ('08D743AE13DC4EE08C4E3ACB7E83980D', 'login', '[time:1493982275731]', 'wangan', '2017-05-05 19:04:36');
INSERT INTO `sys_log` VALUES ('090B6BD8590A4D95ADDE8D84AC9C6E34', 'list', '', 'wangan', '2017-05-04 22:07:54');
INSERT INTO `sys_log` VALUES ('091F42BA3FF6465FAA19400B297A09B3', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[refreshTree:true]', 'wangan', '2017-04-27 17:02:40');
INSERT INTO `sys_log` VALUES ('095C804519174E41A4E139DA70179AC3', 'menuDetail', '[menuId:root],[refreshTree:true]', 'wangan', '2017-04-27 16:46:56');
INSERT INTO `sys_log` VALUES ('0976053DABDA496489FA4C3DD59433D9', 'login', '', 'java', '2017-11-22 16:11:57');
INSERT INTO `sys_log` VALUES ('09C3661621D04DE5A400A41AECCF5994', 'list', '', 'wangan', '2017-05-02 22:29:59');
INSERT INTO `sys_log` VALUES ('09D70C03963D4E06BBA87E17FE2D07D4', 'menuTree', '[time:1493898487401]', 'wangan', '2017-05-04 19:48:07');
INSERT INTO `sys_log` VALUES ('09FFA78DD89945C884BA001B91F9363D', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493801730069]', 'wangan', '2017-05-03 16:55:30');
INSERT INTO `sys_log` VALUES ('0A261AC2A512418388246640D15EA83F', 'roleList', '', 'wangan', '2017-05-04 19:49:05');
INSERT INTO `sys_log` VALUES ('0A47F8750EAF4BE9993F607A256EDDB0', 'login', '', NULL, '2017-04-27 10:21:17');
INSERT INTO `sys_log` VALUES ('0A6D28531F094DE3835D2C1F6622321A', 'welcome', '', 'wangan', '2017-11-23 14:56:13');
INSERT INTO `sys_log` VALUES ('0A8B1D5CD06F45039E0DCA1366FB6CBD', 'welcome', '', 'wangan', '2017-05-04 21:34:05');
INSERT INTO `sys_log` VALUES ('0ACEC7AA24C74EC9B7EFA1B91A6B2D32', 'login', '', 'wangan', '2017-05-04 20:16:24');
INSERT INTO `sys_log` VALUES ('0B248B0971A545319B73A25D5F938177', 'list', '', 'wangan', '2017-05-04 20:46:12');
INSERT INTO `sys_log` VALUES ('0B4AF1DBA55E42B88EBCAB16F465E1DE', 'scmSystem', '', 'wangan', '2017-05-04 20:39:16');
INSERT INTO `sys_log` VALUES ('0B6F4E9D372842B7B1284F333881A01C', 'roleList', '', 'wangan', '2017-05-04 19:48:21');
INSERT INTO `sys_log` VALUES ('0C3EC6DC3C2240CE9402FFD19EF8B91C', 'list', '', 'wangan', '2017-04-26 18:24:35');
INSERT INTO `sys_log` VALUES ('0C63ABCC7C894250BBFACD68CE2D297B', 'roleList', '', 'wangan', '2017-05-06 14:54:40');
INSERT INTO `sys_log` VALUES ('0CA0D6D76A71487B8FEAAA5BAD6C51CD', 'welcome', '', 'wangan', '2017-04-26 17:57:29');
INSERT INTO `sys_log` VALUES ('0CBE5AA6B475443EACADF125619CBF97', 'scmSystem', '', 'jishu', '2017-05-06 15:05:03');
INSERT INTO `sys_log` VALUES ('0CEB5C8D22C74B9180C70CB3BFCF39CC', 'menuDetail', '[menuId:C6CB628964FB453EB7362BA20DE422FA],[menuType:2]', 'wangan', '2017-05-04 22:01:05');
INSERT INTO `sys_log` VALUES ('0CF6B4274B7E45429715E1F506C54613', 'menuTree', '[time:1493712751442]', 'wangan', '2017-05-02 16:12:31');
INSERT INTO `sys_log` VALUES ('0D0E3D0258864EEC868DF493A7849ADB', 'toMenuTreeView', '', 'wangan', '2017-04-27 16:51:18');
INSERT INTO `sys_log` VALUES ('0D976E71912C44A29905E47E263A4578', 'list', '[table:basic_brand]', 'wangan', '2017-05-04 19:54:12');
INSERT INTO `sys_log` VALUES ('0DA3EBD80A40459694916CE47A7EA287', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493801593262]', 'wangan', '2017-05-03 16:53:13');
INSERT INTO `sys_log` VALUES ('0DCF11FAF26B4BA79F054616DF7812F1', 'welcome', '', 'wangan', '2017-11-22 16:11:57');
INSERT INTO `sys_log` VALUES ('0DD4D741DDD34CFFBC43979A83DAEBBB', 'roleList', '[name:CTO],[status:1],[_status:on、on、on]', 'wangan', '2017-05-04 22:01:50');
INSERT INTO `sys_log` VALUES ('0DE2D61E3B744093AA41459D73122107', 'success', '', 'wangan', '2017-04-26 18:10:46');
INSERT INTO `sys_log` VALUES ('0E2DC9DF2F2C4363AB5ABD2D617256E2', 'roleList', '[name:],[_status:on、on、on],[status:2、3]', 'wangan', '2017-05-04 19:49:28');
INSERT INTO `sys_log` VALUES ('0E95F896D9D6442D90C8E47E301CF0A1', 'menuTree', '[time:1493273706714]', 'wangan', '2017-04-27 14:15:07');
INSERT INTO `sys_log` VALUES ('0EB564D0F59E4DB2824C060B8401FA3F', 'list', '', 'wangan', '2017-05-04 22:06:07');
INSERT INTO `sys_log` VALUES ('0EE26FC4EB534D2AAD7B0B9DD4714E0D', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 14:12:14');
INSERT INTO `sys_log` VALUES ('0F3FD09B0BE749718B14585B6E18222F', 'success', '', NULL, '2017-04-26 17:43:03');
INSERT INTO `sys_log` VALUES ('0FB045BB3B42490C86B36DCCDAB5DFD9', 'menuTree', '[time:1493904690974]', 'wangan', '2017-05-04 21:31:31');
INSERT INTO `sys_log` VALUES ('0FDFEBA8615B4D23809864FDF12B6C11', 'scmSystem', '', 'wangan', '2017-05-04 08:41:16');
INSERT INTO `sys_log` VALUES ('100CB08F9B7F4D389CE725A395E7682A', 'list', '', 'wangan', '2017-04-26 18:28:23');
INSERT INTO `sys_log` VALUES ('102192AF186142AC9C1A47A83268883F', 'list', '', 'wangan', '2017-04-27 10:52:48');
INSERT INTO `sys_log` VALUES ('10422F8DAF4645638BF6680FE483445B', 'listUser', '', 'wangan', '2017-05-02 22:19:33');
INSERT INTO `sys_log` VALUES ('109264DCD4E04DB5BD57C7E7DCAD42B7', 'listLog', '', 'wangan', '2017-04-26 18:19:00');
INSERT INTO `sys_log` VALUES ('10A8B8D2A1E94161BC9DF0C42B73A870', 'welcome', '', 'wangan', '2017-04-27 13:52:11');
INSERT INTO `sys_log` VALUES ('1114FD930B234603A536392B39026707', 'welcome', '', 'jishu', '2017-05-06 16:04:29');
INSERT INTO `sys_log` VALUES ('1115C77B982E4A40B740F806B281B3D3', 'welcome', '', 'wangan', '2017-05-04 21:07:16');
INSERT INTO `sys_log` VALUES ('111CDCC38C8C42EA8011534A3C69A344', 'menuTree', '[time:1493282811226]', 'wangan', '2017-04-27 16:46:51');
INSERT INTO `sys_log` VALUES ('117F4B13202B4496AF8390F873827114', 'menuDetail', '[menuId:3108E8A2E5C443BD89B413D72CC23262],[menuType:1]', 'wangan', '2017-05-04 19:48:04');
INSERT INTO `sys_log` VALUES ('11807EC3D7CD44E793C043F47E8AABA7', 'login', '[time:1493200558718]', NULL, '2017-04-26 17:55:59');
INSERT INTO `sys_log` VALUES ('11AD42F0F44D49238D6DA47A101F05C7', 'login', '', NULL, '2017-04-27 10:24:57');
INSERT INTO `sys_log` VALUES ('11BEB817A5014D539CB6FE89B9D5D3B2', 'menuTree', '[time:1493272970483]', 'wangan', '2017-04-27 14:02:51');
INSERT INTO `sys_log` VALUES ('122BCEE2EFC746BABBA4C2A8CF56143C', 'menuTree', '[time:1493905572680]', 'wangan', '2017-05-04 21:46:14');
INSERT INTO `sys_log` VALUES ('1249A83D727047A4BEBAB1F304BCBD01', 'scmSystem', '', 'wangan', '2017-05-04 19:55:39');
INSERT INTO `sys_log` VALUES ('124A424F1FD24C919BB7E37B3BB4C526', 'getVCode', '', NULL, '2017-04-27 10:52:00');
INSERT INTO `sys_log` VALUES ('12A04B720A2941BCB6BE0BC833F7497C', 'menuTree', '[time:1493906305247]', 'wangan', '2017-05-04 21:58:25');
INSERT INTO `sys_log` VALUES ('12BD71D43A584A9AB664415EB6FC33D5', 'logout', '', 'jishu', '2017-05-06 15:46:30');
INSERT INTO `sys_log` VALUES ('12ECD6BBB5E24896AE9AA02ADFC18A31', 'toAdd', '', 'wangan', '2017-05-04 20:51:59');
INSERT INTO `sys_log` VALUES ('13092CF69AD146AA89AFC6AB686FFA14', 'login', '', 'wangan', '2017-05-04 20:09:55');
INSERT INTO `sys_log` VALUES ('13336DCBD6684D2BB8C5F55424700BD6', 'roleList', '[name:],[_status:on、on、on],[status:2]', 'wangan', '2017-05-02 22:19:00');
INSERT INTO `sys_log` VALUES ('1367C58E5978441BB9D7A76B44D91E22', 'menuTree', '[time:1493260879718]', 'wangan', '2017-04-27 10:41:20');
INSERT INTO `sys_log` VALUES ('13AACF72EE64453C9C935AB2B883CF44', 'scmSystem', '', 'wangan', '2017-04-27 14:15:03');
INSERT INTO `sys_log` VALUES ('13C1925C94CC4E6593366425E8D79B99', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1494055672744]', 'wangan', '2017-05-06 15:27:53');
INSERT INTO `sys_log` VALUES ('13C4FFB075874E3FB701332A4AD495E1', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493898666847]', 'wangan', '2017-05-04 19:51:07');
INSERT INTO `sys_log` VALUES ('13EE639C7FCD4F19884903DDE4866D8B', 'listLog', '[beginDate:2017-05-01],[endDate:2017-05-04],[userAccount:],[page.pageIndex:3]', 'wangan', '2017-05-04 19:52:10');
INSERT INTO `sys_log` VALUES ('1405966E5A5D4B74AB17B12BCA276C1B', 'success', '', 'wangan', '2017-04-27 10:26:40');
INSERT INTO `sys_log` VALUES ('149C5D60705C49179C75BD079D99E3D8', 'toEdit', '', 'wangan', '2017-05-04 21:31:36');
INSERT INTO `sys_log` VALUES ('14E3C0F617E44F189854803BF5C0D7F3', 'scmSystem', '', 'wangan', '2017-04-27 16:39:01');
INSERT INTO `sys_log` VALUES ('15074C71CD0140E0A2278022FD212D8B', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1494053690658]', 'wangan', '2017-05-06 14:54:51');
INSERT INTO `sys_log` VALUES ('15125892C38748F68B0163F5DD8AD674', 'scmSystem', '', 'wangan', '2017-05-04 21:51:52');
INSERT INTO `sys_log` VALUES ('151B968993E743E49D1859BC391464F1', 'getVCode', '', NULL, '2017-04-27 10:24:58');
INSERT INTO `sys_log` VALUES ('158D525498BB41AEADD8356F3F6131E0', 'welcome', '', 'wangan', '2017-04-27 15:24:23');
INSERT INTO `sys_log` VALUES ('15A7593226BB4F128ED2F2D8BE1E0984', 'toAddUserView', '[userEmployeeId:1D22C965DE3F432B8E484C59AF477303]', 'wangan', '2017-05-02 22:22:32');
INSERT INTO `sys_log` VALUES ('15EE1238BE4247DAB1D6F1D8008B9298', 'listUser', '', 'wangan', '2017-05-02 22:22:43');
INSERT INTO `sys_log` VALUES ('15F17D9FD03A4004ACB4F4D103923942', 'login', '', NULL, '2017-04-27 10:19:33');
INSERT INTO `sys_log` VALUES ('165297DF515245F196AE08F8CFE8C477', 'menuTree', '[time:1493282364987]', 'wangan', '2017-04-27 16:39:25');
INSERT INTO `sys_log` VALUES ('16CE42D7AD7D482BA08F09800AAE5F9D', 'list', '', 'wangan', '2017-05-04 20:45:11');
INSERT INTO `sys_log` VALUES ('16DD19966689424B942B1BC03750C714', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:27:05');
INSERT INTO `sys_log` VALUES ('1807F0ED600D4B9F9F07E0BAD277674A', 'toPrivilegeView', '', 'wangan', '2017-05-06 15:27:52');
INSERT INTO `sys_log` VALUES ('18DB2BBF160A491CA28E6656B0BBCC97', 'scmSystem', '', 'wangan', '2017-05-04 19:54:53');
INSERT INTO `sys_log` VALUES ('18E123D83624443FBA8BA6EE914BDBF7', 'scmSystem', '', 'wangan', '2017-04-27 11:46:51');
INSERT INTO `sys_log` VALUES ('19237B7D15174BABA78F1E50A9288E44', 'scmSystem', '', 'java', '2017-05-06 16:36:04');
INSERT INTO `sys_log` VALUES ('19296B5110E24C298E4B86D74AD2B7CE', 'scmSystem', '', 'wangan', '2017-11-22 16:11:57');
INSERT INTO `sys_log` VALUES ('1964F8582BFD4E408E792A1C217A4D81', 'scmSystem', '', 'wangan', '2017-05-04 21:34:05');
INSERT INTO `sys_log` VALUES ('19B18E4F25014AC480B179E5BB096AE3', 'welcome', '', 'jishu', '2017-05-06 16:17:27');
INSERT INTO `sys_log` VALUES ('19C4BD9DB0B0424AAAE2D68295628C0F', 'menuDetail', '[menuId:root],[refreshTree:true]', 'wangan', '2017-04-27 16:46:51');
INSERT INTO `sys_log` VALUES ('1A464359787747AE86F665F581D27AA9', 'menuTree', '[time:1493712703356]', 'wangan', '2017-05-02 16:11:43');
INSERT INTO `sys_log` VALUES ('1AA2F2302BD643F9882A52B5764AD72F', 'list', '', 'wangan', '2017-05-04 21:20:03');
INSERT INTO `sys_log` VALUES ('1AA929EA530045F08E0123013A009367', 'loadTree', '[ts:1493801586728]', 'wangan', '2017-05-03 16:53:07');
INSERT INTO `sys_log` VALUES ('1AC0B954A09742058B260D5112A45E26', 'menuTree', '[time:1493734687884]', 'wangan', '2017-05-02 22:18:08');
INSERT INTO `sys_log` VALUES ('1AE20ED5DAE44E08B69D3F5E69468815', 'success', '', 'wangan', '2017-04-27 10:41:19');
INSERT INTO `sys_log` VALUES ('1BA5E6FAD96546FF97BC225298C40B2B', 'menuDetail', '[menuId:5BBE507F8451446DAAE0085EBC9DCD74],[menuType:2]', 'wangan', '2017-05-04 22:01:03');
INSERT INTO `sys_log` VALUES ('1BBCB6C5A16F46A8BEB16FC085F41632', 'scmSystem', '', 'wangan', '2017-11-22 17:03:41');
INSERT INTO `sys_log` VALUES ('1C1DAAA3B1D04B6FAC670C05D93760AD', 'menuTree', '[time:1493904955914]', 'wangan', '2017-05-04 21:35:56');
INSERT INTO `sys_log` VALUES ('1C45B33F0AE541B2832460956029FF22', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493855563075]', 'wangan', '2017-05-04 07:52:43');
INSERT INTO `sys_log` VALUES ('1D1628B4F4164E1A88D0A917A9E6E6C6', 'list', '', 'wangan', '2017-05-04 08:47:30');
INSERT INTO `sys_log` VALUES ('1D2D1EBDA3E94085BBBF923757C2D503', 'toEdit', '[customerTypeId:CT_DUANQI]', 'wangan', '2017-05-02 22:23:38');
INSERT INTO `sys_log` VALUES ('1D5777F90E9F46EA9BE289188A87B5B7', 'toPrivilegeView', '', 'wangan', '2017-05-06 14:49:24');
INSERT INTO `sys_log` VALUES ('1D815C0A85164E9191389F6A69172464', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493801586946]', 'wangan', '2017-05-03 16:53:07');
INSERT INTO `sys_log` VALUES ('1DDE437443944A82A1C54984F2E8BAD3', 'list', '[id:],[name:]', 'wangan', '2017-05-04 19:54:04');
INSERT INTO `sys_log` VALUES ('1E4156ED295448F2AF561DD82807F015', 'menuTree', '[time:1493898393243]', 'wangan', '2017-05-04 19:46:33');
INSERT INTO `sys_log` VALUES ('1E6501FC9864418BAB7081EC9971FEC4', 'error', '', 'wangan', '2017-05-04 22:04:29');
INSERT INTO `sys_log` VALUES ('1E755F04BB5745698BE9B3BB0F7691A0', 'error', '', 'wangan', '2017-05-02 22:21:07');
INSERT INTO `sys_log` VALUES ('1EB2E415DCC4417AA83F5699DE458F10', 'listUser', '', 'wangan', '2017-05-04 19:50:17');
INSERT INTO `sys_log` VALUES ('1EEF864A74D546048912140358E937A1', 'menuTree', '[time:1493278033607]', 'wangan', '2017-04-27 15:27:14');
INSERT INTO `sys_log` VALUES ('1EFC060F88624D5C85902AA3BBDC68B4', 'getVCode', '', NULL, '2017-04-26 18:18:48');
INSERT INTO `sys_log` VALUES ('1F13EDFEBF994C26B7205DAFB66A67A5', 'scmSystem', '', 'wangan', '2017-04-27 15:00:59');
INSERT INTO `sys_log` VALUES ('1F7B010E1D0F41A9AF8695433D2DAC4C', 'toAdd', '', 'wangan', '2017-05-02 22:29:54');
INSERT INTO `sys_log` VALUES ('1F99FDED13554C058B436BF40E1E9E22', 'menuTree', '[time:1511422629906]', 'wangan', '2017-11-23 15:37:10');
INSERT INTO `sys_log` VALUES ('1F9C5FE6C12149D4A6C9E396F550762B', 'toEdit', '', 'wangan', '2017-05-04 21:31:36');
INSERT INTO `sys_log` VALUES ('204724CC34564F3AAEF4BCCBE79A2A5A', 'getVCode', '', NULL, '2017-04-26 17:44:41');
INSERT INTO `sys_log` VALUES ('204D06F79C0C4AA6B8BA329386BFAFAC', 'scmSystem', '', 'java', '2017-11-22 16:11:05');
INSERT INTO `sys_log` VALUES ('2057C17BCBE6447184DED9267BF53DC8', 'menuTree', '[time:1493272334285]', 'wangan', '2017-04-27 13:52:14');
INSERT INTO `sys_log` VALUES ('210C69CC36064571A936F57544D43482', 'menuDetail', '[menuId:1A29CDD70FF14348BE8806CB56FEA77E],[menuType:1]', 'wangan', '2017-05-02 16:12:59');
INSERT INTO `sys_log` VALUES ('214F9B5CA01B49F0B1E8839692A4F631', 'menuTree', '[time:1493370620333]', 'wangan', '2017-04-28 17:10:20');
INSERT INTO `sys_log` VALUES ('2186557A977A447AA480ADB8439A8D4F', 'toAddMenuView', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07]', 'wangan', '2017-05-04 22:00:44');
INSERT INTO `sys_log` VALUES ('2198B5F2FDF54C289C83238BB1E8A1D7', 'list', '', 'wangan', '2017-05-04 22:05:26');
INSERT INTO `sys_log` VALUES ('21CAD0757618458F8318043070D5C951', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:58:43');
INSERT INTO `sys_log` VALUES ('21F162843D2A43DFB2AE3F1B05FB67E5', 'scmSystem', '', 'jishu', '2017-05-06 16:18:40');
INSERT INTO `sys_log` VALUES ('2208D5E9434E46F2A55A5B123D9486DE', 'listDepartment', '', 'wangan', '2017-05-02 22:22:06');
INSERT INTO `sys_log` VALUES ('22426BEF1D134F188A83B2D82A8E8138', 'welcome', '', 'wangan', '2017-05-06 14:54:10');
INSERT INTO `sys_log` VALUES ('225D8D5A8C7E42FEA77E727D96C67AB1', 'menuTree', '[time:1493283773031]', 'wangan', '2017-04-27 17:02:53');
INSERT INTO `sys_log` VALUES ('22C1DDE451D543C29CEAA3CD6B0E61A5', 'roleList', '', 'wangan', '2017-05-04 22:02:06');
INSERT INTO `sys_log` VALUES ('22D39B0C90F140EDB21DB6126237774A', 'list', '[startDate:2017-04-04],[endDate:2017-05-01],[show:导出Excel],[supplier.supplierType.id:],[supplier.id:],[tradeType:77]', 'wangan', '2017-05-04 22:11:46');
INSERT INTO `sys_log` VALUES ('232B6C342918484ABB43299887497EB0', 'login', '', 'wangan', '2017-05-04 21:24:53');
INSERT INTO `sys_log` VALUES ('234807C6DDA246B3912E6DC10859E36D', 'login', '[time:1493259999924]', NULL, '2017-04-27 10:26:40');
INSERT INTO `sys_log` VALUES ('235463A96C9740CBAC481AEC00379457', 'menuDetail', '[menuId:5F0D2570016B41D18E0CEB83FF8F2AE5],[menuType:2]', 'wangan', '2017-05-04 19:47:39');
INSERT INTO `sys_log` VALUES ('238FD3ADEEE6452F8845BD531140A66C', 'delete', '[table:basic_brand],[id:071F503DB1F448DEA3AA360DAE78D0A3]', 'wangan', '2017-05-04 22:06:38');
INSERT INTO `sys_log` VALUES ('2394265B39CE41B5B608585B4A34CB0B', 'error', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuParentId:root],[menuSortOrder:8]', 'wangan', '2017-04-27 13:52:25');
INSERT INTO `sys_log` VALUES ('23A2BE315D424DB4AB225002B70CECA2', 'toMenuTreeView', '', 'wangan', '2017-04-27 14:49:26');
INSERT INTO `sys_log` VALUES ('241A26A950604F0E8DE2F6A46B613056', 'listLog', '[beginDate:2017-05-01],[endDate:2017-05-04],[userAccount:],[page.pageIndex:5]', 'wangan', '2017-05-04 19:52:12');
INSERT INTO `sys_log` VALUES ('241E3FA19A8443768C75D4BE5C80B6D7', 'toEditRoleView', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C]', 'wangan', '2017-05-04 19:49:04');
INSERT INTO `sys_log` VALUES ('24218D200D6C4A6984AEB7FB6C610D7C', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 15:27:14');
INSERT INTO `sys_log` VALUES ('243B6A8CA1B043858465057D2D4F45C4', 'menuDetail', '[menuId:7952ADCE8BE94659903BF32E3737A322],[menuType:2]', 'wangan', '2017-05-04 19:47:33');
INSERT INTO `sys_log` VALUES ('247C0C9F34AC488099A60DF74BC76D29', 'menuTree', '[time:1493901556620]', 'wangan', '2017-05-04 20:39:17');
INSERT INTO `sys_log` VALUES ('2482442DEC274D36A4EDEACD9F210598', 'listDepartment', '', 'wangan', '2017-05-02 22:21:58');
INSERT INTO `sys_log` VALUES ('2486A3851AF8465296AC1CAA929CE9F1', 'login', '', 'wangan', '2017-05-05 19:04:38');
INSERT INTO `sys_log` VALUES ('2496D919E1F54C3AA3FAF18CE6C19321', 'login', '', NULL, '2017-04-27 10:36:39');
INSERT INTO `sys_log` VALUES ('24ADA85C552A48AEBCBE55D76509B9B2', 'listUser', '', 'wangan', '2017-05-04 08:41:19');
INSERT INTO `sys_log` VALUES ('24FD7801FBD6457D8E22354991419ECE', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:41:52');
INSERT INTO `sys_log` VALUES ('2558BDB13F99426D8DB53B33F445B019', 'welcome', '', 'wangan', '2017-04-27 16:58:05');
INSERT INTO `sys_log` VALUES ('2564938E42B74B9FB0EF8E0FC31E4ADA', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493898626408]', 'wangan', '2017-05-04 19:50:26');
INSERT INTO `sys_log` VALUES ('2568FF7D7410436B9BB32EA4058B0E6A', 'add', '[table:basic_color],[data:红色]', 'wangan', '2017-05-04 22:06:51');
INSERT INTO `sys_log` VALUES ('25A47C6F2EBE45FA896B1217180270E9', 'listLog', '[beginDate:2017-04-04],[endDate:2017-05-02],[userAccount:],[page.pageIndex:23]', 'wangan', '2017-05-04 22:03:40');
INSERT INTO `sys_log` VALUES ('25FA6C281A4544D18CB95B1416662EC3', 'menuTree', '[time:1493370399452]', 'wangan', '2017-04-28 17:06:39');
INSERT INTO `sys_log` VALUES ('261AA17D56834F8389FC15FC18BE0D1D', 'menuTree', '[time:1493283032358]', 'wangan', '2017-04-27 16:50:32');
INSERT INTO `sys_log` VALUES ('267F7FCB21F94D9288C206614896BFED', 'login', '', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('26937DC9BE494529A7162497D608E89D', 'menuDetail', '[menuId:1A29CDD70FF14348BE8806CB56FEA77E],[menuType:1]', 'wangan', '2017-05-02 22:18:10');
INSERT INTO `sys_log` VALUES ('26A369D4AF43451D90F3DF226E7C99AD', 'menuTree', '[time:1493904845265]', 'wangan', '2017-05-04 21:34:05');
INSERT INTO `sys_log` VALUES ('26B9997504204995ABBBF1218801244F', 'list', '', 'wangan', '2017-05-04 20:45:42');
INSERT INTO `sys_log` VALUES ('26BA1305F8C0400CA00D1D1A5A6C21DA', 'menuTree', '[time:1494058566443]', 'jishu', '2017-05-06 16:16:06');
INSERT INTO `sys_log` VALUES ('26E25F44B0ED4F1CBB44F90E82090AED', 'list', '[brand:小米],[name:]', 'wangan', '2017-05-04 22:08:04');
INSERT INTO `sys_log` VALUES ('27064032514847128B8A8564F422D497', 'welcome', '', 'jishu', '2017-05-06 16:35:44');
INSERT INTO `sys_log` VALUES ('2778BB8E841843E9BD5A7CFE21B792C6', 'getVCode', '', NULL, '2017-04-27 10:21:18');
INSERT INTO `sys_log` VALUES ('27A96C38D2054B75B0310C1803F6A67E', 'scmSystem', '', 'wangan', '2017-05-06 14:54:10');
INSERT INTO `sys_log` VALUES ('27D992C47B5047B087B4DA4AF8EC6ACC', 'menuDetail', '[menuId:root],[refreshTree:true]', 'wangan', '2017-04-27 14:03:09');
INSERT INTO `sys_log` VALUES ('2819E377C987495081FDA287EAF66551', 'addMenu', '[time:1493282949719]', 'wangan', '2017-04-27 16:49:10');
INSERT INTO `sys_log` VALUES ('28402B84E81141E6996A7D1E3B3E156D', 'editDept', '[name:技术部],[id:65EBF040B74E4E73B3D7C475F01AFDC8],[linkman:Ji.Shu],[phone:5893787],[address:科技园区],[remark:这个人很厉害啊]', 'wangan', '2017-05-04 19:52:51');
INSERT INTO `sys_log` VALUES ('285D351313DA4085815D396BEC4270A6', 'menuTree', '[time:1493902043606]', 'wangan', '2017-05-04 20:47:24');
INSERT INTO `sys_log` VALUES ('288A1F0E3C2A4052845EFE5CA8DC9B85', 'list', '', 'wangan', '2017-05-04 21:16:35');
INSERT INTO `sys_log` VALUES ('28C25C1AF3B7430A926E9D9370789FBE', 'menuTree', '[time:1493898477208]', 'wangan', '2017-05-04 19:47:57');
INSERT INTO `sys_log` VALUES ('28CD8714BF6E431AAA6943DB18F1D6A3', 'scmSystem', '', 'wangan', '2017-05-06 15:27:49');
INSERT INTO `sys_log` VALUES ('290B14B19E3940F49A60002190B96D56', 'menuTree', '[time:1493800787208]', 'wangan', '2017-05-03 16:39:47');
INSERT INTO `sys_log` VALUES ('2920DDBDA68145129C747EB3BF7B07BC', 'menuTree', '[time:1493261552800]', 'wangan', '2017-04-27 10:52:33');
INSERT INTO `sys_log` VALUES ('294C00C5C52A45AB901A54170D653C6E', 'toEdit', '[accessoryTypeId:njy-001]', 'wangan', '2017-05-04 20:42:31');
INSERT INTO `sys_log` VALUES ('2978D68D7D5947D9A8FB9B343D28C078', 'list', '[table:basic_brand]', 'wangan', '2017-04-26 18:28:19');
INSERT INTO `sys_log` VALUES ('29B32F0EB6E442929C5F102337C208F5', 'error', '', 'wangan', '2017-04-26 18:13:57');
INSERT INTO `sys_log` VALUES ('29F6F316A9734339A255E0504EAFAACD', 'toPrivilegeView', '', 'wangan', '2017-05-06 10:12:33');
INSERT INTO `sys_log` VALUES ('29FCD4E740674BF89E471BA42A875377', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-06 09:33:15');
INSERT INTO `sys_log` VALUES ('2A3FD86673634123B5C95183C50DCF23', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('2A5A0283C5834EEAA6167F59C9E3B3F8', 'list', '[customerType.id:],[name:]', 'wangan', '2017-05-04 22:06:13');
INSERT INTO `sys_log` VALUES ('2A83A407DD3945C08F6D28346E60F4F1', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-04 19:46:06');
INSERT INTO `sys_log` VALUES ('2AA8AA97B5AF453F8715F64CFF81D69A', 'welcome', '', 'wangan', '2017-05-02 22:17:13');
INSERT INTO `sys_log` VALUES ('2AAF526A887A4F2FA9A2CC574C69311B', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 21:51:58');
INSERT INTO `sys_log` VALUES ('2B04D282A69941EEA171E8E09BF91E46', 'menuTree', '[time:1494059993674]', 'java', '2017-05-06 16:39:54');
INSERT INTO `sys_log` VALUES ('2B374E1B37514BA5A544DA4EA20633E4', 'list', '', 'wangan', '2017-05-04 22:06:20');
INSERT INTO `sys_log` VALUES ('2B516B5811334A749B886B07F97CD7B3', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 19:46:44');
INSERT INTO `sys_log` VALUES ('2B597A6C259346C283B2B68F5632F6E9', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:28:27');
INSERT INTO `sys_log` VALUES ('2B6A38EBB9F842149D6D23D9701B4288', 'menuTree', '[time:1493261560027]', 'wangan', '2017-04-27 10:52:40');
INSERT INTO `sys_log` VALUES ('2B89EFA7001F497C8A847344A598E39A', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('2B8B919BA42849C6A1046D634CAA25ED', 'list', '', 'wangan', '2017-05-04 22:06:02');
INSERT INTO `sys_log` VALUES ('2BA44993E2C44C97A9B3F17513DDE17B', 'roleList', '', 'wangan', '2017-05-02 22:18:34');
INSERT INTO `sys_log` VALUES ('2BA8EF7549784E129CC0A33160BFC48D', 'menuTree', '[time:1493277009835]', 'wangan', '2017-04-27 15:10:10');
INSERT INTO `sys_log` VALUES ('2BDAB790894F4AF2A440B95B3AB84CAC', 'menuTree', '[time:1493283205979]', 'wangan', '2017-04-27 16:53:26');
INSERT INTO `sys_log` VALUES ('2C0FBDF324F94E0295B33730C12E274E', 'menuDetail', '[menuId:D5DBBFDE5EC549FF8E179C505C7B662A],[menuType:2]', 'wangan', '2017-05-04 19:47:36');
INSERT INTO `sys_log` VALUES ('2C1C320E3AE84D7FA6FE932FB9475F47', 'list', '', 'wangan', '2017-05-02 22:23:34');
INSERT INTO `sys_log` VALUES ('2C1DD914856A4B4DA861EEA4E1E5E8FC', 'menuTree', '[time:1493898468740]', 'wangan', '2017-05-04 19:47:49');
INSERT INTO `sys_log` VALUES ('2C275B743ED543DCBFFFDD620DBD37D2', 'menuTree', '[time:1493903792336]', 'wangan', '2017-05-04 21:16:32');
INSERT INTO `sys_log` VALUES ('2C42B21665BE484B844CEDACE433D19D', 'welcome', '', 'wangan', '2017-11-23 16:43:56');
INSERT INTO `sys_log` VALUES ('2C70E901ECC14237A374403D8675D86D', 'menuTree', '[time:1494054303315]', 'jishu', '2017-05-06 15:05:03');
INSERT INTO `sys_log` VALUES ('2C95001B28C644C98DC8C00E5282B2D4', 'listEmployee', '', 'jishu', '2017-05-06 15:21:09');
INSERT INTO `sys_log` VALUES ('2CE613FBF0144CD9B4B79F83B8A1439A', 'error', '', 'wangan', '2017-04-26 18:30:56');
INSERT INTO `sys_log` VALUES ('2D03834278884C82BA18642B2515E914', 'roleList', '', 'wangan', '2017-05-04 19:49:12');
INSERT INTO `sys_log` VALUES ('2D09D2E206DF491BB91C3B2B678566B3', 'scmSystem', '', 'wangan', '2017-05-03 16:39:46');
INSERT INTO `sys_log` VALUES ('2D1FBEDF38F94EDEB404A194EFCAF27B', 'menuTree', '[time:1493712750952]', 'wangan', '2017-05-02 16:12:31');
INSERT INTO `sys_log` VALUES ('2D9358B81C5D481D90A182424478E186', 'menuDetail', '[menuId:9F5250BD90D74A278ABC8112293A5C7C],[menuType:2]', 'wangan', '2017-05-04 19:47:59');
INSERT INTO `sys_log` VALUES ('2DA51546B4D448C0834B66EC1B24E401', 'listUser', '[account:]', 'wangan', '2017-05-04 19:49:44');
INSERT INTO `sys_log` VALUES ('2DADE05D804B40D093F7B17C26C8D320', 'scmSystem', '', 'wangan', '2017-05-04 20:18:04');
INSERT INTO `sys_log` VALUES ('2DBB2B9C1DE14A34A67ACBD1CA07D1FC', 'loadTree', '[ts:1494036752812]', 'wangan', '2017-05-06 10:12:33');
INSERT INTO `sys_log` VALUES ('2DC0626F357B471A93EDD37C3E450025', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:12:16');
INSERT INTO `sys_log` VALUES ('2DE646C3F7424F4D93B3B88BB575DD01', 'loadPrivilege', '[roleId:82888F565F5747D3B41B9FBB94ED408A],[ts:1493855570590]', 'wangan', '2017-05-04 07:52:51');
INSERT INTO `sys_log` VALUES ('2E3585588990463CA71D007B369495EC', 'menuDetail', '[menuId:7812E5294DC6406D8229D384F2D538AA],[menuType:2]', 'wangan', '2017-05-04 19:48:08');
INSERT INTO `sys_log` VALUES ('2E3F1E8D3FFC4590A9F32C644086AD81', 'menuTree', '[time:1493906415507]', 'wangan', '2017-05-04 22:00:16');
INSERT INTO `sys_log` VALUES ('2E4810655E9547CCA780DD0F34BBDE6B', 'login', '[time:1493982276887]', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('2E4A61CB3433422FB898F3B7B2DB564A', 'menuTree', '[time:1493906440800]', 'wangan', '2017-05-04 22:00:41');
INSERT INTO `sys_log` VALUES ('2F75A30B3F54454B971662C34301B70B', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-02 22:18:08');
INSERT INTO `sys_log` VALUES ('2F8295FF63DD4EFDBA5F65A2DB676868', 'welcome', '', 'wangan', '2017-11-22 17:03:41');
INSERT INTO `sys_log` VALUES ('2F88B3D7B8AF44D3AE66A72869C772C4', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493855942163]', 'wangan', '2017-05-04 07:59:02');
INSERT INTO `sys_log` VALUES ('2F9294080C124160B9DC61DA21A31989', 'list', '', 'wangan', '2017-04-26 18:30:09');
INSERT INTO `sys_log` VALUES ('2FAF25B6D9F4455DBFBDC0A06A20ED29', 'welcome', '', 'wangan', '2017-04-27 16:56:08');
INSERT INTO `sys_log` VALUES ('2FB4FB4172A24C84BA4CF17D5F851053', 'menuDetail', '[menuId:1A29CDD70FF14348BE8806CB56FEA77E],[menuType:1]', 'wangan', '2017-05-04 19:47:41');
INSERT INTO `sys_log` VALUES ('300F0EB52A014D5A884E455518C4205C', 'menuTree', '[time:1493282877792]', 'wangan', '2017-04-27 16:47:58');
INSERT INTO `sys_log` VALUES ('30346C3AF8174458BE78AB6DC6E6B3E9', 'toPrivilegeView', '', 'wangan', '2017-05-04 19:50:26');
INSERT INTO `sys_log` VALUES ('303CB55C511E4B788FA22E3B96A8AF8F', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 20:42:35');
INSERT INTO `sys_log` VALUES ('3049251D192D4B76A99EDF77A4E6FC5A', 'welcome', '', 'wangan', '2017-04-27 15:10:10');
INSERT INTO `sys_log` VALUES ('3094641313134870997B877C81AD9A33', 'success', '', 'wangan', '2017-04-27 10:13:58');
INSERT INTO `sys_log` VALUES ('309FC1E4A5EE4C8F9162AAAB5069B404', 'menuTree', '[time:1493273441401]', 'wangan', '2017-04-27 14:10:42');
INSERT INTO `sys_log` VALUES ('30C6A67A9F8248F681F449584038604B', 'menuTree', '[time:1493276465167]', 'wangan', '2017-04-27 15:01:05');
INSERT INTO `sys_log` VALUES ('310CB9A1B66C4936859FE30F015AF0C7', 'login', '', 'wangan', '2017-05-04 20:25:24');
INSERT INTO `sys_log` VALUES ('311EE9E15C8F4EF9B704BE90B3FA0C70', 'scmSystem', '', 'jishu', '2017-05-06 16:41:00');
INSERT INTO `sys_log` VALUES ('3145897E02384471BFAEFDC80E56263F', 'scmSystem', '', 'wangan', '2017-04-28 17:06:35');
INSERT INTO `sys_log` VALUES ('31637DBB84C340AB9F8B44A6682F37B4', 'toEditEmpView', '[id:1D22C965DE3F432B8E484C59AF477303]', 'wangan', '2017-05-04 22:05:03');
INSERT INTO `sys_log` VALUES ('316F193F00A74128A0FD1E49C6451FE5', 'list', '[startDate:2017-04-04],[endDate:2017-05-01],[supplier.supplierType.id:],[supplier.id:],[tradeType:77]', 'wangan', '2017-05-04 22:11:19');
INSERT INTO `sys_log` VALUES ('319BD3946D5F4161A31AE963B3654CF5', 'listUser', '', 'wangan', '2017-05-04 22:02:31');
INSERT INTO `sys_log` VALUES ('31E4C9C7B6DF4DFA9590004C187FC141', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-04-27 16:48:00');
INSERT INTO `sys_log` VALUES ('31EE2C0F07254B24A05FA9F5B2D1A26D', 'success', '', 'wangan', '2017-04-26 17:57:28');
INSERT INTO `sys_log` VALUES ('32342B11350E4FF59C3889D54354F708', 'menuTree', '[time:1493283755645]', 'wangan', '2017-04-27 17:02:36');
INSERT INTO `sys_log` VALUES ('32447642B9454E93B002A110D98258F1', 'menuTree', '[time:1493906479045]', 'wangan', '2017-05-04 22:01:19');
INSERT INTO `sys_log` VALUES ('3245D31269B845959A199E02232ED3BD', 'login', '[time:1493982277575]', 'wangan', '2017-05-05 19:04:38');
INSERT INTO `sys_log` VALUES ('329773672DB64DFD8CD16F205A7211E1', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 20:09:17');
INSERT INTO `sys_log` VALUES ('32CB1FCDF8EE4B97B749C3030EA8344B', 'listUser', '', 'wangan', '2017-04-27 11:47:08');
INSERT INTO `sys_log` VALUES ('32E7CF9DEA9A453693C4D2BBFD8ED984', 'listLog', '[beginDate:2017-05-01],[endDate:2017-05-04],[userAccount:],[page.pageIndex:2]', 'wangan', '2017-05-04 19:52:05');
INSERT INTO `sys_log` VALUES ('331ADAE076BC4EF89994E9704D6709C8', 'welcome', '', 'jishu', '2017-05-06 16:03:58');
INSERT INTO `sys_log` VALUES ('3337C1BD6F034A73986122A092FC3362', 'loadPrivilege', '[roleId:030B18622DFA478C88129899D9E56ED8],[ts:1493906566742]', 'wangan', '2017-05-04 22:02:47');
INSERT INTO `sys_log` VALUES ('339DCDECC54D4807A5BCF99429523A6A', 'toMenuTreeView', '', 'wangan', '2017-04-27 15:01:05');
INSERT INTO `sys_log` VALUES ('33A9FDACCC604130AB2F6BF6F6498CB0', 'list', '', 'wangan', '2017-05-04 20:45:22');
INSERT INTO `sys_log` VALUES ('33EDC35C4293467ABF8886A9E4BA6FD7', 'error', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 16:56:18');
INSERT INTO `sys_log` VALUES ('33FD994AF5E24B8496924533936EF939', 'menuTree', '[time:1493898404473]', 'wangan', '2017-05-04 19:46:44');
INSERT INTO `sys_log` VALUES ('3403AB5929834EDC9AA9E8EC1A7DCA2C', 'welcome', '', 'wangan', '2017-05-04 21:58:25');
INSERT INTO `sys_log` VALUES ('34118D015BA74ABF9FD28F4B3CA129CB', 'listEmployee', '', 'wangan', '2017-05-02 22:23:05');
INSERT INTO `sys_log` VALUES ('3451E09571D64A3FBC76E9D3114332CA', 'menuTree', '[time:1493906469608]', 'wangan', '2017-05-04 22:01:10');
INSERT INTO `sys_log` VALUES ('34B3BF8303914856BCFB228068710C40', 'menuTree', '[time:1494055832133]', 'wangan', '2017-05-06 15:30:32');
INSERT INTO `sys_log` VALUES ('34D1B79BB628429BBBFE9A0523BD2051', 'list', '', 'wangan', '2017-05-02 22:23:28');
INSERT INTO `sys_log` VALUES ('3561AC8ADF294419A1614B023B69E3F5', 'list', '', 'wangan', '2017-05-02 22:29:51');
INSERT INTO `sys_log` VALUES ('357B78F859834C47BA1BB66FB659675B', 'login', '', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('3587198CF6C844368CD45F51525B71BA', 'menuDetail', '[menuId:2B82868A0EAA45F6B1728328764247DD],[menuType:2]', 'wangan', '2017-05-04 19:48:12');
INSERT INTO `sys_log` VALUES ('359FD0A414024677897069F28464CBC1', 'loadPrivilege', '[roleId:030B18622DFA478C88129899D9E56ED8],[ts:1493898650004]', 'wangan', '2017-05-04 19:50:50');
INSERT INTO `sys_log` VALUES ('35C2A25F3CB3432796E788521EA73FAC', 'list', '', 'wangan', '2017-05-04 20:09:44');
INSERT INTO `sys_log` VALUES ('36116BAA7EE8496AAF5783834A68B0AC', 'toEdit', '[supplierTypeId:ST_001]', 'wangan', '2017-05-04 22:05:16');
INSERT INTO `sys_log` VALUES ('3615CF1CD19D4D4E84E7F544793F0700', 'moveUp', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuParentId:root],[menuSortOrder:8]', 'wangan', '2017-04-27 14:03:09');
INSERT INTO `sys_log` VALUES ('36273B9A1FFC471B8BB9759FBDBBB26F', 'menuDetail', '[menuId:9F9BB192B89E402C98E143E69DFAF7AA],[menuType:2]', 'wangan', '2017-05-04 22:01:19');
INSERT INTO `sys_log` VALUES ('363D6EBAC598428CBAAB8939E0A22962', 'menuTree', '[time:1493734662416]', 'wangan', '2017-05-02 22:17:42');
INSERT INTO `sys_log` VALUES ('36521F3F0BE14F0088B879038D05B0A0', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 19:46:55');
INSERT INTO `sys_log` VALUES ('368334D799AF41BE834AC16FA76B0125', 'login', '[time:1493259235801]', NULL, '2017-04-27 10:13:56');
INSERT INTO `sys_log` VALUES ('36938898F87D4752A7039ED7969306CA', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:00:56');
INSERT INTO `sys_log` VALUES ('36B4B778A4864EB496315D51A969865A', 'welcome', '', 'wangan', '2017-05-04 21:19:51');
INSERT INTO `sys_log` VALUES ('36CA63A079D44DD9B01F012A80ECAEBA', 'menuTree', '[time:1493370399972]', 'wangan', '2017-04-28 17:06:40');
INSERT INTO `sys_log` VALUES ('3709518ABABA485CB9105AB2F85F949F', 'scmSystem', '', 'wangan', '2017-04-27 15:10:09');
INSERT INTO `sys_log` VALUES ('379CAC139B924CC083C87784815F8D90', 'getVCode', '', NULL, '2017-04-26 18:10:37');
INSERT INTO `sys_log` VALUES ('37BA3505FBAD47BD80A834B433566FBB', 'list', '', 'wangan', '2017-05-04 20:42:37');
INSERT INTO `sys_log` VALUES ('37CC26610AF54E8E9CB904F96E1E9608', 'menuTree', '[time:1493273703664]', 'wangan', '2017-04-27 14:15:04');
INSERT INTO `sys_log` VALUES ('38B45DB1488F4434A839F0A1283E69C1', 'menuTree', '[time:1493283752387]', 'wangan', '2017-04-27 17:02:32');
INSERT INTO `sys_log` VALUES ('38D8352870CC426E994F50592C177532', 'scmSystem', '', 'wangan', '2017-04-27 10:52:32');
INSERT INTO `sys_log` VALUES ('3912A38AFA9D4CF99C384251E9936E44', 'listUser', '', 'wangan', '2017-04-26 17:38:07');
INSERT INTO `sys_log` VALUES ('393497DDD96C450198E5921F45E01127', 'loadTree', '[ts:1494053684273]', 'wangan', '2017-05-06 14:54:44');
INSERT INTO `sys_log` VALUES ('395BACF1D28D45AA9C3B74C2A1B6EEA1', 'listUser', '', 'wangan', '2017-04-26 17:41:55');
INSERT INTO `sys_log` VALUES ('398EAA0CA4B148749DD956454A26C00D', 'menuTree', '[time:1493201446349]', 'wangan', '2017-04-26 18:10:46');
INSERT INTO `sys_log` VALUES ('39A56A1B34EA49E384E5B95F7421F0FA', 'toMenuTreeView', '', 'java', '2017-05-06 15:01:00');
INSERT INTO `sys_log` VALUES ('39BF4A0308604B74B2BA9525743A7825', 'list', '', 'wangan', '2017-05-04 21:58:42');
INSERT INTO `sys_log` VALUES ('3A0F44DF517240708539D18F6EF55A7E', 'editMenu', '[time:1493273800937]', 'wangan', '2017-04-27 14:16:41');
INSERT INTO `sys_log` VALUES ('3A61646A6AAA46A28F00108F011B81F6', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 21:24:00');
INSERT INTO `sys_log` VALUES ('3AC39CB5BFED40A9B47822F66E81BC4F', 'welcome', '', 'wangan', '2017-04-26 18:10:00');
INSERT INTO `sys_log` VALUES ('3ACD73D7C4D64744AA5B05E1AA4CB461', 'error', '', 'wangan', '2017-04-26 18:10:03');
INSERT INTO `sys_log` VALUES ('3AE1A4DE600743A8ABE5971C9398EAFB', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 19:57:18');
INSERT INTO `sys_log` VALUES ('3B285D9950484AD8AF168F2E55F6324C', 'welcome', '', 'jishu', '2017-05-06 15:30:54');
INSERT INTO `sys_log` VALUES ('3B2F4552B68549E78484FCFC23C80BFB', 'menuTree', '[time:1493283078313]', 'wangan', '2017-04-27 16:51:18');
INSERT INTO `sys_log` VALUES ('3B2F643613714F2A8B438EAE758C0E40', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 22:00:41');
INSERT INTO `sys_log` VALUES ('3B340592B2554412A1D87FE3FEE31717', 'welcome', '', 'wangan', '2017-05-04 07:52:22');
INSERT INTO `sys_log` VALUES ('3B6885905ADB43EBA2B38B1F2F0B6265', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 13:52:14');
INSERT INTO `sys_log` VALUES ('3B715DCF87C541DD8DD2DBDAC5D6D2BB', 'login', '', 'wangan', '2017-05-04 19:58:58');
INSERT INTO `sys_log` VALUES ('3BA1E07687BA4454AC1430D5338DE94C', 'logout', '', 'wangan', '2017-05-06 15:30:37');
INSERT INTO `sys_log` VALUES ('3BCCD4232A3E4874BBAC1405F58A7C20', 'menuDetail', '[menuId:022606F27FDD4CE7BFF3BABE16872D2C],[menuType:3]', 'wangan', '2017-05-04 19:47:52');
INSERT INTO `sys_log` VALUES ('3BDE7B8CA0E6406BA718FD1D6F1FAB7D', 'menuTree', '[time:1493273533852]', 'wangan', '2017-04-27 14:12:14');
INSERT INTO `sys_log` VALUES ('3BE636A2863949589E2DFC44D35F7122', 'error', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuParentId:root],[menuSortOrder:8]', 'wangan', '2017-04-27 13:52:56');
INSERT INTO `sys_log` VALUES ('3BFD63D04654446BACD9DDEF4E9B54F0', 'login', '', NULL, '2017-04-27 10:13:28');
INSERT INTO `sys_log` VALUES ('3C1D0A4BD55442F39B2E76454474FD9F', 'menuTree', '[time:1493982348681]', 'wangan', '2017-05-05 19:05:49');
INSERT INTO `sys_log` VALUES ('3C66FB0041344B06B00F8516A848BDA1', 'scmSystem', '', 'jishu', '2017-05-06 16:16:06');
INSERT INTO `sys_log` VALUES ('3C74726DD47047C4BFC4EF2FCD84A459', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 19:46:33');
INSERT INTO `sys_log` VALUES ('3C77FE0DEF864D48980380263A77613B', 'menuTree', '[time:1493900665791]', 'wangan', '2017-05-04 20:24:26');
INSERT INTO `sys_log` VALUES ('3CBA42BE7B10496C86C8716EE959E3AF', 'list', '', 'wangan', '2017-05-04 22:08:44');
INSERT INTO `sys_log` VALUES ('3CC15EAEED064E4B852F8CB51DAC3705', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493734800624]', 'wangan', '2017-05-02 22:20:01');
INSERT INTO `sys_log` VALUES ('3CC5F7DCE78D4346A8AAF08329BFC282', 'toAdd', '', 'wangan', '2017-05-04 22:07:43');
INSERT INTO `sys_log` VALUES ('3D0A223ABD194C419DA3C126B41436F6', 'menuTree', '[time:1493282808958]', 'wangan', '2017-04-27 16:46:49');
INSERT INTO `sys_log` VALUES ('3D101027E3214A47B54A08EBEFF9876B', 'list', '', 'wangan', '2017-05-04 20:41:49');
INSERT INTO `sys_log` VALUES ('3D1D80782DAA4463AC632899165D36A1', 'welcome', '', 'wangan', '2017-05-03 16:39:47');
INSERT INTO `sys_log` VALUES ('3DBC4D3693854B62A28A0AA6BAC38309', 'list', '', 'wangan', '2017-05-04 22:08:51');
INSERT INTO `sys_log` VALUES ('3DFB012E9D384DCB8A3D7297432ACF64', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493861408573]', 'wangan', '2017-05-04 09:30:09');
INSERT INTO `sys_log` VALUES ('3E970B38E7744F929475029ABFDC0B1A', 'menuTree', '[time:1493283484930]', 'wangan', '2017-04-27 16:58:05');
INSERT INTO `sys_log` VALUES ('3EA8F405D8244DA4BCFFD37FF17C6F90', 'list', '', 'wangan', '2017-05-04 22:08:16');
INSERT INTO `sys_log` VALUES ('3EC7BA51B0974714805FB202CC6CFB16', 'scmSystem', '', 'wangan', '2017-05-04 19:55:42');
INSERT INTO `sys_log` VALUES ('3ED67FBE30874304B84FEDB8486180E9', 'list', '', 'wangan', '2017-05-04 22:05:46');
INSERT INTO `sys_log` VALUES ('3F23B532977A43AAA4FF53F0D2DE98A0', 'welcome', '', 'wangan', '2017-05-04 21:23:47');
INSERT INTO `sys_log` VALUES ('3F2E040AEF954B13A6692D0F62CB6F2A', 'scmSystem', '', 'wangan', '2017-05-04 20:24:25');
INSERT INTO `sys_log` VALUES ('3F4A100A011B4D979291C3BE18D66E0D', 'menuTree', '[time:1494037944206]', 'wangan', '2017-05-06 10:32:24');
INSERT INTO `sys_log` VALUES ('3FA542C57D9F4D21BB6B2836C0DCA993', 'toMenuTreeView', '', 'wangan', '2017-05-04 21:58:49');
INSERT INTO `sys_log` VALUES ('3FAF10E130E54514B9C2B2BB0B48A7EB', 'toPrivilegeView', '', 'wangan', '2017-05-06 14:54:44');
INSERT INTO `sys_log` VALUES ('3FD93D64791847749340ACF4ACD85111', 'toAddRoleView', '', 'wangan', '2017-05-04 19:49:08');
INSERT INTO `sys_log` VALUES ('401B866D32004174ADC994F1C991DDA3', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:25:24');
INSERT INTO `sys_log` VALUES ('4058E85ABC9D41458C955B4506695B2C', 'login', '', 'wangan', '2017-05-04 21:49:14');
INSERT INTO `sys_log` VALUES ('40D566F683314F8DB2C6F77D8BF8D531', 'list', '', 'wangan', '2017-05-04 22:07:03');
INSERT INTO `sys_log` VALUES ('415F7856912546D2B3D50FECA7306AC4', 'listLog', '[beginDate:2017-02-01],[endDate:2017-05-01],[userAccount:],[page.pageIndex:2]', 'wangan', '2017-05-02 22:21:34');
INSERT INTO `sys_log` VALUES ('419E934B825943E496AC23C9D2D8ECE6', 'scmSystem', '', 'wangan', '2017-04-27 14:02:47');
INSERT INTO `sys_log` VALUES ('41A4C1058E5E48FCB7913DE5877B6501', 'listLog', '', 'wangan', '2017-05-02 16:21:27');
INSERT INTO `sys_log` VALUES ('41B27CD85ACF402A940B83C51EBA63B2', 'scmSystem', '', 'wangan', '2017-05-04 20:00:46');
INSERT INTO `sys_log` VALUES ('41C786DB6A55439489524500B34DA91B', 'scmSystem', '', 'wangan', '2017-05-04 20:09:41');
INSERT INTO `sys_log` VALUES ('41F8B98880A74E5384CDAB4359F402BA', 'welcome', '', 'wangan', '2017-04-27 16:39:01');
INSERT INTO `sys_log` VALUES ('420FA2B97ACC485089595FB14C5FB698', 'roleList', '[name:],[status:1、2、3],[_status:on、on、on]', 'wangan', '2017-05-02 22:19:06');
INSERT INTO `sys_log` VALUES ('4229159D245D43098C3FE0C7D8838A6D', 'listEmployee', '', 'wangan', '2017-05-04 19:53:07');
INSERT INTO `sys_log` VALUES ('4260D260064041F9982680F3C8CC1131', 'welcome', '', 'wangan', '2017-05-04 21:42:47');
INSERT INTO `sys_log` VALUES ('42815D7AE4374CE89FE1AD0E916AE410', 'menuTree', '[time:1493277021114]', 'wangan', '2017-04-27 15:10:28');
INSERT INTO `sys_log` VALUES ('42EEC4EE817144039499005B42D10448', 'toPrivilegeView', '', 'wangan', '2017-05-03 16:53:07');
INSERT INTO `sys_log` VALUES ('432C6B0F010D40A6A1A0D0A392EADA5E', 'getVCode', '', NULL, '2017-04-27 10:06:32');
INSERT INTO `sys_log` VALUES ('43891D93B6E9471DB13CABA1E4E47535', 'menuTree', '[time:1494059627322]', 'jishu', '2017-05-06 16:33:47');
INSERT INTO `sys_log` VALUES ('43C7852BCBB7403E910BFC287C1563B1', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-02 16:12:31');
INSERT INTO `sys_log` VALUES ('43C8BD3095F245EBB3537E73B7C9F05E', 'login', '', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('4403D68E3EF840EA89B1049B1781CDC9', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:50:08');
INSERT INTO `sys_log` VALUES ('44158240E3C84C80941513722D6DFEDB', 'toAdd', '', 'wangan', '2017-05-04 20:55:25');
INSERT INTO `sys_log` VALUES ('446CD687C9264D2E9ED6B7EA3D998CFB', 'menuTree', '[time:1493906447822]', 'wangan', '2017-05-04 22:00:48');
INSERT INTO `sys_log` VALUES ('44875D632BC4432D94D84AAAD1705AE2', 'error', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 16:52:58');
INSERT INTO `sys_log` VALUES ('450F3501DDE34BBE8C0BCDF1BFE378EE', 'loadPrivilege', '[roleId:82888F565F5747D3B41B9FBB94ED408A],[ts:1493906578566]', 'wangan', '2017-05-04 22:02:59');
INSERT INTO `sys_log` VALUES ('45180343E929416D8C30D3177262081A', 'list', '', 'wangan', '2017-05-04 22:08:21');
INSERT INTO `sys_log` VALUES ('452E857D5C544B009490BB099FF8D145', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:57:55');
INSERT INTO `sys_log` VALUES ('456E1F220ECD462F801CB430B5324BF3', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-04-27 16:49:32');
INSERT INTO `sys_log` VALUES ('459BA6C93E484A34A07D579929CE34D8', 'loadPrivilege', '[roleId:030B18622DFA478C88129899D9E56ED8],[ts:1493801728353]', 'wangan', '2017-05-03 16:55:28');
INSERT INTO `sys_log` VALUES ('45DAE7B031BE4708884D4FEE7A562C6F', 'login', '', 'wangan', '2017-05-04 20:24:34');
INSERT INTO `sys_log` VALUES ('462E4223F733422287D96B3B0739F347', 'menuTree', '[time:1493282975567]', 'wangan', '2017-04-27 16:49:36');
INSERT INTO `sys_log` VALUES ('46D9DEFC5A56401390C761F5D85639CE', 'menuTree', '[time:1494059627796]', 'jishu', '2017-05-06 16:33:48');
INSERT INTO `sys_log` VALUES ('4779918362C145A485EE4CA113779C3E', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 21:36:05');
INSERT INTO `sys_log` VALUES ('47A4BB5C22634370877F83B493BB8572', 'list', '', 'wangan', '2017-05-04 20:42:41');
INSERT INTO `sys_log` VALUES ('47A8AF380D104F7BA2AA20E6AB6BF47B', 'scmSystem', '', 'wangan', '2017-04-27 15:39:38');
INSERT INTO `sys_log` VALUES ('47CF918637D64B3A90C44E219558EC1A', 'loadTree', '[ts:1494056342448]', 'jishu', '2017-05-06 15:39:02');
INSERT INTO `sys_log` VALUES ('47FBC50FB9BE4B298F4CA20E900B2C77', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 20:42:42');
INSERT INTO `sys_log` VALUES ('480F5E0D23504099BE84DB15B4CE6093', 'menuDetail', '[menuId:D5DBBFDE5EC549FF8E179C505C7B662A],[menuType:2]', 'wangan', '2017-05-04 22:00:51');
INSERT INTO `sys_log` VALUES ('481E936EC8B54F25B1114A9F9E00DA58', 'getVCode', '', NULL, '2017-04-27 10:13:30');
INSERT INTO `sys_log` VALUES ('485DC2B698644972AC3B749B6732C3F5', 'menuDetail', '[menuId:0AC72214D36F4B69B02EC662A055E0DF],[menuType:2]', 'wangan', '2017-11-23 15:37:10');
INSERT INTO `sys_log` VALUES ('486A1B04DA1A43E0B0FE57DFA68BEFD1', 'error', '', 'wangan', '2017-05-04 20:45:56');
INSERT INTO `sys_log` VALUES ('48819DCC0E264B429A617FC049219E8D', 'menuTree', '[time:1493273525602]', 'wangan', '2017-04-27 14:12:06');
INSERT INTO `sys_log` VALUES ('48B99C28B1DC4C64BD5443A3DC944470', 'toModifyPasswdView', '', 'java', '2017-11-22 16:11:11');
INSERT INTO `sys_log` VALUES ('48EA41B1185646BEBCA320D69228D167', 'login', '', 'wangan', '2017-05-05 19:04:36');
INSERT INTO `sys_log` VALUES ('48EBB40BD3DF440AA1CE58E1658DB7BA', 'list', '[department.id:]', 'wangan', '2017-04-27 10:52:52');
INSERT INTO `sys_log` VALUES ('492145F9036A49479BF497573136755D', 'scmSystem', '', 'wangan', '2017-11-23 15:37:02');
INSERT INTO `sys_log` VALUES ('496DC78A3EA14632B69BDF7A568900A9', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1494053364648]', 'wangan', '2017-05-06 14:49:25');
INSERT INTO `sys_log` VALUES ('49A725016B854D20B01FF2A1F86E51A6', 'loadPrivilege', '[roleId:C968B245101E4687A476AE7582ED1620],[ts:1493855568314]', 'wangan', '2017-05-04 07:52:48');
INSERT INTO `sys_log` VALUES ('49C617743B6B4A1BAB59935BAE50A5E7', 'toModifyPasswdView', '', 'wangan', '2017-05-04 22:04:12');
INSERT INTO `sys_log` VALUES ('49DC7ABE856C484183CD0EFA2958C8FC', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-06 09:19:06');
INSERT INTO `sys_log` VALUES ('49E81E0CA51A4741A260C6E388831CF3', 'menuDetail', '[menuId:66CE47589138475F9FD6C22EF4C9F027],[menuType:2]', 'wangan', '2017-05-04 19:47:57');
INSERT INTO `sys_log` VALUES ('4A17CDA25E7B429B8BF8A2D1D29B8AB6', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-04 22:00:30');
INSERT INTO `sys_log` VALUES ('4A2D3F9A66A24560AAAABE811CE0A225', 'list', '', 'wangan', '2017-05-04 20:45:17');
INSERT INTO `sys_log` VALUES ('4A6398D74A154E0DA54815BC782454B8', 'menuTree', '[time:1493734663623]', 'wangan', '2017-05-02 22:17:44');
INSERT INTO `sys_log` VALUES ('4B06C15E80C8447FA1C8D440D28E9CBA', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:02:50');
INSERT INTO `sys_log` VALUES ('4B0E03A29B2A43C2A9943347CC1B20DC', 'list', '', 'wangan', '2017-04-26 18:31:55');
INSERT INTO `sys_log` VALUES ('4B1152EEC4AC469CB27A717C1108BCEF', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:52:07');
INSERT INTO `sys_log` VALUES ('4B828604BC784D35BAAAEA3BF37E8A42', 'toEdit', '[supplierId:HUAWEI_CQ]', 'wangan', '2017-05-04 22:05:41');
INSERT INTO `sys_log` VALUES ('4B838A7F2E894B619156FE10318C490F', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:57:52');
INSERT INTO `sys_log` VALUES ('4B9405A0CA4F4B529F5C2B13872A9784', 'login', '', 'wangan', '2017-05-04 19:57:19');
INSERT INTO `sys_log` VALUES ('4BA0F3C3BDAB45C3BE197A55B802F37C', 'menuTree', '[time:1493901707045]', 'wangan', '2017-05-04 20:41:47');
INSERT INTO `sys_log` VALUES ('4BABEDE64B8347A8B72433253A238771', 'welcome', '', 'wangan', '2017-05-04 08:41:10');
INSERT INTO `sys_log` VALUES ('4BC5CB1AF0514EC99A02740F832B00A9', 'menuDetail', '[menuId:EF99DA4BBF394222A73C4B9DA87DA100],[menuType:2]', 'wangan', '2017-05-04 19:48:06');
INSERT INTO `sys_log` VALUES ('4C5077205CB4431F8DA75D803B7A6BB7', 'menuTree', '[time:1493273439183]', 'wangan', '2017-04-27 14:10:39');
INSERT INTO `sys_log` VALUES ('4CBC2E6FBF3B410C848910C089C37F0E', 'listDepartment', '[name:],[address:5]', 'wangan', '2017-05-04 22:04:37');
INSERT INTO `sys_log` VALUES ('4D00775311474EF9964363D6EBEC158B', 'list', '', 'wangan', '2017-05-04 20:55:23');
INSERT INTO `sys_log` VALUES ('4D3510CC461F4D8A8282C91A9803CAB2', 'scmSystem', '', 'wangan', '2017-05-04 19:55:03');
INSERT INTO `sys_log` VALUES ('4D452B964EAF4A50B1A5BD1B220D634A', 'welcome', '', 'wangan', '2017-11-23 16:43:54');
INSERT INTO `sys_log` VALUES ('4D97C9B7BFAE42E29750C545F3D11458', 'menuTree', '[time:1493898356855]', 'wangan', '2017-05-04 19:45:57');
INSERT INTO `sys_log` VALUES ('4E22471BE1C24D5E953800554FDE8770', 'listDepartment', '[name:销售部],[address:]', 'wangan', '2017-05-04 22:04:24');
INSERT INTO `sys_log` VALUES ('4E3527BB370347249865993F46DBDF6B', 'menuTree', '[time:1493898939397]', 'wangan', '2017-05-04 19:55:39');
INSERT INTO `sys_log` VALUES ('4E4B4EC9E0D3476C8002CFBC63EF237D', 'roleList', '', 'wangan', '2017-05-02 22:19:30');
INSERT INTO `sys_log` VALUES ('4E514A01C1E446DABF31E48F8A9812C9', 'menuDetail', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuType:2],[refreshTree:true]', 'wangan', '2017-04-27 16:49:10');
INSERT INTO `sys_log` VALUES ('4E5596F13C864DE187A7874BF7B1AEE4', 'login', '', 'wangan', '2017-05-04 20:41:52');
INSERT INTO `sys_log` VALUES ('4E993DF5F2EF4D9597FA8374D0482283', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 21:20:10');
INSERT INTO `sys_log` VALUES ('4EB466DBEE5C4CAC8AC936598D7CDE13', 'welcome', '', 'wangan', '2017-04-27 14:49:07');
INSERT INTO `sys_log` VALUES ('4F634FB418044A1FAE09BAB402591D5C', 'menuTree', '[time:1493906450719]', 'wangan', '2017-05-04 22:00:51');
INSERT INTO `sys_log` VALUES ('4F7D1621B4E14D76887F28414C39AEE6', 'welcome', '', 'wangan', '2017-05-04 21:25:53');
INSERT INTO `sys_log` VALUES ('4FC491513CE643F9B7FD3725C2FEFE5A', 'error', '', 'wangan', '2017-05-04 20:25:17');
INSERT INTO `sys_log` VALUES ('4FEA42277100489683C55D8992935864', 'getVCode', '', NULL, '2017-04-26 17:57:19');
INSERT INTO `sys_log` VALUES ('502AEC7CFDF24169BBDFDE0B6A60B8E6', 'toModifyPasswdView', '', 'wangan', '2017-05-02 22:21:49');
INSERT INTO `sys_log` VALUES ('50577B5CD7B34B15942597DCE9865D10', 'menuTree', '[time:1493202794241]', 'wangan', '2017-04-26 18:33:14');
INSERT INTO `sys_log` VALUES ('50689BC456E7412A8AA24656C257A288', 'menuTree', '[time:1493200559444]', 'wangan', '2017-04-26 17:55:59');
INSERT INTO `sys_log` VALUES ('506BFA8F84B94D319945021C8C3983EB', 'menuTree', '[time:1493371746915]', 'wangan', '2017-04-28 17:29:07');
INSERT INTO `sys_log` VALUES ('50DB9716133F41E58143A05C8F59AAB2', 'welcome', '', 'wangan', '2017-05-04 22:00:02');
INSERT INTO `sys_log` VALUES ('50DBFFDE21254BEF905BCB0CD3B1EC8A', 'scmSystem', '', 'jishu', '2017-05-06 16:34:36');
INSERT INTO `sys_log` VALUES ('5131BAF55859436891484BDD75A71A49', 'login', '[time:1493201445648]', NULL, '2017-04-26 18:10:46');
INSERT INTO `sys_log` VALUES ('5152F7725189430591937AE9887CB08F', 'getVCode', '', NULL, '2017-04-26 18:13:05');
INSERT INTO `sys_log` VALUES ('515E73F5AB4145B0A5D762550A8B51B9', 'menuTree', '[time:1493905911894]', 'wangan', '2017-05-04 21:51:52');
INSERT INTO `sys_log` VALUES ('51BD099212B14F9C9210D818A58A366B', 'menuTree', '[time:1493275747145]', 'wangan', '2017-04-27 14:49:07');
INSERT INTO `sys_log` VALUES ('51F0EDDDD94D470C8F58ECF76AA103C8', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:39:25');
INSERT INTO `sys_log` VALUES ('521FD74E2CBC4FBA9EB51AEC13217054', 'menuTree', '[time:1493898488421]', 'wangan', '2017-05-04 19:48:08');
INSERT INTO `sys_log` VALUES ('52462F5E054D4C31BC792A20FF6DABF1', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 21:13:19');
INSERT INTO `sys_log` VALUES ('525AB4DE1B89455B928457CC9B342AE8', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493734835092]', 'wangan', '2017-05-02 22:20:35');
INSERT INTO `sys_log` VALUES ('52B51A7E811F4C5D9D6BC4FF19BECF25', 'scmSystem', '', 'wangan', '2017-05-06 14:33:38');
INSERT INTO `sys_log` VALUES ('52DC6C73130A4821A45758CAA21B5A5A', 'toEditEmpView', '[id:1D22C965DE3F432B8E484C59AF477303]', 'wangan', '2017-05-04 19:53:15');
INSERT INTO `sys_log` VALUES ('531C0F71FFF14395A3193A55212E611D', 'loadPrivilege', '[roleId:C968B245101E4687A476AE7582ED1620],[ts:1493801713998]', 'wangan', '2017-05-03 16:55:14');
INSERT INTO `sys_log` VALUES ('5347B8B2D625484A90E72789DB4DE961', 'loadPrivilege', '[roleId:FE3C747252B14163AC962623EFA4B850],[ts:1493898671725]', 'wangan', '2017-05-04 19:51:12');
INSERT INTO `sys_log` VALUES ('535C9ECBEBF44180A663669489E15B2A', 'menuTree', '[time:1493898476902]', 'wangan', '2017-05-04 19:47:57');
INSERT INTO `sys_log` VALUES ('539440A3FB7C492BA952A32F3930FE36', 'menuDetail', '[menuId:9584BB3C0395456A82390A5F900F9D3A],[menuType:2]', 'wangan', '2017-04-27 16:58:10');
INSERT INTO `sys_log` VALUES ('5459087E9C6A4E5ABC42DDB1D4FE8086', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493860208392]', 'wangan', '2017-05-04 09:10:08');
INSERT INTO `sys_log` VALUES ('548582949DCA4D1387F759C8F7E44444', 'login', '', NULL, '2017-04-26 18:32:58');
INSERT INTO `sys_log` VALUES ('54CB426E4A1F4E2AB395E33EA798300C', 'welcome', '', 'wangan', '2017-05-04 21:28:23');
INSERT INTO `sys_log` VALUES ('550B6056837B412CBB36D2A66A05BCDA', 'loadPrivilege', '[roleId:FE3C747252B14163AC962623EFA4B850],[ts:1493801716970]', 'wangan', '2017-05-03 16:55:17');
INSERT INTO `sys_log` VALUES ('55118938F405405C888913B1ED96D591', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 16:39:27');
INSERT INTO `sys_log` VALUES ('5539B00D61D846589070D20339B4A766', 'scmSystem', '', 'jishu', '2017-05-06 15:29:53');
INSERT INTO `sys_log` VALUES ('55A94C70211A40838A94FC972AAA09B8', 'menuTree', '[time:1493906401733]', 'wangan', '2017-05-04 22:00:02');
INSERT INTO `sys_log` VALUES ('55B2019BA5BA4DA49563AF878FA76914', 'editMenu', '[time:1493273810189]', 'wangan', '2017-04-27 14:16:50');
INSERT INTO `sys_log` VALUES ('55C3DDD48F99470C877F82CD5C257591', 'toAdd', '', 'wangan', '2017-05-04 20:42:36');
INSERT INTO `sys_log` VALUES ('5682B5DFE6B34D85ACCB1156938780B3', 'scmSystem', '', 'wangan', '2017-05-04 20:19:42');
INSERT INTO `sys_log` VALUES ('56AF879A2BE2415CB5C2F4C032F46EF6', 'error', '', 'wangan', '2017-04-26 17:50:16');
INSERT INTO `sys_log` VALUES ('56BE899D304E44BFA9AC612195C4D37A', 'toMenuTreeView', '', 'wangan', '2017-04-27 14:15:06');
INSERT INTO `sys_log` VALUES ('56FB5CD22D5F40E1ACCE9618EAFC7054', 'toEditMenuView', '[menuId:D012F1DD21F1473B838382E04A011BF7]', 'wangan', '2017-04-27 14:16:29');
INSERT INTO `sys_log` VALUES ('56FFFE59EA1940759CEB5763A8BE18E3', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-02 22:17:42');
INSERT INTO `sys_log` VALUES ('570D470EA4F44323B8D492D7EC185BF3', 'scmSystem', '', 'jishu', '2017-05-06 15:17:55');
INSERT INTO `sys_log` VALUES ('5796494A2080490699614498E27B0025', 'menuTree', '[time:1493906430574]', 'wangan', '2017-05-04 22:00:31');
INSERT INTO `sys_log` VALUES ('57F2EBC620304061B1104C7A0CA8E74A', 'login', '', NULL, '2017-04-26 17:57:18');
INSERT INTO `sys_log` VALUES ('5855013CFA1E43A2853E3EA26AF835FB', 'scmSystem', '', 'wangan', '2017-04-27 14:49:07');
INSERT INTO `sys_log` VALUES ('585FF6BC01B24A67B730D364A6C3B000', 'menuTree', '[time:1511422624839]', 'wangan', '2017-11-23 15:37:05');
INSERT INTO `sys_log` VALUES ('589BA9A6537A47FB87C917A3389F53A2', 'menuTree', '[time:1493272967709]', 'wangan', '2017-04-27 14:02:48');
INSERT INTO `sys_log` VALUES ('58CA0F53A4464D93B9F0370A2BA9FAE2', 'toAddDeptView', '', 'wangan', '2017-05-04 19:53:00');
INSERT INTO `sys_log` VALUES ('591C4F33D0D3443A879B84B06CC91368', 'login', '', 'wangan', '2017-05-05 19:04:38');
INSERT INTO `sys_log` VALUES ('59705F2401A7415C8DA5B79EDD4BD0B0', 'menuTree', '[time:1493272997146]', 'wangan', '2017-04-27 14:03:17');
INSERT INTO `sys_log` VALUES ('59C5D0DA29D7414CA9EBF90D528DA8FC', 'scmSystem', '', 'wangan', '2017-05-04 21:35:56');
INSERT INTO `sys_log` VALUES ('59EF1A6AF2E04FA6AD6F900F0E8F9500', 'menuTree', '[time:1493283371932]', 'wangan', '2017-04-27 16:56:12');
INSERT INTO `sys_log` VALUES ('5A108B3C6FB14E04AB76152A92FA2233', 'menuDetail', '[menuId:66CE47589138475F9FD6C22EF4C9F027],[menuType:2]', 'wangan', '2017-05-04 22:01:08');
INSERT INTO `sys_log` VALUES ('5A53DC0FDF9647B0A653A416E3560653', 'menuTree', '[time:1493735386688]', 'wangan', '2017-05-02 22:29:47');
INSERT INTO `sys_log` VALUES ('5A74EF56555448EC99E8D30A8F5E6372', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:43:00');
INSERT INTO `sys_log` VALUES ('5AD3285051C64F40992E698D67B1BA12', 'error', '', 'wangan', '2017-05-04 22:09:00');
INSERT INTO `sys_log` VALUES ('5ADB2695E3F94824AD0529F533B6918C', 'menuTree', '[time:1493283486860]', 'wangan', '2017-04-27 16:58:07');
INSERT INTO `sys_log` VALUES ('5B0D458169CE4339A976744BCF07F5FC', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('5B440143675B4C81BF72CE83EEFAA58E', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 17:02:53');
INSERT INTO `sys_log` VALUES ('5B5F1A8264C541199646007E3D663271', 'listDepartment', '', 'wangan', '2017-05-04 20:25:15');
INSERT INTO `sys_log` VALUES ('5B9FDB52A2E740338178786C45D82B89', 'listLog', '[beginDate:2017-04-04],[endDate:2017-05-02],[userAccount:],[page.pageIndex:1]', 'wangan', '2017-05-04 22:03:47');
INSERT INTO `sys_log` VALUES ('5BB0AFCEDAF3424D90E8EFB25C82C41E', 'toEdit', '[supplierTypeId:ST_001]', 'wangan', '2017-05-04 19:53:33');
INSERT INTO `sys_log` VALUES ('5BC017F3932F491E90C376CBC767815B', 'menuTree', '[time:1493898428301]', 'wangan', '2017-05-04 19:47:08');
INSERT INTO `sys_log` VALUES ('5BE3BA42C2CE4C0E874DBB7B872C803C', 'toEdit', '', 'wangan', '2017-05-04 21:31:36');
INSERT INTO `sys_log` VALUES ('5BFDA9F1DC3A49ABACCD51BA0494A2E0', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1494036753051]', 'wangan', '2017-05-06 10:12:33');
INSERT INTO `sys_log` VALUES ('5C5308E074AE48DC9120A7A7C5ADB5BB', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 19:54:41');
INSERT INTO `sys_log` VALUES ('5C8C45C534FE47C59596D87834B78F5B', 'login', '', 'wangan', '2017-05-04 21:57:42');
INSERT INTO `sys_log` VALUES ('5CA96694FEE04BD2BCC76DAD71CDAECF', 'welcome', '', 'jishu', '2017-05-06 15:17:55');
INSERT INTO `sys_log` VALUES ('5CD0BC078BDE422DB2455174BE1D5FA8', 'list', '', 'wangan', '2017-05-04 22:06:29');
INSERT INTO `sys_log` VALUES ('5D09956A0DEA42F0873B741D8508EC5A', 'listUser', '', 'wangan', '2017-05-04 19:50:24');
INSERT INTO `sys_log` VALUES ('5D1B2F56D8724DFA899FFD0EB9D95F62', 'menuTree', '[time:1493283981157]', 'wangan', '2017-04-27 17:06:21');
INSERT INTO `sys_log` VALUES ('5D5FF6CBA0B949EF87A9E2F94C2C1D84', 'welcome', '', 'jishu', '2017-05-06 16:18:40');
INSERT INTO `sys_log` VALUES ('5D6CCB7E540545678463103371460F73', 'welcome', '', 'wangan', '2017-05-04 20:50:02');
INSERT INTO `sys_log` VALUES ('5D752B576A8D4970AAF807D4C7CC7530', 'loadPrivilege', '[roleId:FE3C747252B14163AC962623EFA4B850],[ts:1493801589802]', 'wangan', '2017-05-03 16:53:10');
INSERT INTO `sys_log` VALUES ('5D7A3C7DAB18405B80DAB80849E0D076', 'login', '', 'wangan', '2017-05-04 20:09:19');
INSERT INTO `sys_log` VALUES ('5E39455FB6D24A3889C46CD90361B6EC', 'menuTree', '[time:1493283760386]', 'wangan', '2017-04-27 17:02:40');
INSERT INTO `sys_log` VALUES ('5E5D4831427345CAABF3AAFDF318BC61', 'welcome', '', 'wangan', '2017-04-27 17:06:18');
INSERT INTO `sys_log` VALUES ('5EC9FC0D1514473EB5D576C5D369E59E', 'toEditRoleView', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C]', 'wangan', '2017-05-02 22:19:24');
INSERT INTO `sys_log` VALUES ('5EF4BE2CF3FD4306BF64EAB7D70B759D', 'welcome', '', 'wangan', '2017-05-04 21:16:32');
INSERT INTO `sys_log` VALUES ('5F45CD4D513F4129B18B8EA323DEE12A', 'getVCode', '', NULL, '2017-04-27 10:41:07');
INSERT INTO `sys_log` VALUES ('5FC684336B794BE58EF32753E257F9E4', 'welcome', '', 'wangan', '2017-05-04 21:31:31');
INSERT INTO `sys_log` VALUES ('60484EC1F4DB46BA9D4570FC136088E1', 'menuTree', '[time:1494053534651]', 'jishu', '2017-05-06 14:52:15');
INSERT INTO `sys_log` VALUES ('6048AC0CBA8E40429F071F1320A4380C', 'toEditMenuView', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07]', 'wangan', '2017-05-04 22:00:38');
INSERT INTO `sys_log` VALUES ('606A502D84A643BBAD698D2EA071B6CF', 'scmSystem', '', 'wangan', '2017-04-28 17:10:20');
INSERT INTO `sys_log` VALUES ('6077DEB0970D4AB3BBF01D4189A39FBB', 'menuDetail', '[menuId:1A29CDD70FF14348BE8806CB56FEA77E],[menuType:1]', 'wangan', '2017-05-04 19:47:49');
INSERT INTO `sys_log` VALUES ('6077F9D282374A1CA6E9A2F35666BEF7', 'toMenuTreeView', '', 'wangan', '2017-04-27 13:52:13');
INSERT INTO `sys_log` VALUES ('60B5EF238D364F7FAB64F624E2B206F5', 'welcome', '', 'wangan', '2017-05-04 20:00:46');
INSERT INTO `sys_log` VALUES ('60DD41CCF9F04F119DF211FDF83555B1', 'listLog', '[beginDate:2017-02-01],[endDate:2017-05-01],[userAccount:]', 'wangan', '2017-05-02 22:21:24');
INSERT INTO `sys_log` VALUES ('60E585D8741147F1958153E255605B3D', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 18:20:44');
INSERT INTO `sys_log` VALUES ('61142C7377B242ADAAAF78B78C13CA92', 'error', '', 'wangan', '2017-05-02 22:23:54');
INSERT INTO `sys_log` VALUES ('6126F4BFF9644BCD9EE656D4C804CFEF', 'error', '[mobileTypeId:hw-002]', 'wangan', '2017-05-04 21:34:09');
INSERT INTO `sys_log` VALUES ('618F37B28D224325A660D8521232E826', 'menuTree', '[time:1493898484663]', 'wangan', '2017-05-04 19:48:05');
INSERT INTO `sys_log` VALUES ('61AEE56873C347D6847ED73E771DB02E', 'loadPrivilege', '[roleId:030B18622DFA478C88129899D9E56ED8],[ts:1493734828627]', 'wangan', '2017-05-02 22:20:29');
INSERT INTO `sys_log` VALUES ('61D6375158AB47DCA921AB82B4E6FF12', 'success', '', 'wangan', '2017-04-26 17:55:59');
INSERT INTO `sys_log` VALUES ('62232B50D57D42B7B911BC42EC581F9E', 'menuTree', '[time:1493261559379]', 'wangan', '2017-04-27 10:52:39');
INSERT INTO `sys_log` VALUES ('6228F12B7AD344F2A8EF34EB46BF011B', 'toEdit', '[customerTypeId:CT_CHANGQI]', 'wangan', '2017-05-04 22:05:59');
INSERT INTO `sys_log` VALUES ('624B48036B394184878CFA9BD50243B9', 'toEdit', '[accountId:36192E9DEEEB4F1399DFE9198252D44D]', 'wangan', '2017-05-04 22:08:40');
INSERT INTO `sys_log` VALUES ('626786EBC0C84C64AD2A08CBD841E6FA', 'login', '[time:1493898939155]', 'wangan', '2017-05-04 19:55:39');
INSERT INTO `sys_log` VALUES ('6272A5BB245D471286CC230361A47322', 'scmSystem', '', 'wangan', '2017-05-02 16:11:43');
INSERT INTO `sys_log` VALUES ('6273B9D98E3A4605ABCA1DE659BF3723', 'menuTree', '[time:1494060040542]', 'java', '2017-05-06 16:40:41');
INSERT INTO `sys_log` VALUES ('629B0F0356F343E1BC20FB5FD5835DD3', 'login', '[time:1493201398787]', NULL, '2017-04-26 18:09:59');
INSERT INTO `sys_log` VALUES ('62DA3C31B57244A1B0C990F36020DAB5', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:49:26');
INSERT INTO `sys_log` VALUES ('630A8A2F24634605851D5A2F8583306F', 'menuTree', '[time:1511422627470]', 'wangan', '2017-11-23 15:37:07');
INSERT INTO `sys_log` VALUES ('6346EB6CFE7C442088C9420051315717', 'listDepartment', '', 'wangan', '2017-05-04 19:53:04');
INSERT INTO `sys_log` VALUES ('63557F487FB94F8CB67B015D7CEC1C0D', 'menuTree', '[time:1493273445941]', 'wangan', '2017-04-27 14:10:46');
INSERT INTO `sys_log` VALUES ('63D7D1CC532549E5AA5A4D45CDA486E4', 'toAdd', '', 'wangan', '2017-05-04 20:02:05');
INSERT INTO `sys_log` VALUES ('64D501C3D6CD4D0485C29F9E38388C67', 'login', '', 'wangan', '2017-05-04 20:02:05');
INSERT INTO `sys_log` VALUES ('658258FCF9F249C28B26319B2C75629C', 'toAdd', '', 'wangan', '2017-05-04 20:45:15');
INSERT INTO `sys_log` VALUES ('659D8A68822040E78BE99667C5B39C78', 'menuTree', '[time:1493905366595]', 'wangan', '2017-05-04 21:42:47');
INSERT INTO `sys_log` VALUES ('65E792A504C24E2D919C2A887211C3D4', 'toMenuTreeView', '', 'wangan', '2017-04-27 10:52:39');
INSERT INTO `sys_log` VALUES ('65E8DBE0545C47E09A36C1ACE8259A18', 'welcome', '', 'wangan', '2017-05-04 20:51:54');
INSERT INTO `sys_log` VALUES ('660973DE9FAD4A8BAA2EDA817034A358', 'listDepartment', '', 'wangan', '2017-05-04 19:52:51');
INSERT INTO `sys_log` VALUES ('6612A5739C2248E7B6737C6F2F734F4D', 'list', '[startDate:2017-04-04],[endDate:2017-05-01],[supplier.supplierType.id:],[supplier.id:],[tradeType:77]', 'wangan', '2017-05-04 22:11:41');
INSERT INTO `sys_log` VALUES ('661B5E2AA28D4ED4BFD414F295A36CDC', 'toMenuTreeView', '', 'wangan', '2017-04-27 14:41:53');
INSERT INTO `sys_log` VALUES ('662FC6E5E34444E1825838ED6F2AE4AD', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:41:53');
INSERT INTO `sys_log` VALUES ('6677E2727592419C9D89A5F607B7E3CC', 'welcome', '', 'wangan', '2017-05-06 10:32:24');
INSERT INTO `sys_log` VALUES ('66A35A4C7A7F4645B9AF121A8937928B', 'loadPrivilege', '[roleId:82888F565F5747D3B41B9FBB94ED408A],[ts:1493734844865]', 'wangan', '2017-05-02 22:20:45');
INSERT INTO `sys_log` VALUES ('66A766D89B6C4A9F8D3A23653FAC2018', 'menuDetail', '[menuId:0AC72214D36F4B69B02EC662A055E0DF],[menuType:2]', 'wangan', '2017-05-04 22:00:49');
INSERT INTO `sys_log` VALUES ('66BED2D5029C4DFB8C39ECA5B1EEA95B', 'login', '[time:1493982277289]', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('66C779D920A1474BB37BC680F1FEB1BA', 'menuTree', '[time:1511338265162]', 'java', '2017-11-22 16:11:05');
INSERT INTO `sys_log` VALUES ('66CD621299104F44A3D21A36991057ED', 'scmSystem', '', 'wangan', '2017-05-04 20:41:47');
INSERT INTO `sys_log` VALUES ('67102FDFBF2A4D7CBDBAB765CD2181AB', 'welcome', '', 'wangan', '2017-04-26 17:46:05');
INSERT INTO `sys_log` VALUES ('6719299A814F4C7986632B1D9CE03B19', 'list', '', 'wangan', '2017-05-04 19:53:27');
INSERT INTO `sys_log` VALUES ('675DA16ACC4542CD89DA8C24FE13DEB2', 'welcome', '', 'wangan', '2017-05-06 14:33:38');
INSERT INTO `sys_log` VALUES ('67801ABB15D641F7B3259DC1A4F203E2', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:57:45');
INSERT INTO `sys_log` VALUES ('67F1B0E206124F7E8CA56980B0159E6D', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 22:00:37');
INSERT INTO `sys_log` VALUES ('6869FFDACD694802987727FF337FB8BF', 'menuTree', '[time:1493283368254]', 'wangan', '2017-04-27 16:56:08');
INSERT INTO `sys_log` VALUES ('68B2775ADA724757B407B0521CEC9AB7', 'scmSystem', '', 'wangan', '2017-05-06 09:18:58');
INSERT INTO `sys_log` VALUES ('68C459AAB93E4FE3B4DA8D5EF539EB35', 'listUser', '', 'wangan', '2017-05-02 22:19:54');
INSERT INTO `sys_log` VALUES ('68C5E66110354EEAB065146848024B5C', 'toPrivilegeView', '', 'wangan', '2017-05-04 09:09:45');
INSERT INTO `sys_log` VALUES ('68C5F682BEC049FB9C71499F32244A51', 'welcome', '', 'java', '2017-05-06 15:00:03');
INSERT INTO `sys_log` VALUES ('68CFEFE4E349435A89DF0AC5DDC3E68E', 'list', '', 'wangan', '2017-05-04 20:45:49');
INSERT INTO `sys_log` VALUES ('68EA4292D5114BB493E334BD8713A5F6', 'menuTree', '[time:1493283771629]', 'wangan', '2017-04-27 17:02:52');
INSERT INTO `sys_log` VALUES ('68F198C25C9347FF8B8CEBA8AC1C8DD0', 'list', '', 'wangan', '2017-05-04 21:13:17');
INSERT INTO `sys_log` VALUES ('68F81F2D98164BAFB5210A2DA206550D', 'menuTree', '[time:1494057868865]', 'jishu', '2017-05-06 16:04:29');
INSERT INTO `sys_log` VALUES ('68FC7E482CC94303AB4BFCE3EF485332', 'menuTree', '[time:1493902313904]', 'wangan', '2017-05-04 20:51:54');
INSERT INTO `sys_log` VALUES ('693DAA4CF49748D4B8EEC7B95E7B2D60', 'list', '', 'wangan', '2017-05-04 20:53:11');
INSERT INTO `sys_log` VALUES ('6942EB2FB2964D6FA0DF52FCEC46FD2C', 'welcome', '', 'wangan', '2017-04-27 11:46:52');
INSERT INTO `sys_log` VALUES ('69D7CF7CC225403CAD78C499EC36E7BF', 'loadTree', '[ts:1493855550166]', 'wangan', '2017-05-04 07:52:30');
INSERT INTO `sys_log` VALUES ('6A0C46A73CBE4E5083D09E575D3C000C', 'login', '', 'wangan', '2017-05-04 19:55:13');
INSERT INTO `sys_log` VALUES ('6A246EEFD506408DA47C2437D1801DC9', 'login', '', NULL, '2017-04-26 18:10:36');
INSERT INTO `sys_log` VALUES ('6A2860A5E9D04DE08E2C0715259BA0D7', 'toMenuTreeView', '', 'wangan', '2017-04-27 17:06:21');
INSERT INTO `sys_log` VALUES ('6A7F57835C674FEB82E0287D18E8C877', 'toEditDeptView', '[id:65EBF040B74E4E73B3D7C475F01AFDC8]', 'wangan', '2017-05-04 19:52:46');
INSERT INTO `sys_log` VALUES ('6A9CDEE7890646A1A6B43DC567CDF096', 'menuDetail', '[menuId:9584BB3C0395456A82390A5F900F9D3A],[menuType:2]', 'wangan', '2017-04-27 16:49:53');
INSERT INTO `sys_log` VALUES ('6AA6DFD2A7C74F3CB9DECA83093E8743', 'toEdit', '', 'wangan', '2017-05-04 21:31:36');
INSERT INTO `sys_log` VALUES ('6AE72B0569AA47B4B65C36475F445FAD', 'roleList', '[name:店长],[status:1],[_status:on、on、on]', 'wangan', '2017-05-04 19:48:43');
INSERT INTO `sys_log` VALUES ('6B8D600E712C4B5A8938513B566AE76D', 'login', '', NULL, '2017-04-27 10:06:26');
INSERT INTO `sys_log` VALUES ('6BA45CBC05D44EAF9B78F0C6FFC9D4B4', 'scmSystem', '', 'wangan', '2017-05-04 20:18:02');
INSERT INTO `sys_log` VALUES ('6BA5BB7E19EE4776B16FC173B2CA95CE', 'menuTree', '[time:1493906329858]', 'wangan', '2017-05-04 21:58:50');
INSERT INTO `sys_log` VALUES ('6C308BD9E7D246A480960481F6ED11AB', 'listDepartment', '', 'java', '2017-11-22 16:11:15');
INSERT INTO `sys_log` VALUES ('6C3A589130A94D4AADBD7A0DF64BC675', 'toMenuTreeView', '', 'wangan', '2017-04-27 16:56:11');
INSERT INTO `sys_log` VALUES ('6C6A1675F27F4DA29872AE84E9A0CA10', 'menuTree', '[time:1493282993259]', 'wangan', '2017-04-27 16:49:53');
INSERT INTO `sys_log` VALUES ('6C7DAB5AC26A424D9AE0511B54BD2C68', 'scmSystem', '', 'wangan', '2017-05-04 21:23:44');
INSERT INTO `sys_log` VALUES ('6CB366D9CDB94210B32D49910BBD3B5F', 'menuTree', '[time:1494057838117]', 'jishu', '2017-05-06 16:03:58');
INSERT INTO `sys_log` VALUES ('6CC654D38C124B2B9954A49E893402B5', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 22:00:33');
INSERT INTO `sys_log` VALUES ('6CD7A3055A1347ADA24441C6380A7C27', 'list', '', 'wangan', '2017-05-04 20:27:04');
INSERT INTO `sys_log` VALUES ('6CEAAA36867544BAB3D4D092AB43964D', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 17:02:34');
INSERT INTO `sys_log` VALUES ('6CF4F91D26C7437EA1CE4E9566DC428C', 'menuTree', '[time:1493273441932]', 'wangan', '2017-04-27 14:10:42');
INSERT INTO `sys_log` VALUES ('6D0656C313AE47F1BC7730648F5A4978', 'login', '', 'wangan', '2017-05-04 21:43:33');
INSERT INTO `sys_log` VALUES ('6D12F47CE633462CB8EF668CC99C81A7', 'list', '', 'wangan', '2017-05-04 20:24:28');
INSERT INTO `sys_log` VALUES ('6DBDC60DD2644BF08F12E713C25A0071', 'list', '', 'wangan', '2017-11-23 16:43:59');
INSERT INTO `sys_log` VALUES ('6DCEBDC01C1041E6AA6D9E9ADBC2D936', 'menuTree', '[time:1493283981001]', 'wangan', '2017-04-27 17:06:21');
INSERT INTO `sys_log` VALUES ('6DD9534852D74C94A9AC49B685550AF4', 'login', '[time:1493201593211]', NULL, '2017-04-26 18:13:13');
INSERT INTO `sys_log` VALUES ('6E00CFC8A8F3484EAFA3C0F9FC4C99D6', 'welcome', '', 'wangan', '2017-05-04 21:35:56');
INSERT INTO `sys_log` VALUES ('6E435DD8939D4670A92BF1DB254D0DD2', 'roleList', '[name:],[status:1],[_status:on、on、on]', 'wangan', '2017-05-04 19:49:33');
INSERT INTO `sys_log` VALUES ('6E7AEFD2B19B42F1B4E11FE5F2EF25A6', 'list', '', 'wangan', '2017-05-04 20:25:22');
INSERT INTO `sys_log` VALUES ('6E9905DBF3D9465AA39DAF22349703E1', 'welcome', '', 'wangan', '2017-04-26 17:55:59');
INSERT INTO `sys_log` VALUES ('6EE8822064E64E53A7F2072C661F6FF0', 'toAdd', '', 'wangan', '2017-05-04 20:45:40');
INSERT INTO `sys_log` VALUES ('6EF1FAE17F9C44868FEA25AABE2ED53A', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 17:06:21');
INSERT INTO `sys_log` VALUES ('6F2D393153374875A75930ECC1650A75', 'roleList', '', 'wangan', '2017-05-04 22:01:57');
INSERT INTO `sys_log` VALUES ('6F68546CAF694DF2B0EECC2CB08C3B90', 'menuTree', '[time:1493272368417]', 'wangan', '2017-04-27 13:52:48');
INSERT INTO `sys_log` VALUES ('6F738DFC15E741B8ABCA17BECFE0DC1C', 'menuTree', '[time:1493898415366]', 'wangan', '2017-05-04 19:46:55');
INSERT INTO `sys_log` VALUES ('6F7EAB32C11A4A3BA0E9AB3253C9D1C5', 'menuTree', '[time:1494033546769]', 'wangan', '2017-05-06 09:19:07');
INSERT INTO `sys_log` VALUES ('701A0E279F154EB48551F4B8F259D985', 'menuDetail', '[menuId:691BB7442DED45F2A2D36F802C33E7B6],[menuType:2]', 'wangan', '2017-05-04 19:47:50');
INSERT INTO `sys_log` VALUES ('701CAD8FED1749D693321514DA57E056', 'toMenuTreeView', '', 'wangan', '2017-04-27 14:56:14');
INSERT INTO `sys_log` VALUES ('703EBBD846614AC29631479B283DB9B3', 'success', '', 'wangan', '2017-04-26 18:09:59');
INSERT INTO `sys_log` VALUES ('7077C8221BD0496FB3B2B6B284B95623', 'listDepartment', '', 'wangan', '2017-05-04 22:04:31');
INSERT INTO `sys_log` VALUES ('70C94697BE6C47979E2E0C51A7426337', 'menuTree', '[time:1493898459397]', 'wangan', '2017-05-04 19:47:39');
INSERT INTO `sys_log` VALUES ('7122FB777E8340E785E62D55B68BD7B6', 'menuTree', '[time:1493902202010]', 'wangan', '2017-05-04 20:50:02');
INSERT INTO `sys_log` VALUES ('71C513783340429AABC3426CB459CF83', 'menuTree', '[time:1493273801373]', 'wangan', '2017-04-27 14:16:41');
INSERT INTO `sys_log` VALUES ('721B3894F21B454FACA2EF76DB599284', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:49:36');
INSERT INTO `sys_log` VALUES ('723146498B0E4256A4443E2E9CBBBA00', 'welcome', '', 'wangan', '2017-04-27 10:26:41');
INSERT INTO `sys_log` VALUES ('72457B470271429C97FC1F7C9868B357', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:16:46');
INSERT INTO `sys_log` VALUES ('726152726A1643DFB3C24C238E63358D', 'scmSystem', '', 'java', '2017-05-06 16:40:40');
INSERT INTO `sys_log` VALUES ('72DCB2E2CE0942A5B08C9A6215E3B3A9', 'logout', '', 'wangan', '2017-05-06 14:52:05');
INSERT INTO `sys_log` VALUES ('72F3C5564D87488B8AB0755FF8DB1373', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:49:25');
INSERT INTO `sys_log` VALUES ('73032BF67E88491995AB50FFEAC99252', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493801631586]', 'wangan', '2017-05-03 16:53:52');
INSERT INTO `sys_log` VALUES ('730DC5B850534C3C8669DD86A4FC3C0D', 'menuTree', '[time:1493272445073]', 'wangan', '2017-04-27 13:54:05');
INSERT INTO `sys_log` VALUES ('73200EBDC9524406BB2C0000A9E0B64D', 'menuTree', '[time:1493282896129]', 'wangan', '2017-04-27 16:48:16');
INSERT INTO `sys_log` VALUES ('737D127D852F4B9592E37A20B5CAF497', 'scmSystem', '', 'wangan', '2017-05-04 19:58:49');
INSERT INTO `sys_log` VALUES ('7386EE98C6D94424BF380E2B2C1916E8', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:26:08');
INSERT INTO `sys_log` VALUES ('73E10B6B271047EC97CE7110155E9495', 'login', '', 'wangan', '2017-05-04 21:36:05');
INSERT INTO `sys_log` VALUES ('73E2E8A462C54E75BB3F8BC075A1F4BB', 'toAdd', '', 'wangan', '2017-05-04 22:08:47');
INSERT INTO `sys_log` VALUES ('73F7BE6888804483A13D7D0FD15EDD55', 'login', '', 'wangan', '2017-05-04 20:27:05');
INSERT INTO `sys_log` VALUES ('7403E261B5BA481F80C4757FE3962EBC', 'error', '', 'wangan', '2017-05-04 22:11:08');
INSERT INTO `sys_log` VALUES ('741A8B12C7AE4219BEE8B6281D67D284', 'welcome', '', 'wangan', '2017-05-04 20:55:20');
INSERT INTO `sys_log` VALUES ('742058D5CE3C4EE68701808772289C05', 'listDepartment', '', 'wangan', '2017-05-04 22:04:15');
INSERT INTO `sys_log` VALUES ('7429E346E77A433487595C220EA6C44D', 'scmSystem', '', 'jishu', '2017-05-06 16:17:27');
INSERT INTO `sys_log` VALUES ('7448BE8F50BC49BA97C2E4B333B45C36', 'menuTree', '[time:1493282968155]', 'wangan', '2017-04-27 16:49:28');
INSERT INTO `sys_log` VALUES ('747FD3BAAB7E407483691704FD0A689A', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:15:07');
INSERT INTO `sys_log` VALUES ('74AA27E6CA414333984510DE0697E370', 'login', '', 'wangan', '2017-05-04 20:18:51');
INSERT INTO `sys_log` VALUES ('74B8A6C38B5249DA95E63FFBE470860B', 'error', '', NULL, '2017-04-27 10:38:06');
INSERT INTO `sys_log` VALUES ('74CFC6F673974ED883A7ECE1B4D6BB0A', 'list', '[id:],[name:]', 'wangan', '2017-05-04 22:05:39');
INSERT INTO `sys_log` VALUES ('759B95B9DF64479BABA9C5FE8249E1A2', 'welcome', '', 'wangan', '2017-05-04 19:55:42');
INSERT INTO `sys_log` VALUES ('75A6372C3D2E4DDB92FC372D03E495F9', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('75CD2E0CF7B143099CAB72EA9CC1F387', 'login', '', NULL, '2017-04-27 10:19:34');
INSERT INTO `sys_log` VALUES ('75D97E1904374C1CA1EF00DF7A9EE42A', 'toAdd', '', 'wangan', '2017-05-02 22:23:54');
INSERT INTO `sys_log` VALUES ('75E96185D6404001A550DF32D2326FF5', 'toEditDeptView', '[id:47DAF9B6E0F54A7FAC847F209719E913]', 'wangan', '2017-05-02 22:22:03');
INSERT INTO `sys_log` VALUES ('7623D9EC9B0A4EA2BE19E542D74492F4', 'error', '', 'wangan', '2017-05-04 19:52:46');
INSERT INTO `sys_log` VALUES ('763B3DD3AF4D4D6FA6D9B2325C82E172', 'menuTree', '[time:1493276174777]', 'wangan', '2017-04-27 14:56:15');
INSERT INTO `sys_log` VALUES ('766460F09B074F33B4E99B5827B347DC', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:58:29');
INSERT INTO `sys_log` VALUES ('768F40418DFB49B4BEE5751AF644EB27', 'success', '', 'wangan', '2017-04-26 18:18:57');
INSERT INTO `sys_log` VALUES ('76BEC89890B0427694E012F616709CFF', 'welcome', '', 'wangan', '2017-05-04 21:46:13');
INSERT INTO `sys_log` VALUES ('76C06739A8154792B006621DED7D9F7C', 'toEdit', '[accessoryTypeId:ry-001]', 'wangan', '2017-05-04 22:08:13');
INSERT INTO `sys_log` VALUES ('76C9063536324C2691465DB5567E3D06', 'menuTree', '[time:1493898420949]', 'wangan', '2017-05-04 19:47:01');
INSERT INTO `sys_log` VALUES ('770044B760AB4904B6B5DE5772ECF2EA', 'menuTree', '[time:1493282899648]', 'wangan', '2017-04-27 16:48:20');
INSERT INTO `sys_log` VALUES ('771CDC27EBF540DF9CCB2DC5620E8633', 'listLog', '[beginDate:2017-04-04],[endDate:2017-05-02],[userAccount:],[page.pageIndex:24]', 'wangan', '2017-05-04 22:03:42');
INSERT INTO `sys_log` VALUES ('7729EF632ACA49D584B9E1AC4F0AC11F', 'roleList', '', 'wangan', '2017-05-06 09:37:49');
INSERT INTO `sys_log` VALUES ('7750756F38BC45FEB7313A83EAF59759', 'welcome', '', 'wangan', '2017-05-04 19:55:39');
INSERT INTO `sys_log` VALUES ('777B9F1B5DF14A6FA419D91DAB476218', 'login', '', NULL, '2017-04-26 17:45:39');
INSERT INTO `sys_log` VALUES ('77AC5D1BD28E4E52A31670B36ACE1C4B', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 14:10:46');
INSERT INTO `sys_log` VALUES ('7851BF16995147B98BB4630478C2442D', 'scmSystem', '', 'wangan', '2017-05-04 20:31:29');
INSERT INTO `sys_log` VALUES ('787D89809F5A413B955D39C98D28F5F8', 'menuTree', '[time:1493904352804]', 'wangan', '2017-05-04 21:25:53');
INSERT INTO `sys_log` VALUES ('78BCD528CC924231AC26855F1D6668C4', 'list', '', 'wangan', '2017-05-04 22:05:15');
INSERT INTO `sys_log` VALUES ('78F9CEF17C3849A39A1C98AFF9E4C555', 'toEdit', '[mobileTypeId:hw-004]', 'wangan', '2017-05-04 20:19:46');
INSERT INTO `sys_log` VALUES ('7945E33E8F7B4D8EAD10CE5FC63EDF20', 'list', '', 'wangan', '2017-05-04 20:19:45');
INSERT INTO `sys_log` VALUES ('7946EC5ED55F46B4B845D6C856A85DB2', 'toMenuTreeView', '', 'wangan', '2017-04-27 16:49:35');
INSERT INTO `sys_log` VALUES ('7982DC7272AA497D9590816D7991D57D', 'success', '', 'wangan', '2017-04-26 18:13:14');
INSERT INTO `sys_log` VALUES ('79AD6F22E78B48FCBDBDF5416955E974', 'menuDetail', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuType:1]', 'wangan', '2017-04-27 16:49:28');
INSERT INTO `sys_log` VALUES ('79DBEC78F5544ECBAA70D7CCE75EAAE2', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493800920935]', 'wangan', '2017-05-03 16:42:01');
INSERT INTO `sys_log` VALUES ('79F797F639C645E89927B65860049C37', 'welcome', '', 'jishu', '2017-05-06 16:34:36');
INSERT INTO `sys_log` VALUES ('7A180B6A989242D2AF5CD964EF4F6812', 'menuTree', '[time:1493734649799]', 'wangan', '2017-05-02 22:17:30');
INSERT INTO `sys_log` VALUES ('7A349D998B7D452B91105C9B85FC6EA4', 'menuTree', '[time:1493272357293]', 'wangan', '2017-04-27 13:52:37');
INSERT INTO `sys_log` VALUES ('7AAAFD4C53ED4E5CB7253D4F28990670', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('7AE10461862B45EB98A10E4D02AB274B', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-04 21:58:49');
INSERT INTO `sys_log` VALUES ('7AFBC44FA01148708844213800C8D400', 'scmSystem', '', 'jishu', '2017-05-06 15:30:54');
INSERT INTO `sys_log` VALUES ('7B238D3375B5487E8C11CC92CAB679D8', 'menuDetail', '[menuId:C6CB628964FB453EB7362BA20DE422FA],[menuType:2]', 'wangan', '2017-05-04 19:47:53');
INSERT INTO `sys_log` VALUES ('7B8182628D2A4FC3AA875853A5811916', 'error', '', 'wangan', '2017-05-04 22:04:45');
INSERT INTO `sys_log` VALUES ('7BEB86781D4B4E4D923D61641BE62CBA', 'roleList', '', 'wangan', '2017-05-04 22:01:35');
INSERT INTO `sys_log` VALUES ('7BED0FD0A675492C937F25D84B7B8442', 'scmSystem', '', 'wangan', '2017-05-04 20:27:01');
INSERT INTO `sys_log` VALUES ('7C17A7D3BE56402495420CBDC03D3772', 'menuDetail', '[menuId:9584BB3C0395456A82390A5F900F9D3A],[menuType:2]', 'wangan', '2017-04-27 16:48:16');
INSERT INTO `sys_log` VALUES ('7C6AA8517B4747378887AC73C5573492', 'menuTree', '[time:1493898461097]', 'wangan', '2017-05-04 19:47:41');
INSERT INTO `sys_log` VALUES ('7D94D67D6DEE49C78463193F71429A84', 'toEdit', '', 'wangan', '2017-05-04 21:31:36');
INSERT INTO `sys_log` VALUES ('7DA7B8B81BC343E09BA87178954FFE14', 'toMenuTreeView', '', 'wangan', '2017-04-28 17:06:39');
INSERT INTO `sys_log` VALUES ('7E6762EB227C4A3D93FA30465B8F1A91', 'list', '[startDate:2017-11-16],[endDate:2017-11-24],[supplier.supplierType.id:],[supplier.id:],[tradeType:77]', 'wangan', '2017-11-23 14:57:02');
INSERT INTO `sys_log` VALUES ('7E85DE7522F84EC2B9C0F090C8F09F0F', 'list', '', 'wangan', '2017-04-26 18:28:04');
INSERT INTO `sys_log` VALUES ('7F394D6A2D6B4E588664B1C31F59A4D8', 'logout', '', 'jishu', '2017-05-06 14:52:39');
INSERT INTO `sys_log` VALUES ('7F5A7D1D12CA45B097FEB1DB27E5E2AC', 'error', '', 'wangan', '2017-11-23 14:57:06');
INSERT INTO `sys_log` VALUES ('7FB44C72789F46CE911F074A8AE9229E', 'toMenuTreeView', '', 'wangan', '2017-04-27 16:46:08');
INSERT INTO `sys_log` VALUES ('7FFB2A8E1FEC46D5BBF65B44180C171A', 'loadTree', '[ts:1493860185741]', 'wangan', '2017-05-04 09:09:46');
INSERT INTO `sys_log` VALUES ('8081B7FFEDC14080BA661B1123F1E2A8', 'moveUp', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuParentId:root],[menuSortOrder:8]', 'wangan', '2017-04-27 16:46:56');
INSERT INTO `sys_log` VALUES ('8086AD1AE3B34DEBA28AA89FCD7DC16B', 'success', '', 'wangan', '2017-04-26 18:33:14');
INSERT INTO `sys_log` VALUES ('80A3BF00769C4DD7A7361FE0707E553A', 'toMenuTreeView', '', 'wangan', '2017-04-27 17:02:51');
INSERT INTO `sys_log` VALUES ('80BBC9BD0091461498D758872F759227', 'list', '[table:basic_color]', 'wangan', '2017-05-04 19:54:31');
INSERT INTO `sys_log` VALUES ('80BD4C1AE31541508EE439FD09E2B730', 'error', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 17:01:49');
INSERT INTO `sys_log` VALUES ('81ECEB170F7D45BDA98BEB71F48EB0E9', 'menuTree', '[time:1493899911724]', 'wangan', '2017-05-04 20:11:58');
INSERT INTO `sys_log` VALUES ('820EA1856F234B0D93B128589F0A32C6', 'listUser', '[account:java]', 'wangan', '2017-05-04 19:49:48');
INSERT INTO `sys_log` VALUES ('8288BA77C7544A53B74A4F1EAB83501A', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 16:48:19');
INSERT INTO `sys_log` VALUES ('82A561D10A7544D08845CC5167A86FC2', 'listEmployee', '', 'wangan', '2017-05-06 14:43:38');
INSERT INTO `sys_log` VALUES ('82EE133166724747A9295A12E12C9AB5', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('831837AF1AB946B0A095F9BEEDA3AAA0', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493906557253]', 'wangan', '2017-05-04 22:02:37');
INSERT INTO `sys_log` VALUES ('8349FE7593EE4B7A87331D7F731DE503', 'menuTree', '[time:1494053650500]', 'wangan', '2017-05-06 14:54:11');
INSERT INTO `sys_log` VALUES ('83564A44205547AFA4B2473635237199', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 19:55:13');
INSERT INTO `sys_log` VALUES ('838821916C934156B0B357378BEB4DDF', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:24:34');
INSERT INTO `sys_log` VALUES ('83E39D1A77474145A1FC207FE1B67A0A', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:58:07');
INSERT INTO `sys_log` VALUES ('843D91B72E6144DF946FF1F3F314684A', 'scmSystem', '', 'wangan', '2017-05-04 21:46:11');
INSERT INTO `sys_log` VALUES ('847136A0133447A2B43B39D7F3E8D89D', 'list', '[table:basic_color]', 'wangan', '2017-05-04 22:06:43');
INSERT INTO `sys_log` VALUES ('84E10B3681F7422796983CBE65CC5AEA', 'listLog', '[beginDate:2017-04-19],[endDate:2017-04-27],[userAccount:]', 'wangan', '2017-04-26 17:56:34');
INSERT INTO `sys_log` VALUES ('851DB62F360A4CB49B849394B4606F6A', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:57:49');
INSERT INTO `sys_log` VALUES ('852363BBEBDB49E0890975DADF5CAAFA', 'loadTree', '[ts:1493734800407]', 'wangan', '2017-05-02 22:20:00');
INSERT INTO `sys_log` VALUES ('8537B5CC8B584404A90CABBA93737C82', 'menuTree', '[time:1493906463695]', 'wangan', '2017-05-04 22:01:04');
INSERT INTO `sys_log` VALUES ('859F8FAE92274D20BF655256A5F31E8B', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1494055674782]', 'wangan', '2017-05-06 15:27:55');
INSERT INTO `sys_log` VALUES ('862D8262186E4F6D98B4A9E665EB03DD', 'list', '', 'wangan', '2017-05-04 21:51:55');
INSERT INTO `sys_log` VALUES ('863009A4BAAB4C66AEF9C617615FF5BF', 'list', '', 'wangan', '2017-05-04 20:45:31');
INSERT INTO `sys_log` VALUES ('86B8E32922024CC7859B05254D5567A8', 'loadPrivilege', '[roleId:82888F565F5747D3B41B9FBB94ED408A],[ts:1493801709238]', 'wangan', '2017-05-03 16:55:09');
INSERT INTO `sys_log` VALUES ('8707F5BE76404C778F59FE797192ECE7', 'menuTree', '[time:1493283148929]', 'wangan', '2017-04-27 16:52:29');
INSERT INTO `sys_log` VALUES ('87A37A9A09CA4F4E89CD13986170A852', 'toPrivilegeView', '', 'wangan', '2017-05-02 22:20:00');
INSERT INTO `sys_log` VALUES ('883671BC15E34D988125EC43C079D9A8', 'toAdd', '', 'wangan', '2017-05-04 21:58:38');
INSERT INTO `sys_log` VALUES ('8853083747CE4B2086455991A023487B', 'listEmployee', '', 'wangan', '2017-05-04 19:53:19');
INSERT INTO `sys_log` VALUES ('88B3926FFC6344D8908A12A51AE0EED8', 'menuDetail', '[menuId:1A29CDD70FF14348BE8806CB56FEA77E],[menuType:1]', 'wangan', '2017-05-04 22:00:52');
INSERT INTO `sys_log` VALUES ('88FCCDCA18EB498C93338ECACCF02BD8', 'menuTree', '[time:1493734702709]', 'wangan', '2017-05-02 22:18:23');
INSERT INTO `sys_log` VALUES ('89806D73C41041BA8A81F2B5E3F6CF9A', 'list', '[table:basic_brand]', 'wangan', '2017-05-04 22:06:39');
INSERT INTO `sys_log` VALUES ('89D9E1966D5344B2A35FAF32CA0153CE', 'login', '', 'wangan', '2017-05-04 20:43:06');
INSERT INTO `sys_log` VALUES ('89E28712298D4B0AB927393003123287', 'welcome', '', 'wangan', '2017-05-02 22:29:47');
INSERT INTO `sys_log` VALUES ('89F0DA0502F2470CA1AF16ED7F197853', 'toAdd', '', 'wangan', '2017-05-04 20:43:06');
INSERT INTO `sys_log` VALUES ('8A068D0DDF0C4A5D92D96AF3F5DCC626', 'scmSystem', '', 'wangan', '2017-05-04 22:00:01');
INSERT INTO `sys_log` VALUES ('8A07E43171AC45A29FACC8638412C683', 'menuTree', '[time:1493734673355]', 'wangan', '2017-05-02 22:17:53');
INSERT INTO `sys_log` VALUES ('8A7CB21814F34C3786C8C10385C904D2', 'scmSystem', '', 'wangan', '2017-05-02 22:29:46');
INSERT INTO `sys_log` VALUES ('8A860AFA09A24575A6C0647D0AF608CD', 'login', '', 'wangan', '2017-05-04 20:09:28');
INSERT INTO `sys_log` VALUES ('8A9E8FCD5E65467493E9EE1F801AAE84', 'list', '', 'wangan', '2017-04-26 18:30:11');
INSERT INTO `sys_log` VALUES ('8B0EE9E4F2794C0084C0DE5A45D742C2', 'menuTree', '[time:1493858470264]', 'wangan', '2017-05-04 08:41:10');
INSERT INTO `sys_log` VALUES ('8B4D09D4CB8E45A39240B1A60D76BA04', 'list', '', 'wangan', '2017-05-04 20:12:08');
INSERT INTO `sys_log` VALUES ('8B87F01CA49E450E97BFD49F9FC968C1', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493734847052]', 'wangan', '2017-05-02 22:20:47');
INSERT INTO `sys_log` VALUES ('8BA57CA58E464BA0AA65084EB9CBC11D', 'menuTree', '[time:1493902519748]', 'wangan', '2017-05-04 20:55:20');
INSERT INTO `sys_log` VALUES ('8BD5BE0FC1844B8194BED0B80077ADA2', 'login', '', NULL, '2017-04-27 10:37:38');
INSERT INTO `sys_log` VALUES ('8C559B1FBDBF45DABBBE2D9B81E68C9E', 'list', '', 'wangan', '2017-05-04 20:00:49');
INSERT INTO `sys_log` VALUES ('8C5E640530284815A00884F5571B6EED', 'welcome', '', 'jishu', '2017-05-06 15:54:55');
INSERT INTO `sys_log` VALUES ('8C95E55329BE44BDA4A8B10FCAF3E67B', 'listUser', '', 'wangan', '2017-04-26 18:24:26');
INSERT INTO `sys_log` VALUES ('8C9F89EA468A4BB78AC713566B2E62FB', 'menuTree', '[time:1493282768037]', 'wangan', '2017-04-27 16:46:08');
INSERT INTO `sys_log` VALUES ('8CB6DD42464246FABB73F2A7F753468E', 'menuDetail', '[menuId:9F5250BD90D74A278ABC8112293A5C7C],[menuType:2]', 'wangan', '2017-05-04 22:01:09');
INSERT INTO `sys_log` VALUES ('8CE77870D528418FAC3F3C8840A91DD8', 'menuTree', '[time:1511420172902]', 'wangan', '2017-11-23 14:56:13');
INSERT INTO `sys_log` VALUES ('8CFF90CFE5AD4010870AA79428168B79', 'scmSystem', '', 'wangan', '2017-04-28 17:29:04');
INSERT INTO `sys_log` VALUES ('8D40F4EC8A5147F597A3D2CC0FA11512', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493860185965]', 'wangan', '2017-05-04 09:09:46');
INSERT INTO `sys_log` VALUES ('8D5DBD9FE23A407F8E6300FBF212247B', 'listLog', '', 'wangan', '2017-05-02 16:13:10');
INSERT INTO `sys_log` VALUES ('8DAF04C60CA54F6CA20D6FEA7645D70F', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 19:47:08');
INSERT INTO `sys_log` VALUES ('8DF2A08236DC4FF489AEF8FA99684324', 'menuTree', '[time:1511338302829]', 'java', '2017-11-22 16:11:43');
INSERT INTO `sys_log` VALUES ('8E1B938483AD48119926BBE868CF0288', 'menuDetail', '[menuId:98BE1D75CDF54D18A84923BC74A946A1],[menuType:2]', 'wangan', '2017-05-04 22:01:06');
INSERT INTO `sys_log` VALUES ('8E29BC7FE3A84DCA98190C09CCF2394E', 'listDepartment', '', 'wangan', '2017-05-04 19:52:31');
INSERT INTO `sys_log` VALUES ('8E3D9A44281E445DB0B810DB2B3D3008', 'listLog', '', 'wangan', '2017-05-04 22:03:14');
INSERT INTO `sys_log` VALUES ('8E4B6B6A47DD4F399F0FD832ADC2F194', 'menuTree', '[time:1493898486707]', 'wangan', '2017-05-04 19:48:07');
INSERT INTO `sys_log` VALUES ('8E680ADBD4364CCF80DA130555D932DA', 'menuTree', '[time:1493283977890]', 'wangan', '2017-04-27 17:06:18');
INSERT INTO `sys_log` VALUES ('8E8153B9C7D040C8B914113117DFB12C', 'menuTree', '[time:1493275808048]', 'wangan', '2017-04-27 14:50:08');
INSERT INTO `sys_log` VALUES ('8F269296D37A48D39FDFBED1E8D4909F', 'menuTree', '[time:1511338317447]', 'wangan', '2017-11-22 16:11:57');
INSERT INTO `sys_log` VALUES ('8F4E76E267E74730834615096EE75C5A', 'menuDetail', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 16:53:30');
INSERT INTO `sys_log` VALUES ('8FA3ECA38133427180EAD417E0117F6C', 'logout', '', 'jishu', '2017-05-06 16:35:56');
INSERT INTO `sys_log` VALUES ('900C2DA0CB1A4D02B27EB611CFFFAD08', 'menuTree', '[time:1493276458850]', 'wangan', '2017-04-27 15:00:59');
INSERT INTO `sys_log` VALUES ('908736F6FFF64B96B9170878558DA468', 'roleList', '[name:],[status:1],[_status:on、on、on]', 'wangan', '2017-05-04 22:01:39');
INSERT INTO `sys_log` VALUES ('909764C191404DB7A90E993AFFE99CA0', 'login', '[time:1493261551546]', NULL, '2017-04-27 10:52:32');
INSERT INTO `sys_log` VALUES ('90AB2EB1CC8F40FF82D1CC7D567EFBEE', 'menuTree', '[time:1494058720508]', 'jishu', '2017-05-06 16:18:41');
INSERT INTO `sys_log` VALUES ('90FD7720BE984492B30129C1F894E679', 'scmSystem', '', 'wangan', '2017-05-04 21:28:23');
INSERT INTO `sys_log` VALUES ('911E9C045D3048229A450478723D8450', 'error', '', NULL, '2017-04-27 11:21:52');
INSERT INTO `sys_log` VALUES ('91ADC1B557A44FFAA4924C552C87BC8C', 'toAddMenuView', '[menuId:root]', 'wangan', '2017-05-04 22:00:27');
INSERT INTO `sys_log` VALUES ('91B673CD4BB7462790523A0CA5D3E0E4', 'list', '', 'wangan', '2017-05-04 21:31:33');
INSERT INTO `sys_log` VALUES ('91C2FB14E53C47BD882379244EBD5D79', 'menuTree', '[time:1493275312981]', 'wangan', '2017-04-27 14:41:53');
INSERT INTO `sys_log` VALUES ('920EBEA7E2094B62A4AFDECF79B25D18', 'menuTree', '[time:1493282973693]', 'wangan', '2017-04-27 16:49:34');
INSERT INTO `sys_log` VALUES ('9222468F439E44A9A2DFBDC4CB232533', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:57:36');
INSERT INTO `sys_log` VALUES ('9228664A47644298B7E668837965DF21', 'toMenuTreeView', '', 'wangan', '2017-11-22 16:13:33');
INSERT INTO `sys_log` VALUES ('925E9EC9654045BD908CD2ABE90C1BF6', 'login', '', NULL, '2017-04-26 17:55:50');
INSERT INTO `sys_log` VALUES ('926E14DEA1C14EB3BA15CBCFF3FC48D4', 'list', '', 'wangan', '2017-05-04 22:08:34');
INSERT INTO `sys_log` VALUES ('92AED6FFE9064F269798DE9D840D9A6F', 'scmSystem', '', 'wangan', '2017-04-27 17:06:18');
INSERT INTO `sys_log` VALUES ('92FD64C10B7546FB94B4824FFCD5EDE0', 'welcome', '', 'wangan', '2017-04-27 15:00:59');
INSERT INTO `sys_log` VALUES ('9360C56FC6244B65A88F660EB46163F4', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:49:34');
INSERT INTO `sys_log` VALUES ('938F89503B134E4997415799A3DD7310', 'list', '', 'wangan', '2017-05-04 20:18:10');
INSERT INTO `sys_log` VALUES ('93B081DFA36844AF87D747EF39212193', 'menuTree', '[time:1493283487322]', 'wangan', '2017-04-27 16:58:07');
INSERT INTO `sys_log` VALUES ('93E8CB77B6C047C3A5E4A5348AC6AB52', 'listLog', '[beginDate:2017-04-03],[endDate:2017-04-27],[userAccount:]', 'wangan', '2017-04-26 17:50:19');
INSERT INTO `sys_log` VALUES ('9404207B43C84223A215E6C656B19019', 'roleList', '[name:],[status:1、2],[_status:on、on、on]', 'wangan', '2017-05-06 14:54:25');
INSERT INTO `sys_log` VALUES ('940B9FAFE07248BB971FD9C6DF05B9AE', 'welcome', '', 'jishu', '2017-05-06 14:52:15');
INSERT INTO `sys_log` VALUES ('94448554D2EB4FBFA61B7E9F7E945DF7', 'menuTree', '[time:1493283371602]', 'wangan', '2017-04-27 16:56:12');
INSERT INTO `sys_log` VALUES ('94B7A5A344D942F9B4A3A273EF3453DE', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:10:41');
INSERT INTO `sys_log` VALUES ('94C9E6A1B5B14EE484F70E411D8CA15D', 'login', '', NULL, '2017-04-26 18:18:46');
INSERT INTO `sys_log` VALUES ('952013CD7AA54B32B9B40EDE9494F39C', 'menuTree', '[time:1493903991483]', 'wangan', '2017-05-04 21:19:52');
INSERT INTO `sys_log` VALUES ('956D210597DE42A6920EBCF7B169406B', 'menuDetail', '[menuId:0AC72214D36F4B69B02EC662A055E0DF],[menuType:2]', 'wangan', '2017-05-02 22:17:43');
INSERT INTO `sys_log` VALUES ('95A4F2B9200649C8A3A74376728CD702', 'list', '', 'wangan', '2017-05-04 20:42:33');
INSERT INTO `sys_log` VALUES ('95C62FDC6C304789974DB5EF0A8D3CF1', 'menuTree', '[time:1493906468107]', 'wangan', '2017-05-04 22:01:08');
INSERT INTO `sys_log` VALUES ('960A35A57C5D47128B89DC38B2D8ED93', 'list', '', 'wangan', '2017-05-04 21:28:25');
INSERT INTO `sys_log` VALUES ('964577A1FC2D4FED8F4A531EE406481F', 'menuTree', '[time:1493272998935]', 'wangan', '2017-04-27 14:03:19');
INSERT INTO `sys_log` VALUES ('9662A49B28E749BF95FCC47A1D796533', 'moveDown', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuParentId:root],[menuSortOrder:7]', 'wangan', '2017-04-27 16:46:51');
INSERT INTO `sys_log` VALUES ('966BEA5F852646CEAA7429DC05853010', 'getVCode', '', NULL, '2017-04-27 10:31:20');
INSERT INTO `sys_log` VALUES ('9678C0398E1C49AC83A9BB5CF189B608', 'error', '', 'wangan', '2017-05-02 22:22:03');
INSERT INTO `sys_log` VALUES ('9699137DA1344332822210F27B043CA2', 'menuTree', '[time:1493713281454]', 'wangan', '2017-05-02 16:21:21');
INSERT INTO `sys_log` VALUES ('96DCA0BDD95347FB8FED9EC51633C20A', 'getVCode', '', NULL, '2017-04-26 17:55:50');
INSERT INTO `sys_log` VALUES ('96DD6F4F5EEF47BC90A739FE74F31133', 'toPrivilegeView', '', 'wangan', '2017-05-04 22:02:37');
INSERT INTO `sys_log` VALUES ('96E9259893BE4FF78118A72EAC126C8E', 'login', '', NULL, '2017-04-27 10:26:26');
INSERT INTO `sys_log` VALUES ('96EA63B418FE467E8C1FDA1E1F4DBD9E', 'deleteMenu', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 16:52:58');
INSERT INTO `sys_log` VALUES ('96FD2C89C55A495C9CEEE35E643155C4', 'welcome', '', 'wangan', '2017-05-04 20:24:26');
INSERT INTO `sys_log` VALUES ('971DAB0AC93947269D9B2FF866D11AB0', 'list', '', 'wangan', '2017-05-04 22:05:17');
INSERT INTO `sys_log` VALUES ('977517BF3122437C940594821C21D9B6', 'scmSystem', '', 'wangan', '2017-05-04 20:11:47');
INSERT INTO `sys_log` VALUES ('97BBCA54A8EE409E94EFFF3A4229B784', 'menuTree', '[time:1493906329334]', 'wangan', '2017-05-04 21:58:49');
INSERT INTO `sys_log` VALUES ('97BF10B19A874CDAA04C4750CF55E04A', 'menuTree', '[time:1493855541727]', 'wangan', '2017-05-04 07:52:22');
INSERT INTO `sys_log` VALUES ('97CE9B2F16C041CEA1028D373E12F958', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 17:02:35');
INSERT INTO `sys_log` VALUES ('97E468624E4F40E18947B1CDEB396CBE', 'listUser', '', 'wangan', '2017-11-22 17:03:47');
INSERT INTO `sys_log` VALUES ('9834CE6E65FC4BAE99F91279B190A162', 'list', '', 'wangan', '2017-04-26 18:30:06');
INSERT INTO `sys_log` VALUES ('983BDD965FAB484EB84F1EF65FB858C0', 'menuDetail', '[menuId:9584BB3C0395456A82390A5F900F9D3A],[menuType:2]', 'wangan', '2017-04-27 16:52:29');
INSERT INTO `sys_log` VALUES ('989DFD5947894FC4A1DA68A15133B975', 'menuDetail', '[menuId:98BE1D75CDF54D18A84923BC74A946A1],[menuType:2]', 'wangan', '2017-05-04 19:47:57');
INSERT INTO `sys_log` VALUES ('98CB0F496B164EE1868254A33AC383C7', 'login', '', NULL, '2017-04-26 18:09:47');
INSERT INTO `sys_log` VALUES ('98EB78AFF69946B68E3B1AA4F4225FD2', 'welcome', '', 'jishu', '2017-05-06 16:16:06');
INSERT INTO `sys_log` VALUES ('990A07735DFD45D0B673FA3E15D04A6A', 'logout', '', 'jishu', '2017-05-06 15:27:40');
INSERT INTO `sys_log` VALUES ('991DA31C96EF427D9A6DDE5107D5C14F', 'scmSystem', '', 'wangan', '2017-11-23 14:56:13');
INSERT INTO `sys_log` VALUES ('9963A8FEDBBF4802BAB0C71F04FD88B9', 'deleteMenu', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 16:56:18');
INSERT INTO `sys_log` VALUES ('99C950B435054C889D1365D30142026E', 'toAdd', '', 'wangan', '2017-05-04 19:53:36');
INSERT INTO `sys_log` VALUES ('99F3C7E670B943348567173582F987B8', 'welcome', '', 'wangan', '2017-04-26 18:33:14');
INSERT INTO `sys_log` VALUES ('9A1B77827E1A4CE0A758258AC3A18752', 'menuTree', '[time:1494055669381]', 'wangan', '2017-05-06 15:27:49');
INSERT INTO `sys_log` VALUES ('9A56253DD8CD4763B49B391BF6AF8F06', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:46:08');
INSERT INTO `sys_log` VALUES ('9A5B53E0F1E3446186EB979E2824B2A9', 'menuTree', '[time:1493734685521]', 'wangan', '2017-05-02 22:18:06');
INSERT INTO `sys_log` VALUES ('9AC2F82C5C49479A90EEF1D69FD27EB5', 'menuTree', '[time:1493898366653]', 'wangan', '2017-05-04 19:46:07');
INSERT INTO `sys_log` VALUES ('9AD3B69FC05E4E7E873FD39F78126B39', 'toMenuTreeView', '', 'wangan', '2017-04-27 14:10:41');
INSERT INTO `sys_log` VALUES ('9ADC094B648940A3825FCAF6490F59A8', 'list', '', 'wangan', '2017-05-04 20:09:15');
INSERT INTO `sys_log` VALUES ('9AEF37247B354C0DAD65A3B0E07DDBAF', 'welcome', '', 'wangan', '2017-04-27 10:13:58');
INSERT INTO `sys_log` VALUES ('9AEFF743DF7F4CBB85D6607525EAC273', 'toAddActionView', '[menuId:7952ADCE8BE94659903BF32E3737A322]', 'wangan', '2017-05-04 19:47:23');
INSERT INTO `sys_log` VALUES ('9B13BC213F7C4BA8B181403E1E51DAEF', 'scmSystem', '', 'wangan', '2017-05-06 15:30:32');
INSERT INTO `sys_log` VALUES ('9B575A2E4F5848F6B49760EB025A4C18', 'scmSystem', '', 'wangan', '2017-05-04 21:58:25');
INSERT INTO `sys_log` VALUES ('9C1B9585372F417CB00E4206BCC61ADE', 'listLog', '', 'wangan', '2017-04-26 17:56:02');
INSERT INTO `sys_log` VALUES ('9C21373B209C4A32B8B5B1CF1B66C3E4', 'login', '', NULL, '2017-04-27 10:41:06');
INSERT INTO `sys_log` VALUES ('9C2D9E994D3F41B9AA0FDF55AC069881', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-04 22:00:16');
INSERT INTO `sys_log` VALUES ('9C41571550B74BACAEB7D40AEF80E21D', 'welcome', '', 'wangan', '2017-05-04 20:39:16');
INSERT INTO `sys_log` VALUES ('9C46C8A21B534E5BABF346EEB9A35078', 'welcome', '', 'wangan', '2017-05-04 21:13:15');
INSERT INTO `sys_log` VALUES ('9CA3E0B6807A4BE199A1DFEF81D19860', 'welcome', '', 'wangan', '2017-04-26 18:13:14');
INSERT INTO `sys_log` VALUES ('9D037961F9DB448B94E7401FA02323E1', 'menuTree', '[time:1511426636188]', 'wangan', '2017-11-23 16:43:56');
INSERT INTO `sys_log` VALUES ('9D5E79A0D8C94BFBB60A2A9D19F44E09', 'listLog', '', 'wangan', '2017-05-02 22:21:05');
INSERT INTO `sys_log` VALUES ('9D958D7638C34A04AB914ABB23808350', 'scmSystem', '', 'wangan', '2017-05-04 20:51:54');
INSERT INTO `sys_log` VALUES ('9DC3C5885CE0422DA5896AC8B215D4C1', 'list', '', 'wangan', '2017-05-04 21:46:20');
INSERT INTO `sys_log` VALUES ('9DD06985BFA2455DB67100C7F6E589BB', 'welcome', '', 'wangan', '2017-05-05 19:05:49');
INSERT INTO `sys_log` VALUES ('9DD1BF2430BB466C81B25EBC3A7D53C9', 'scmSystem', '', 'wangan', '2017-05-04 21:07:10');
INSERT INTO `sys_log` VALUES ('9DD70394242A450CB6D543C142005A98', 'scmSystem', '', 'wangan', '2017-04-27 16:56:08');
INSERT INTO `sys_log` VALUES ('9DF4CCC4F83B4B2FBEC2CC1738D55999', 'list', '', 'wangan', '2017-05-04 21:42:49');
INSERT INTO `sys_log` VALUES ('9E316DC4CFE3422781A97053ED950FFA', 'menuTree', '[time:1493273498457]', 'wangan', '2017-04-27 14:11:39');
INSERT INTO `sys_log` VALUES ('9E3F9302032748679AEB23B13A2C4211', 'menuDetail', '[menuId:9584BB3C0395456A82390A5F900F9D3A],[menuType:2]', 'wangan', '2017-04-27 16:56:15');
INSERT INTO `sys_log` VALUES ('9E55ACFADE174EE382B8FD4EE7EB283A', 'listUser', '', 'wangan', '2017-05-06 14:55:10');
INSERT INTO `sys_log` VALUES ('9E908E3E9BAD44189CD31D7391A315A0', 'welcome', '', 'wangan', '2017-04-27 14:10:39');
INSERT INTO `sys_log` VALUES ('9E9A3A928939453088251BFA75198916', 'menuTree', '[time:1493282346462]', 'wangan', '2017-04-27 16:39:07');
INSERT INTO `sys_log` VALUES ('9EC2120A998C4A818EF22841A387363A', 'menuTree', '[time:1511341421222]', 'wangan', '2017-11-22 17:03:41');
INSERT INTO `sys_log` VALUES ('9EFFE43324FB441395A03C8C4435E47C', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:12:05');
INSERT INTO `sys_log` VALUES ('9F7FFB5C3CC4403B807CD5AB958DE05E', 'toAddRoleView', '', 'wangan', '2017-05-04 22:02:04');
INSERT INTO `sys_log` VALUES ('9FA057AB12DE4188A1536642F074B94C', 'menuTree', '[time:1493278694223]', 'wangan', '2017-04-27 15:38:14');
INSERT INTO `sys_log` VALUES ('A0889BDDA5ED48B282657B1BF5222B71', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('A098DCCA74A348DCAF1017F186292903', 'welcome', '', 'wangan', '2017-05-06 09:18:58');
INSERT INTO `sys_log` VALUES ('A0B8BB4F07704491BC2F9EB2A3452D94', 'menuDetail', '[menuId:9584BB3C0395456A82390A5F900F9D3A],[menuType:2]', 'wangan', '2017-04-27 17:02:37');
INSERT INTO `sys_log` VALUES ('A0C461F4E57048508E36ECC605EB8CEF', 'welcome', '', 'wangan', '2017-05-05 19:04:38');
INSERT INTO `sys_log` VALUES ('A0FFE28BA01E4EE89694E9FECDFA61D8', 'welcome', '', 'wangan', '2017-04-27 15:39:38');
INSERT INTO `sys_log` VALUES ('A1088FFAF68C4466A5158D05E8CBFED2', 'error', '', 'java', '2017-11-22 16:11:35');
INSERT INTO `sys_log` VALUES ('A135B29FA3FC4BFCA7D971148AA930F2', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:59:11');
INSERT INTO `sys_log` VALUES ('A1D49EC310194E879FA78084D5AF44C1', 'list', '', 'wangan', '2017-05-04 22:05:53');
INSERT INTO `sys_log` VALUES ('A1F0A831DA484B92BE8B93D41A3BEA83', 'list', '', 'wangan', '2017-05-04 20:39:20');
INSERT INTO `sys_log` VALUES ('A2160C8AC4DE4B078C6ABA3087B921BD', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493801735206]', 'wangan', '2017-05-03 16:55:35');
INSERT INTO `sys_log` VALUES ('A21A5BC21C434007B1023ADA2B9F5C2A', 'menuDetail', '[menuId:9F9BB192B89E402C98E143E69DFAF7AA],[menuType:2]', 'wangan', '2017-05-04 19:48:07');
INSERT INTO `sys_log` VALUES ('A28BFA049D5E4766B2CB3D537E19F007', 'menuTree', '[time:1493283490214]', 'wangan', '2017-04-27 16:58:10');
INSERT INTO `sys_log` VALUES ('A2D4A7F790304CFE8A1D3B2509E64956', 'menuTree', '[time:1493900284489]', 'wangan', '2017-05-04 20:18:04');
INSERT INTO `sys_log` VALUES ('A31A8C99715D420180CEF54C56086AC1', 'addMenu', '[time:1493273497825]', 'wangan', '2017-04-27 14:11:38');
INSERT INTO `sys_log` VALUES ('A3439F03191744B7A1C3212E5BC665D5', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:09:55');
INSERT INTO `sys_log` VALUES ('A348121DD3A8417EBAEB0F28B0C91360', 'deleteMenu', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 16:58:13');
INSERT INTO `sys_log` VALUES ('A3BFADBA610741D1BDDCC1E37D2A74C7', 'menuTree', '[time:1493272971135]', 'wangan', '2017-04-27 14:02:51');
INSERT INTO `sys_log` VALUES ('A42F98E2B1DB416BAF90134E56107091', 'menuTree', '[time:1493900382402]', 'wangan', '2017-05-04 20:19:42');
INSERT INTO `sys_log` VALUES ('A4461655AA3D42FB99B47BE2D59A00EA', 'menuTree', '[time:1493264811762]', 'wangan', '2017-04-27 11:46:52');
INSERT INTO `sys_log` VALUES ('A481E03D8DC24419BB98F63B645C1F39', 'welcome', '', 'wangan', '2017-04-28 17:06:36');
INSERT INTO `sys_log` VALUES ('A4ADAD839EDC43D5979BDD0561DEC537', 'welcome', '', 'wangan', '2017-05-04 20:47:24');
INSERT INTO `sys_log` VALUES ('A4CCEE0FD197496FB0E9AF22830C837D', 'toEditUserView', '[id:9E304DAFFC4B40788477A61D1D99B510]', 'wangan', '2017-05-02 22:19:43');
INSERT INTO `sys_log` VALUES ('A4D59F7525FD450F8CC57087E711F468', 'toEditPage', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:50:09');
INSERT INTO `sys_log` VALUES ('A54661B986D748C78A6F2C651F8BA804', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-02 22:17:38');
INSERT INTO `sys_log` VALUES ('A560E28A30DE4E3395A64516EC8E338B', 'listLog', '', 'wangan', '2017-04-26 17:47:40');
INSERT INTO `sys_log` VALUES ('A56FAA3F4B524AF8A5450E3021DC33C9', 'welcome', '', 'wangan', '2017-05-04 19:55:03');
INSERT INTO `sys_log` VALUES ('A5FA232F51BB4E8AA68919A7E21B026B', 'toAdd', '', 'wangan', '2017-05-04 20:09:19');
INSERT INTO `sys_log` VALUES ('A602E6674DD74695BEE7213FC50EEA35', 'welcome', '', 'wangan', '2017-05-04 20:18:04');
INSERT INTO `sys_log` VALUES ('A6BD0384F9804B889348E4FA763F6007', 'listUser', '', 'wangan', '2017-05-04 19:50:12');
INSERT INTO `sys_log` VALUES ('A6F15A3E5DF64040A86C0154740BB76D', 'scmSystem', '', 'wangan', '2017-05-04 20:55:19');
INSERT INTO `sys_log` VALUES ('A6F76D80584246789AA91527F441132D', 'listUser', '[account:]', 'wangan', '2017-05-04 22:02:10');
INSERT INTO `sys_log` VALUES ('A717D4F01D2F45DFBA133925781D8EB9', 'listLog', '[beginDate:2017-04-04],[endDate:2017-05-02],[userAccount:]', 'wangan', '2017-05-04 22:03:29');
INSERT INTO `sys_log` VALUES ('A71952FBEFC34E18A1E3B42F44A7D6C6', 'toMenuTreeView', '', 'wangan', '2017-04-27 17:02:32');
INSERT INTO `sys_log` VALUES ('A72C6F0921754BA984BC7CC43D3E2E0D', 'list', '', 'wangan', '2017-05-02 22:23:44');
INSERT INTO `sys_log` VALUES ('A74699BA1E88494F9F4A6DD2760354EE', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 14:15:13');
INSERT INTO `sys_log` VALUES ('A761A27F63614DEB82E0C2607F8CB16D', 'login', '', 'wangan', '2017-05-04 19:54:41');
INSERT INTO `sys_log` VALUES ('A78ADF89EC80444C8E7F00471BA73840', 'deleteAction', '[actionId:5CAE86444B104930B8668296FED1392C],[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 16:53:29');
INSERT INTO `sys_log` VALUES ('A80D5F0F017441DF9488E17AA2B5E254', 'toAdd', '', 'wangan', '2017-05-04 22:08:29');
INSERT INTO `sys_log` VALUES ('A8130E252F454B6C913F4798873AB2AD', 'list', '[startDate:2017-04-03],[endDate:2017-05-05],[supplier.supplierType.id:],[supplier.id:],[tradeType:77]', 'wangan', '2017-05-04 20:45:59');
INSERT INTO `sys_log` VALUES ('A8C3F63FE29945648710F32A1B414DBE', 'menuTree', '[time:1493283375073]', 'wangan', '2017-04-27 16:56:15');
INSERT INTO `sys_log` VALUES ('A8DFDF92FF444DF7BB6C64BD7DA1E54C', 'login', '[time:1493199964314]', NULL, '2017-04-26 17:46:04');
INSERT INTO `sys_log` VALUES ('A8E1ADD1EF614F129E9F2B3B2080836E', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('A8EF376D29784CE8BB2C10CB5BAD4ADA', 'menuTree', '[time:1493282950118]', 'wangan', '2017-04-27 16:49:10');
INSERT INTO `sys_log` VALUES ('AA1E82E9DB064221BA5A34AA65FE45DE', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493898656181]', 'wangan', '2017-05-04 19:50:56');
INSERT INTO `sys_log` VALUES ('AA3425761505479EA21D3BB409D41274', 'getVCode', '', NULL, '2017-04-27 10:36:40');
INSERT INTO `sys_log` VALUES ('AA4AEAD5CB8D4925A63525F4503B145E', 'listEmployee', '', 'wangan', '2017-05-04 22:05:06');
INSERT INTO `sys_log` VALUES ('AA5D4F3C94064E0BB361840239110C7C', 'menuDetail', '[menuId:root],[refreshTree:true]', 'wangan', '2017-04-27 16:46:49');
INSERT INTO `sys_log` VALUES ('AADB59FC707741BCA626B8978C4A967A', 'scmSystem', '', 'wangan', '2017-05-04 08:41:10');
INSERT INTO `sys_log` VALUES ('AB19626A7DFA49F6B85E21F1078E93DE', 'menuDetail', '[menuId:7812E5294DC6406D8229D384F2D538AA],[menuType:2]', 'wangan', '2017-05-04 22:01:18');
INSERT INTO `sys_log` VALUES ('AB349902BCE24E2792643DA4BF04E01A', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:09:28');
INSERT INTO `sys_log` VALUES ('AB7C3615718149658FFF5C29C4FC9E5F', 'welcome', '', 'wangan', '2017-05-04 20:18:02');
INSERT INTO `sys_log` VALUES ('AB89BEB8733A4783BA91A5991F9D26B7', 'toEditEmpView', '[id:1D22C965DE3F432B8E484C59AF477303]', 'wangan', '2017-05-02 22:22:18');
INSERT INTO `sys_log` VALUES ('ABA1BA16F6CE4AEDA8002F7F67B4AB26', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 15:01:05');
INSERT INTO `sys_log` VALUES ('ABCE4773C725449485E71FDE2C167971', 'toEditUserView', '[id:9E304DAFFC4B40788477A61D1D99B510]', 'wangan', '2017-05-04 19:50:02');
INSERT INTO `sys_log` VALUES ('ABE2B6454A97484395AEE983B43B597B', 'menuTree', '[time:1494034395154]', 'wangan', '2017-05-06 09:33:15');
INSERT INTO `sys_log` VALUES ('ABE778A958DB40A8B2CDCF60C847EF99', 'login', '', NULL, '2017-04-27 10:35:43');
INSERT INTO `sys_log` VALUES ('ABE896AEF4CF4D64AD05D78227E00FBA', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 22:07:07');
INSERT INTO `sys_log` VALUES ('AC4194E37E084C4C870450C2DF6232ED', 'login', '[time:1493260878879]', NULL, '2017-04-27 10:41:19');
INSERT INTO `sys_log` VALUES ('AC4226337A38497B8A47E079C320BDCD', 'list', '', 'wangan', '2017-05-02 22:23:46');
INSERT INTO `sys_log` VALUES ('AC48B8EFC9E74041908A13CE3232BABD', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:47:58');
INSERT INTO `sys_log` VALUES ('AC5ECFBD2DE34478913C9735E2E53A8F', 'login', '', 'wangan', '2017-05-04 20:16:05');
INSERT INTO `sys_log` VALUES ('AC828C62874E4BEA890DD94E53AE8DC0', 'menuTree', '[time:1511338413645]', 'wangan', '2017-11-22 16:13:34');
INSERT INTO `sys_log` VALUES ('AC9517306CED4458AE96C40441BE541F', 'menuTree', '[time:1493898448452]', 'wangan', '2017-05-04 19:47:28');
INSERT INTO `sys_log` VALUES ('AD14B22F456F48608C0B0D3EA78C52E6', 'list', '', 'wangan', '2017-05-04 20:45:37');
INSERT INTO `sys_log` VALUES ('AD46ADA058754B5BA6C685D4200DC92A', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493855550502]', 'wangan', '2017-05-04 07:52:31');
INSERT INTO `sys_log` VALUES ('AD58077FBB6F4A74A977533F6D9460BD', 'menuTree', '[time:1493282768806]', 'wangan', '2017-04-27 16:46:09');
INSERT INTO `sys_log` VALUES ('AD594B821EBB4DF6A79AD30D97003303', 'welcome', '', 'wangan', '2017-05-04 20:09:41');
INSERT INTO `sys_log` VALUES ('AD9A2AF05C7A4992884DB0D4C8EE5089', 'scmSystem', '', 'jishu', '2017-05-06 16:35:43');
INSERT INTO `sys_log` VALUES ('ADBD56DF94F041BEA415F293A7B91C2A', 'listLog', '[beginDate:2017-02-01],[endDate:2017-05-01],[userAccount:],[page.pageIndex:3]', 'wangan', '2017-05-02 22:21:40');
INSERT INTO `sys_log` VALUES ('AE149050139D46978E0CAA7AEAAC628D', 'login', '', 'wangan', '2017-05-04 21:10:55');
INSERT INTO `sys_log` VALUES ('AE2E1C24792A466EAF03ABD12C2EBE80', 'menuTree', '[time:1493712775709]', 'wangan', '2017-05-02 16:12:56');
INSERT INTO `sys_log` VALUES ('AE7D90C63C164215AC416C06009A961D', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:31:37');
INSERT INTO `sys_log` VALUES ('AEC1168A01A24E27899286A2AC6865DB', 'login', '', 'wangan', '2017-05-04 20:53:13');
INSERT INTO `sys_log` VALUES ('AEC350B062BC424282267479E304B288', 'menuTree', '[time:1493282765048]', 'wangan', '2017-04-27 16:46:05');
INSERT INTO `sys_log` VALUES ('AF5A19EC86D5451EB74FF795206C7D44', 'editRole', '[name:店长],[id:82888F565F5747D3B41B9FBB94ED408A],[remark:店长],[status:1]', 'wangan', '2017-05-04 19:48:57');
INSERT INTO `sys_log` VALUES ('AF85AE4575E347B2877589A2490E822E', 'list', '', 'wangan', '2017-05-04 22:08:31');
INSERT INTO `sys_log` VALUES ('AFE68444098D4816A2C9FBFA7B1B34CE', 'toEdit', '[customerId:C_002]', 'wangan', '2017-05-04 22:06:16');
INSERT INTO `sys_log` VALUES ('B01AA2B5AB344BD0BE28984B22112357', 'login', '', 'wangan', '2017-05-04 20:01:45');
INSERT INTO `sys_log` VALUES ('B052D4B369674B41B88AF7879871E977', 'scmSystem', '', 'wangan', '2017-05-04 20:53:09');
INSERT INTO `sys_log` VALUES ('B06B0F5BD3BF4909B123B8DB85BE57B5', 'menuTree', '[time:1493902389100]', 'wangan', '2017-05-04 20:53:09');
INSERT INTO `sys_log` VALUES ('B097CF7F05474F5C8E30F56D6AF854FD', 'toPrivilegeView', '', 'wangan', '2017-05-04 07:52:30');
INSERT INTO `sys_log` VALUES ('B0FEE4EE5DAB4072A08241A7E818D304', 'toEditMenuView', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07]', 'wangan', '2017-05-04 19:46:59');
INSERT INTO `sys_log` VALUES ('B1010E6BF4AC46C2B12C5D98170338D6', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1],[refreshTree:true]', 'wangan', '2017-04-27 14:16:50');
INSERT INTO `sys_log` VALUES ('B1374E04577E4BDAB906CE1D349B73CD', 'welcome', '', 'wangan', '2017-05-04 19:58:49');
INSERT INTO `sys_log` VALUES ('B16725D7C82B4AB7A09E1D8EDA3FA6A7', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1493856039841]', 'wangan', '2017-05-04 08:00:40');
INSERT INTO `sys_log` VALUES ('B188A7910BCF46C1A8A3B0D5FEC9A841', 'menuTree', '[time:1493275766079]', 'wangan', '2017-04-27 14:49:26');
INSERT INTO `sys_log` VALUES ('B1F0C06AFD184E6AA71EF7265A1BB0B2', 'listLog', '', 'wangan', '2017-05-06 10:32:29');
INSERT INTO `sys_log` VALUES ('B20F34E671CD47209988B9D6A0B7AEDE', 'menuTree', '[time:1493277020503]', 'wangan', '2017-04-27 15:10:21');
INSERT INTO `sys_log` VALUES ('B2147D1422D34415B777001D63A3C737', 'menuTree', '[time:1494059743612]', 'jishu', '2017-05-06 16:35:44');
INSERT INTO `sys_log` VALUES ('B27D3D0984644ADC810D3B421F593368', 'menuTree', '[time:1493899129316]', 'wangan', '2017-05-04 19:58:49');
INSERT INTO `sys_log` VALUES ('B2C3A93320FC4B7B97D3B83456430514', 'deleteMenu', '[menuId:9584BB3C0395456A82390A5F900F9D3A]', 'wangan', '2017-04-27 17:02:40');
INSERT INTO `sys_log` VALUES ('B2FD7A0D3832496CA75CECD014A973D8', 'listEmployee', '[name:李白]', 'wangan', '2017-05-04 19:53:13');
INSERT INTO `sys_log` VALUES ('B310FAC9E97B49C69B76E56736A29943', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-04-27 14:03:18');
INSERT INTO `sys_log` VALUES ('B3267B69299A44508789DD2532F1FB66', 'menuTree', '[time:1493370395785]', 'wangan', '2017-04-28 17:06:36');
INSERT INTO `sys_log` VALUES ('B328EDBDDC5347AAAA55B1A79F19FA7B', 'welcome', '', 'wangan', '2017-04-27 10:41:19');
INSERT INTO `sys_log` VALUES ('B3AF04D1305B4EC396A7C7B6FD21AD8C', 'login', '', 'wangan', '2017-05-04 20:18:25');
INSERT INTO `sys_log` VALUES ('B3F11D0D6968451AABB62170E26011F0', 'getVCode', '', NULL, '2017-04-27 10:35:44');
INSERT INTO `sys_log` VALUES ('B40B58F5848844C8858764D1AF911D49', 'menuTree', '[time:1493201399799]', 'wangan', '2017-04-26 18:10:00');
INSERT INTO `sys_log` VALUES ('B44691315C5D45D8BE3707C8C9FE8480', 'menuDetail', '[menuId:7952ADCE8BE94659903BF32E3737A322],[menuType:2]', 'wangan', '2017-05-04 19:47:21');
INSERT INTO `sys_log` VALUES ('B455F56773164731B86AF61F4804B6D5', 'welcome', '', 'wangan', '2017-04-27 10:52:33');
INSERT INTO `sys_log` VALUES ('B456D13DCC11401FA63984531005473E', 'menuTree', '[time:1493282347443]', 'wangan', '2017-04-27 16:39:07');
INSERT INTO `sys_log` VALUES ('B45767646E1A4AE7BEFC0F260FC3D117', 'list', '', 'wangan', '2017-05-04 22:05:57');
INSERT INTO `sys_log` VALUES ('B4A6340CE871436CA0EF7252E2E341A8', 'menuDetail', '[menuId:7952ADCE8BE94659903BF32E3737A322],[menuType:2]', 'wangan', '2017-05-04 22:00:48');
INSERT INTO `sys_log` VALUES ('B505528DB38F4B46BFE10B487E92332C', 'welcome', '', 'jishu', '2017-05-06 16:41:00');
INSERT INTO `sys_log` VALUES ('B5310AC9A9C9438ABA3060C40DEC8DC8', 'menuTree', '[time:1494060060500]', 'jishu', '2017-05-06 16:41:01');
INSERT INTO `sys_log` VALUES ('B55A1C5BAB0A4F3E9E09303DDB6A3250', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:57:54');
INSERT INTO `sys_log` VALUES ('B584D9680E0C4BA8BEC8F93FB0F62F8D', 'loadPrivilege', '[roleId:030B18622DFA478C88129899D9E56ED8],[ts:1493855552499]', 'wangan', '2017-05-04 07:52:33');
INSERT INTO `sys_log` VALUES ('B5C70B3A01E64C06AB00E9A65770918B', 'list', '', 'wangan', '2017-05-04 22:05:10');
INSERT INTO `sys_log` VALUES ('B5FFF16A56E841799A27EF63C1B82354', 'menuTree', '[time:1493899781159]', 'wangan', '2017-05-04 20:09:41');
INSERT INTO `sys_log` VALUES ('B63C1CEDDA3846D798C4D38395081F6F', 'loadTree', '[ts:1493906556948]', 'wangan', '2017-05-04 22:02:37');
INSERT INTO `sys_log` VALUES ('B6DC8F75CD8644188B95DF7DA4B5D109', 'list', '', 'wangan', '2017-04-26 18:30:01');
INSERT INTO `sys_log` VALUES ('B6FDF9A7FA3648EDA15BA45550025A6E', 'toAdd', '', 'wangan', '2017-05-04 22:05:48');
INSERT INTO `sys_log` VALUES ('B71E9E70F19E4661A5B0811A76E448C2', 'getVCode', '', NULL, '2017-04-27 10:19:35');
INSERT INTO `sys_log` VALUES ('B73C05A2619E47179E19CDE462FD2DAD', 'menuTree', '[time:1494054264006]', 'jishu', '2017-05-06 15:04:24');
INSERT INTO `sys_log` VALUES ('B7B34805FFA34D3C8AD24FE410FAD5A5', 'getVCode', '', NULL, '2017-04-26 17:45:41');
INSERT INTO `sys_log` VALUES ('B8022C163BB045D1B4B97B3C635C3B44', 'toAddDeptView', '', 'wangan', '2017-05-02 22:22:08');
INSERT INTO `sys_log` VALUES ('B828B8F8D64C4FBD9074A38100F310F0', 'menuDetail', '[menuId:7952ADCE8BE94659903BF32E3737A322],[menuType:2]', 'wangan', '2017-05-04 19:47:12');
INSERT INTO `sys_log` VALUES ('B85237DE272545E8A81B3D2AD3FE8547', 'roleList', '', 'wangan', '2017-04-26 18:24:29');
INSERT INTO `sys_log` VALUES ('B8708B89FD49464A9B6C2DCD5DBBF6F0', 'scmSystem', '', 'java', '2017-05-06 16:39:53');
INSERT INTO `sys_log` VALUES ('B87F53263CEC4E2DACFAA1C6ADB3EE4B', 'menuTree', '[time:1494059614036]', 'jishu', '2017-05-06 16:33:34');
INSERT INTO `sys_log` VALUES ('B899AF6C0D1040ED92D5F1C076063942', 'menuTree', '[time:1494055075081]', 'jishu', '2017-05-06 15:17:55');
INSERT INTO `sys_log` VALUES ('B8C21BEBE04B4B40ACC7C4FDF60BCFFF', 'menuTree', '[time:1494059675817]', 'jishu', '2017-05-06 16:34:36');
INSERT INTO `sys_log` VALUES ('B8D4308DABBB4789AC6A8050C00D616F', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('B8D94E6C19CD4EA6BC1FA2826B02111E', 'error', '', 'wangan', '2017-04-26 18:10:48');
INSERT INTO `sys_log` VALUES ('B8DF05450DC64363B834B41AFB7C7676', 'welcome', '', 'java', '2017-05-06 16:40:41');
INSERT INTO `sys_log` VALUES ('B8E36CB081F945F691432505E5176780', 'scmSystem', '', 'jishu', '2017-05-06 15:54:55');
INSERT INTO `sys_log` VALUES ('B8E8444557F7486EA9E8E9D4803E9D20', 'listEmployee', '', 'wangan', '2017-05-02 22:22:23');
INSERT INTO `sys_log` VALUES ('B9053FBD128F4B7F9B404031A12263D5', 'list', '', 'wangan', '2017-05-04 21:23:53');
INSERT INTO `sys_log` VALUES ('B913DAB83BDB4ED9BEE5851B10FA0AE5', 'listLog', '[page.pageIndex:2]', 'wangan', '2017-04-26 17:57:57');
INSERT INTO `sys_log` VALUES ('B9260AB34A0E4B9E938406FC3CA471F6', 'listUser', '', 'wangan', '2017-05-04 19:49:42');
INSERT INTO `sys_log` VALUES ('B958B6A1F7464BA6A73E7CB520AE874B', 'menuTree', '[time:1493283757120]', 'wangan', '2017-04-27 17:02:37');
INSERT INTO `sys_log` VALUES ('B95A2C5AA6994074BBE44FCA48F28CB3', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1494056342684]', 'jishu', '2017-05-06 15:39:03');
INSERT INTO `sys_log` VALUES ('B975FAE69C2D4A058028259FE53814E7', 'welcome', '', 'wangan', '2017-04-27 16:46:05');
INSERT INTO `sys_log` VALUES ('B996DF3D62D240179ECA9A88436B1CCA', 'listEmployee', '', 'wangan', '2017-05-04 22:04:55');
INSERT INTO `sys_log` VALUES ('B9BCA26B74E0498C96400B1A0DB5890D', 'menuTree', '[time:1493282367030]', 'wangan', '2017-04-27 16:39:27');
INSERT INTO `sys_log` VALUES ('B9F5E5973E42480B9B2582956451C102', 'menuTree', '[time:1493898472502]', 'wangan', '2017-05-04 19:47:53');
INSERT INTO `sys_log` VALUES ('B9F9E5BE9FBC4054BA66B02B7AAE4023', 'menuTree', '[time:1493283754090]', 'wangan', '2017-04-27 17:02:34');
INSERT INTO `sys_log` VALUES ('BAD0FD65859E4930B37191816314A598', 'menuTree', '[time:1493275766769]', 'wangan', '2017-04-27 14:49:27');
INSERT INTO `sys_log` VALUES ('BB47EDF7D340494E880719357A28F8D3', 'listLog', '', 'wangan', '2017-05-04 19:51:16');
INSERT INTO `sys_log` VALUES ('BB75D8EB6DEC4F758D31B91B7D6FD4CB', 'roleList', '', 'wangan', '2017-05-02 22:19:18');
INSERT INTO `sys_log` VALUES ('BBAB68CE71B544C89506DC57E0FE2FF5', 'list', '', 'wangan', '2017-05-04 19:54:35');
INSERT INTO `sys_log` VALUES ('BBE3FB44E07F4D99BCA2784B53AECF78', 'roleList', '[name:dian],[status:1],[_status:on、on、on]', 'wangan', '2017-05-04 22:01:45');
INSERT INTO `sys_log` VALUES ('BC0374348A7E4558869036B13A94067D', 'list', '[startDate:2017-04-03],[endDate:2017-05-02],[supplier.supplierType.id:],[supplier.id:],[mobileType.brand:],[mobileType.id:]', 'wangan', '2017-05-04 22:09:31');
INSERT INTO `sys_log` VALUES ('BC30566FE47048EA973AB11CC4C214FC', 'getVCode', '', NULL, '2017-04-27 10:38:05');
INSERT INTO `sys_log` VALUES ('BC53D89B1EDA4231A4BE9CEE931B97B9', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 14:16:27');
INSERT INTO `sys_log` VALUES ('BC6331902D0E42669EF3CBA98483DE10', 'menuTree', '[time:1494052418470]', 'wangan', '2017-05-06 14:33:38');
INSERT INTO `sys_log` VALUES ('BC6D334238A04F8E8EEE695B8A1CD982', 'login', '', 'java', '2017-11-22 16:11:46');
INSERT INTO `sys_log` VALUES ('BC761D20E02F4B1191299D8D15688DEB', 'login', '', 'wangan', '2017-05-04 20:51:59');
INSERT INTO `sys_log` VALUES ('BC78E4A1BC92422C9A82CC8ACE7FC3EC', 'menuTree', '[time:1493276174446]', 'wangan', '2017-04-27 14:56:14');
INSERT INTO `sys_log` VALUES ('BC9038AF07384AC49965D24E38781149', 'welcome', '', 'wangan', '2017-04-27 17:02:29');
INSERT INTO `sys_log` VALUES ('BCB1ABA1D7234D3F9195037DFC38CAAF', 'scmSystem', '', 'wangan', '2017-04-27 16:58:05');
INSERT INTO `sys_log` VALUES ('BCCCF469AF134E0495C0F3C458C020EE', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 22:00:45');
INSERT INTO `sys_log` VALUES ('BCE3CF3F38BA4678A39D7E7CEECC67CD', 'login', '', NULL, '2017-04-26 18:18:47');
INSERT INTO `sys_log` VALUES ('BD5409ED2B764016BAC9C048D87A265B', 'scmSystem', '', 'jishu', '2017-05-06 14:52:15');
INSERT INTO `sys_log` VALUES ('BD6FE5FD199145DF8DA7E4FD752CD8BD', 'login', '[time:1493201936241]', NULL, '2017-04-26 18:18:56');
INSERT INTO `sys_log` VALUES ('BD938339F0D24F2696CF7F260D40AC7E', 'menuTree', '[time:1493282972471]', 'wangan', '2017-04-27 16:49:33');
INSERT INTO `sys_log` VALUES ('BDE7BBD9385F408986F668FF7690B771', 'listUser', '[account:]', 'wangan', '2017-05-04 22:02:20');
INSERT INTO `sys_log` VALUES ('BDF3E55FEB06414BAF2800FFE1E5EA3F', 'listUser', '', 'wangan', '2017-04-26 17:38:18');
INSERT INTO `sys_log` VALUES ('BE75669DA3A64F998EABDCE74475407C', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 15:10:20');
INSERT INTO `sys_log` VALUES ('BE7D76F7500543D69C4DE19C6AF19C79', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:46:31');
INSERT INTO `sys_log` VALUES ('BEB22F0FB9B14D2EABC044697BF49682', 'toEditUserView', '[id:84D1E33948DA486D85B08C21AAC7BA59]', 'wangan', '2017-05-04 19:50:14');
INSERT INTO `sys_log` VALUES ('BEDE3480B9884E1CA5F6BA17A8A8DCF0', 'roleList', '', 'wangan', '2017-05-06 14:54:14');
INSERT INTO `sys_log` VALUES ('BEF22249B6304E84B7717588717A0CA5', 'scmSystem', '', 'wangan', '2017-05-04 19:45:57');
INSERT INTO `sys_log` VALUES ('BF3EC213122E40F785B77BFA303A32E5', 'menuTree', '[time:1493734658400]', 'wangan', '2017-05-02 22:17:38');
INSERT INTO `sys_log` VALUES ('BF536DC0BA734E939C5FF01B6E8A17A6', 'login', '', NULL, '2017-04-27 10:31:18');
INSERT INTO `sys_log` VALUES ('BF5388B92B0F4967BB4802205B191F9F', 'login', '[time:1493202793592]', NULL, '2017-04-26 18:33:14');
INSERT INTO `sys_log` VALUES ('BF7710F74B264AA1A676927F15CDCAAF', 'getVCode', '', NULL, '2017-04-27 10:26:27');
INSERT INTO `sys_log` VALUES ('BF7A73F26F0B47038789935BB0101EEE', 'scmSystem', '', 'wangan', '2017-05-04 07:52:21');
INSERT INTO `sys_log` VALUES ('BF8D6B1FB3E54035AA5E1C16E6C541C0', 'listDepartment', '', 'wangan', '2017-05-06 14:33:51');
INSERT INTO `sys_log` VALUES ('BFA4979FFAE24E86B31647F37891AF96', 'menuDetail', '[menuId:root],[menuType:1]', 'java', '2017-05-06 15:01:00');
INSERT INTO `sys_log` VALUES ('BFA6E54BCD0A42CE8D8158B40CC7E627', 'menuDetail', '[menuId:root],[menuType:1]', 'jishu', '2017-05-06 16:33:47');
INSERT INTO `sys_log` VALUES ('BFD9B8D9890F43FA8F9023F44CF358DC', 'toMenuTreeView', '', 'wangan', '2017-04-27 14:02:50');
INSERT INTO `sys_log` VALUES ('C05EE46FF9EB4675850E1F710660B5A9', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 19:58:58');
INSERT INTO `sys_log` VALUES ('C074518FCD454FB9A525A07B70F47C2A', 'welcome', '', 'wangan', '2017-05-04 20:41:47');
INSERT INTO `sys_log` VALUES ('C07A0379616647F09BB8DB16755039B6', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-02 22:18:05');
INSERT INTO `sys_log` VALUES ('C0B3984964564EE6829342F70EF5715A', 'toEdit', '', 'wangan', '2017-05-04 21:31:36');
INSERT INTO `sys_log` VALUES ('C0E2EAFEB4A5430585FDE9B0F24D57F5', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:47:11');
INSERT INTO `sys_log` VALUES ('C1278AFF42144B88A2D67032EE5D8035', 'toEditRoleView', '[roleId:030B18622DFA478C88129899D9E56ED8]', 'wangan', '2017-05-04 22:01:53');
INSERT INTO `sys_log` VALUES ('C15C82C6A20045FFA96F502E6D6374BF', 'login', '[time:1493200648063]', NULL, '2017-04-26 17:57:28');
INSERT INTO `sys_log` VALUES ('C183B873B7614431B7A3571BDDBC6ED1', 'menuTree', '[time:1493712778849]', 'wangan', '2017-05-02 16:12:59');
INSERT INTO `sys_log` VALUES ('C19FEE55BE9D4661A4F15261C69CD533', 'list', '[brand:荣耀],[name:]', 'wangan', '2017-05-04 22:08:10');
INSERT INTO `sys_log` VALUES ('C1DC08D1D8364606B83DF4EBDED30164', 'welcome', '', 'java', '2017-05-06 16:36:04');
INSERT INTO `sys_log` VALUES ('C1DD58034CC24CE9931401AFB6074B97', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1493801726787]', 'wangan', '2017-05-03 16:55:27');
INSERT INTO `sys_log` VALUES ('C1F0C318439B4FBD8476D0B9AB27971F', 'list', '', 'wangan', '2017-05-04 20:42:58');
INSERT INTO `sys_log` VALUES ('C21DD32635DB417A879190BE47D9261C', 'login', '', NULL, '2017-04-26 18:09:47');
INSERT INTO `sys_log` VALUES ('C250D8414CCF4461A09B84215C3FDC7F', 'toMenuTreeView', '', 'wangan', '2017-05-02 16:12:31');
INSERT INTO `sys_log` VALUES ('C28EAAFD7B154FD8A77F46521C157397', 'menuTree', '[time:1493201936856]', 'wangan', '2017-04-26 18:18:57');
INSERT INTO `sys_log` VALUES ('C2D8DF7BD7D84C1292C67CB786E2652E', 'listLog', '[beginDate:2017-05-01],[endDate:2017-05-04],[userAccount:],[page.pageIndex:4]', 'wangan', '2017-05-04 19:52:11');
INSERT INTO `sys_log` VALUES ('C2E0DEC359BC49A796726FD3F4D633CF', 'toMenuTreeView', '', 'wangan', '2017-04-27 16:58:07');
INSERT INTO `sys_log` VALUES ('C2EFDB7ACC4B4522ACB244EC139C7017', 'list', '', 'wangan', '2017-11-23 14:56:27');
INSERT INTO `sys_log` VALUES ('C3E9C5B254E1440CB6BA144C5F663D8F', 'toEditMenuView', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07]', 'wangan', '2017-05-02 22:18:01');
INSERT INTO `sys_log` VALUES ('C43DBD2B07DE42CDA4557085E3F69E55', 'welcome', '', 'wangan', '2017-05-04 19:54:53');
INSERT INTO `sys_log` VALUES ('C455A01644744FC59B85A65ED79CB207', 'menuTree', '[time:1493200648702]', 'wangan', '2017-04-26 17:57:29');
INSERT INTO `sys_log` VALUES ('C49315F8615648FB9C765936B07545F4', 'roleList', '', 'wangan', '2017-05-04 19:48:57');
INSERT INTO `sys_log` VALUES ('C4AA0E8E98FA4D75A526E9460CE8131D', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('C4C55D3D8FA74836A7E1E7E880E6C5DC', 'toEditDeptView', '[id:47DAF9B6E0F54A7FAC847F209719E913]', 'wangan', '2017-05-04 22:04:45');
INSERT INTO `sys_log` VALUES ('C59588ECFD7E44189BEFEE229F7F87D6', 'login', '', NULL, '2017-04-26 18:13:03');
INSERT INTO `sys_log` VALUES ('C617FA5BE8934433A91EAB57F2BF31D2', 'menuTree', '[time:1493898491783]', 'wangan', '2017-05-04 19:48:12');
INSERT INTO `sys_log` VALUES ('C6754612E45B44C1BEA86995BAA67204', 'welcome', '', 'wangan', '2017-04-28 17:29:06');
INSERT INTO `sys_log` VALUES ('C6848C041D464B238EEBF160DE1D050E', 'welcome', '', 'wangan', '2017-05-02 16:21:21');
INSERT INTO `sys_log` VALUES ('C6A3BF7AA2CF44F8A0D6DABEB10F2EF1', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-11-22 16:13:33');
INSERT INTO `sys_log` VALUES ('C71069EB0C0A4FFCA6A1B3036D13A8FD', 'roleList', '[name:CTO],[status:1],[_status:on、on、on]', 'wangan', '2017-05-02 22:18:45');
INSERT INTO `sys_log` VALUES ('C71B62E62AD4419697D346AD796B970B', 'login', '', 'wangan', '2017-05-04 20:31:37');
INSERT INTO `sys_log` VALUES ('C7462E3CAAC5411ABD433A5CDF211857', 'toAddMenuView', '[menuId:1A29CDD70FF14348BE8806CB56FEA77E]', 'wangan', '2017-05-02 22:18:15');
INSERT INTO `sys_log` VALUES ('C75FD93502F141A6AEB61F0FC73C2CD0', 'list', '', 'wangan', '2017-05-04 21:34:07');
INSERT INTO `sys_log` VALUES ('C76213A6A4C94F2692E3D5BD0FC70925', 'welcome', '', 'java', '2017-05-06 16:39:54');
INSERT INTO `sys_log` VALUES ('C77130E3618B4D4EAA418F5D69DEEDAD', 'welcome', '', 'wangan', '2017-05-02 16:11:43');
INSERT INTO `sys_log` VALUES ('C7CFC71F2C6647559C1CBC107817326C', 'menuTree', '[time:1493898469710]', 'wangan', '2017-05-04 19:47:50');
INSERT INTO `sys_log` VALUES ('C8037C2AF47443D083E617CF68C61E54', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('C85F205169C845E9B0EA7C9B6E748F1B', 'menuTree', '[time:1493898432292]', 'wangan', '2017-05-04 19:47:12');
INSERT INTO `sys_log` VALUES ('C895BFB1D55A43409B187EB0051C90C4', 'menuTree', '[time:1493900282443]', 'wangan', '2017-05-04 20:18:02');
INSERT INTO `sys_log` VALUES ('C8A853EE7F034641AB5D27ECC92F5213', 'list', '', 'wangan', '2017-05-04 20:47:26');
INSERT INTO `sys_log` VALUES ('C920EFBAD9BE4D28A14626D1E9588884', 'list', '[table:basic_config]', 'wangan', '2017-05-04 20:45:34');
INSERT INTO `sys_log` VALUES ('C93465D4C6784E5B8D3CEBD26E4FB23D', 'menuTree', '[time:1493900821457]', 'wangan', '2017-05-04 20:27:01');
INSERT INTO `sys_log` VALUES ('C9534579EACF4132ADCFC7E9D414CF0C', 'menuTree', '[time:1493906435387]', 'wangan', '2017-05-04 22:00:35');
INSERT INTO `sys_log` VALUES ('C95D456DD3C24EE59D45854B3AF260E8', 'toEdit', '[supplierTypeId:ST_001]', 'wangan', '2017-05-02 22:23:25');
INSERT INTO `sys_log` VALUES ('C95DDCCE08A545B78094B83AD717EA34', 'toModifyPasswdView', '', 'wangan', '2017-04-27 11:46:58');
INSERT INTO `sys_log` VALUES ('C982E706D47D485D8FD36D6C7B0FD545', 'welcome', '', 'wangan', '2017-04-26 18:10:46');
INSERT INTO `sys_log` VALUES ('C9AA47BF0C1E44848BEBB6716D70F8DA', 'login', '[time:1493982276507]', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('C9B82EAAE667460294F09591106CC712', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:03:17');
INSERT INTO `sys_log` VALUES ('CA1373E7F80C408285E1361D304EE6ED', 'list', '', 'wangan', '2017-05-04 19:58:52');
INSERT INTO `sys_log` VALUES ('CAEE81B83C094B68875F4001A2B205A3', 'menuTree', '[time:1493283752824]', 'wangan', '2017-04-27 17:02:33');
INSERT INTO `sys_log` VALUES ('CB1FB6D08E574B208D0642CD92DAF1AE', 'list', '[table:basic_config]', 'wangan', '2017-05-04 22:06:57');
INSERT INTO `sys_log` VALUES ('CB36A9528A184F3F93F18E6B99B16F9F', 'menuTree', '[time:1493734649162]', 'wangan', '2017-05-02 22:17:29');
INSERT INTO `sys_log` VALUES ('CB40B1FEC9C14867B23D5779E2767F52', 'menuTree', '[time:1493898902883]', 'wangan', '2017-05-04 19:55:03');
INSERT INTO `sys_log` VALUES ('CB43F857B0A443649DCD3C302E0C1046', 'loadPrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[ts:1494056344957]', 'jishu', '2017-05-06 15:39:05');
INSERT INTO `sys_log` VALUES ('CB51C868F1624AB3BC49413CC978A050', 'menuTree', '[time:1493734633680]', 'wangan', '2017-05-02 22:17:14');
INSERT INTO `sys_log` VALUES ('CB7E33ED91DE4B82B93A853A7BB41E0C', 'menuTree', '[time:1493283771423]', 'wangan', '2017-04-27 17:02:51');
INSERT INTO `sys_log` VALUES ('CBD1940974A744F7A926A435160F58E8', 'welcome', '', 'wangan', '2017-11-22 17:03:37');
INSERT INTO `sys_log` VALUES ('CBF30DF593D344818C0A26DB755064CF', 'list', '', 'wangan', '2017-05-04 22:07:58');
INSERT INTO `sys_log` VALUES ('CBFB9942E6C747C28C416FC2E6CF1097', 'menuTree', '[time:1493898452950]', 'wangan', '2017-05-04 19:47:33');
INSERT INTO `sys_log` VALUES ('CC2E869D35BD48E887AD32D078065FCB', 'welcome', '', 'jishu', '2017-05-06 15:29:53');
INSERT INTO `sys_log` VALUES ('CC527F5C762B4381B5DB0EF4D3BD36D8', 'list', '[startDate:2017-04-27],[endDate:2017-05-05],[supplier.supplierType.id:],[supplier.id:],[mobileType.brand:],[mobileType.id:]', 'wangan', '2017-05-04 20:45:13');
INSERT INTO `sys_log` VALUES ('CC589A99EC0F41E9B3BF5FEE8531D842', 'scmSystem', '', 'wangan', '2017-11-23 16:43:53');
INSERT INTO `sys_log` VALUES ('CC802290C0B340D9AE7994FDEF758B22', 'list', '', 'wangan', '2017-05-02 22:23:16');
INSERT INTO `sys_log` VALUES ('CC9EDB30E8F24D42AEF92073B163577B', 'loadPrivilege', '[roleId:FE3C747252B14163AC962623EFA4B850],[ts:1493855572099]', 'wangan', '2017-05-04 07:52:52');
INSERT INTO `sys_log` VALUES ('CCCBE69C60A94CD2AC81253534449715', 'error', '', 'wangan', '2017-05-04 22:10:56');
INSERT INTO `sys_log` VALUES ('CD0A8CA0BA4B440CBA2C8288EB14F926', 'menuTree', '[time:1494055854020]', 'jishu', '2017-05-06 15:30:54');
INSERT INTO `sys_log` VALUES ('CD1777A587B1466B830F5D2815DF4806', 'toEdit', '[mobileTypeId:hw-002]', 'wangan', '2017-05-04 21:34:09');
INSERT INTO `sys_log` VALUES ('CDB6FE99FE2D4EBD9DCF87A068B2FE3E', 'toAdd', '', 'wangan', '2017-05-04 20:18:25');
INSERT INTO `sys_log` VALUES ('CDBBF771B5DE4CB6B3878D3FA20D8300', 'scmSystem', '', 'wangan', '2017-04-27 15:24:23');
INSERT INTO `sys_log` VALUES ('CDEC29AF43B34FE3BB3A98A8475FC720', 'login', '', 'wangan', '2017-05-04 21:13:19');
INSERT INTO `sys_log` VALUES ('CE105153AEA34064AD421EA4D916FE34', 'welcome', '', 'wangan', '2017-05-04 19:45:57');
INSERT INTO `sys_log` VALUES ('CE24A32B17A34E43A030674698512F62', 'loadTree', '[ts:1494053364459]', 'wangan', '2017-05-06 14:49:24');
INSERT INTO `sys_log` VALUES ('CE7825D73D68453BBAF0AB7125AE187E', 'loadPrivilege', '[roleId:030B18622DFA478C88129899D9E56ED8],[ts:1493801705162]', 'wangan', '2017-05-03 16:55:05');
INSERT INTO `sys_log` VALUES ('CE8CCA615B084EE586817E14F9156BE7', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:2],[refreshTree:true]', 'wangan', '2017-04-27 14:11:38');
INSERT INTO `sys_log` VALUES ('CEC8C004C8D745209649FC8CB07ACE3D', 'listLog', '', 'wangan', '2017-04-26 18:13:18');
INSERT INTO `sys_log` VALUES ('CEF34C6DDF6541CF8FBBA1A9E64081F9', 'scmSystem', '', 'wangan', '2017-11-23 15:37:05');
INSERT INTO `sys_log` VALUES ('CF0D3D1154084FE6864F642D4A73152B', 'list', '', 'wangan', '2017-05-04 20:51:56');
INSERT INTO `sys_log` VALUES ('CF497C47637E424580A7EC8FBCF5CC37', 'toMenuTreeView', '', 'wangan', '2017-05-04 19:46:06');
INSERT INTO `sys_log` VALUES ('CF8EBA64F5E5429982B010F7139A5E4D', 'toEdit', '[mobileTypeId:hw002]', 'wangan', '2017-05-04 20:16:04');
INSERT INTO `sys_log` VALUES ('CF909E8522AA4B5FBEA245F147B1B146', 'login', '', NULL, '2017-04-27 10:51:57');
INSERT INTO `sys_log` VALUES ('CFB8365226CC40F9ACC3A23E5F16DDAD', 'login', '', 'wangan', '2017-05-04 21:16:46');
INSERT INTO `sys_log` VALUES ('D01B21534EFD46EBA07CB579A12662F3', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-02 22:17:53');
INSERT INTO `sys_log` VALUES ('D032EC3A2534452C91A8555E1708A701', 'toAdd', '', 'wangan', '2017-05-04 20:53:12');
INSERT INTO `sys_log` VALUES ('D09D70BB12AD45309D05B754E59395C4', 'welcome', '', 'jishu', '2017-05-06 15:04:24');
INSERT INTO `sys_log` VALUES ('D0A2C05B60E14D8F9A3B1D4326900452', 'toMenuTreeView', '', 'wangan', '2017-04-27 16:39:06');
INSERT INTO `sys_log` VALUES ('D0C9891A1EAF4A6BBF166869B1F8624A', 'list', '[startDate:2017-04-03],[endDate:2017-05-05],[show:导出Excel],[supplier.supplierType.id:],[supplier.id:],[tradeType:77]', 'wangan', '2017-05-04 20:46:03');
INSERT INTO `sys_log` VALUES ('D0EB4C5737C945C694709289710A9EEA', 'scmSystem', '', 'jishu', '2017-05-06 15:04:24');
INSERT INTO `sys_log` VALUES ('D147648125AE44948527112E3D4E5933', 'list', '[table:basic_brand]', 'wangan', '2017-05-04 22:06:32');
INSERT INTO `sys_log` VALUES ('D19BD8A4F737444DABA22E7763A27976', 'toAddMenuView', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07]', 'wangan', '2017-05-04 19:47:02');
INSERT INTO `sys_log` VALUES ('D1C2E045E3514A8AB6709FECDD9659F5', 'list', '', 'wangan', '2017-05-04 21:07:25');
INSERT INTO `sys_log` VALUES ('D2493A36516347F59A4CA8FA4BAF0BF1', 'list', '', 'wangan', '2017-05-04 22:11:06');
INSERT INTO `sys_log` VALUES ('D275B544B2984BA1BA4A0D38F9DBF8B4', 'menuTree', '[time:1493283209742]', 'wangan', '2017-04-27 16:53:30');
INSERT INTO `sys_log` VALUES ('D2953A382B8347579E12628D212D033F', 'moveDown', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuParentId:root],[menuSortOrder:7]', 'wangan', '2017-04-27 13:52:48');
INSERT INTO `sys_log` VALUES ('D2A5C6620AA54E9D85E7324B40AB2078', 'listDepartment', '', 'wangan', '2017-11-23 16:44:22');
INSERT INTO `sys_log` VALUES ('D2ED1772B90042D1A2F64548ABEC196B', 'menuTree', '[time:1493272331116]', 'wangan', '2017-04-27 13:52:11');
INSERT INTO `sys_log` VALUES ('D30CFFA5A6EF46F1B8BBEA512CF3007C', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:56:12');
INSERT INTO `sys_log` VALUES ('D31A7268A52F469CA6619B95ED483B73', 'menuTree', '[time:1493906466557]', 'wangan', '2017-05-04 22:01:07');
INSERT INTO `sys_log` VALUES ('D34C91322B314B5EB269C7E574981861', 'menuTree', '[time:1493282816602]', 'wangan', '2017-04-27 16:46:57');
INSERT INTO `sys_log` VALUES ('D3CECF80BBB2411790D3BB5100FDE643', 'menuDetail', '[menuId:1A29CDD70FF14348BE8806CB56FEA77E],[menuType:1]', 'wangan', '2017-05-02 22:18:22');
INSERT INTO `sys_log` VALUES ('D3E90B4644824239B54274BBCD9C8B79', 'scmSystem', '', 'wangan', '2017-04-27 14:10:39');
INSERT INTO `sys_log` VALUES ('D43ADD48DBCB40F3A5B9F12CC4C046F3', 'list', '', 'wangan', '2017-05-04 20:31:32');
INSERT INTO `sys_log` VALUES ('D4618882110B476BBE283C3612F9506B', 'logout', '', 'java', '2017-05-06 15:03:56');
INSERT INTO `sys_log` VALUES ('D4B1FCEB39074A09AD7F08F0584086A4', 'listUser', '[account:]', 'wangan', '2017-05-04 19:49:57');
INSERT INTO `sys_log` VALUES ('D5127E0555EF4476AA878DEA18CD6FA4', 'menuTree', '[time:1493906471009]', 'wangan', '2017-05-04 22:01:11');
INSERT INTO `sys_log` VALUES ('D51534AFC8EA428AB091BF1AD4BB9822', 'success', '', NULL, '2017-04-26 17:55:44');
INSERT INTO `sys_log` VALUES ('D5673A540F8D43328C25C45397A89323', 'list', '', 'wangan', '2017-05-04 19:55:48');
INSERT INTO `sys_log` VALUES ('D57B716367824A0F9207CA0779ECF6C7', 'loadTree', '[ts:1493898626264]', 'wangan', '2017-05-04 19:50:26');
INSERT INTO `sys_log` VALUES ('D587472D81A147B7B4F9AFC0B6D40DFD', 'toMenuTreeView', '', 'wangan', '2017-05-02 22:17:29');
INSERT INTO `sys_log` VALUES ('D5F9F76399224EC89D8E12E578C71991', 'list', '', 'wangan', '2017-04-27 10:52:59');
INSERT INTO `sys_log` VALUES ('D66E66BB6DAE48DCA8160F1A82ACDE23', 'menuTree', '[time:1493906462193]', 'wangan', '2017-05-04 22:01:02');
INSERT INTO `sys_log` VALUES ('D6BDEA992FBC418293E9937BF7ADD45C', 'error', '', NULL, '2017-04-27 10:39:17');
INSERT INTO `sys_log` VALUES ('D6DF1413858845A9A5255223BFCA2BF0', 'menuTree', '[time:1493275313440]', 'wangan', '2017-04-27 14:41:53');
INSERT INTO `sys_log` VALUES ('D72769BFADF14F92AAA26D1AAC8EF05C', 'menuTree', '[time:1493898366310]', 'wangan', '2017-05-04 19:46:06');
INSERT INTO `sys_log` VALUES ('D74DA50FB37C452A9F976B3F6A87B5E6', 'error', '', 'java', '2017-11-22 16:11:40');
INSERT INTO `sys_log` VALUES ('D76818B0DCC440E28D32CF22D12613F3', 'listEmployee', '', 'wangan', '2017-05-04 20:25:12');
INSERT INTO `sys_log` VALUES ('D76A050F24BB45E490D5A4099AB9905A', 'welcome', '', 'wangan', '2017-05-04 21:51:52');
INSERT INTO `sys_log` VALUES ('D7C0F7240B6042F59A75D4465BC574AA', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 14:56:14');
INSERT INTO `sys_log` VALUES ('D7D03B877FF64BDD9E1D861ADEB54141', 'menuTree', '[time:1493858476591]', 'wangan', '2017-05-04 08:41:17');
INSERT INTO `sys_log` VALUES ('D89AB6F6011A4A7DA7566720C93D684F', 'menuDetail', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuType:1]', 'wangan', '2017-04-27 16:50:32');
INSERT INTO `sys_log` VALUES ('D89B4F26F6634917811E373AEB7ED424', 'list', '', 'wangan', '2017-05-04 20:42:28');
INSERT INTO `sys_log` VALUES ('D8BE1EE7F6FC41AEBAE266488B7761D9', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 20:07:44');
INSERT INTO `sys_log` VALUES ('D925D29CC8E9457580E063C6F718B950', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:39:07');
INSERT INTO `sys_log` VALUES ('D938A9D291D64CF09CAA211EC2C75320', 'error', '', 'wangan', '2017-05-02 22:26:28');
INSERT INTO `sys_log` VALUES ('D985A4A1FE6E4B738AFC7AC09D91B539', 'menuTree', '[time:1493282975774]', 'wangan', '2017-04-27 16:49:36');
INSERT INTO `sys_log` VALUES ('D988119BE9E04DC985A29ACFE56DA82C', 'list', '', 'wangan', '2017-05-04 19:54:01');
INSERT INTO `sys_log` VALUES ('D99CCE39AD6E4D47A3C134C766705E28', 'loadPrivilege', '[roleId:82888F565F5747D3B41B9FBB94ED408A],[ts:1493898664150]', 'wangan', '2017-05-04 19:51:04');
INSERT INTO `sys_log` VALUES ('DA11AE9C318D40FB9103513B6BD3E5D9', 'list', '[brand:],[name:]', 'wangan', '2017-05-04 20:39:22');
INSERT INTO `sys_log` VALUES ('DA33D9D6ED654B71B4D2C562BC9E703B', 'listLog', '[beginDate:2017-05-01],[endDate:2017-05-04],[userAccount:]', 'wangan', '2017-05-04 19:51:55');
INSERT INTO `sys_log` VALUES ('DA552F07E4E84ED6BE3FFAB4B5187E94', 'toAdd', '', 'wangan', '2017-05-04 22:08:18');
INSERT INTO `sys_log` VALUES ('DA59BDB7D8134DCA98BADAB80C6B2A89', 'login', '[time:1493898893008]', 'wangan', '2017-05-04 19:54:53');
INSERT INTO `sys_log` VALUES ('DB18F45C843C424985CA9D6C944D2E28', 'getVCode', '', NULL, '2017-04-27 10:39:17');
INSERT INTO `sys_log` VALUES ('DB540F6247F0474784E008FACB8012D1', 'login', '', 'wangan', '2017-05-04 21:23:11');
INSERT INTO `sys_log` VALUES ('DBADE5F906544603887DD7DBD1CD8493', 'list', '', 'wangan', '2017-05-04 22:08:59');
INSERT INTO `sys_log` VALUES ('DBD3A96EA15E4A54B4268ADE2E820D29', 'menuDetail', '[menuId:root],[refreshTree:true]', 'wangan', '2017-04-27 13:52:48');
INSERT INTO `sys_log` VALUES ('DBE9D34124EC4043ADBAFD48498C3924', 'toEdit', '[mobileTypeId:NN-001]', 'wangan', '2017-05-04 21:42:52');
INSERT INTO `sys_log` VALUES ('DC00F80F694147BA9CBEAB8E2A6B7F7B', 'menuTree', '[time:1493898474702]', 'wangan', '2017-05-04 19:47:55');
INSERT INTO `sys_log` VALUES ('DC0108FFC8334301A0C16393B4CC6B29', 'loadPrivilege', '[roleId:82888F565F5747D3B41B9FBB94ED408A],[ts:1493801733393]', 'wangan', '2017-05-03 16:55:33');
INSERT INTO `sys_log` VALUES ('DC1B5D67CC6945A49F8DB56485A7DDA0', 'list', '[department.id:]', 'wangan', '2017-05-04 20:45:39');
INSERT INTO `sys_log` VALUES ('DC38631270BC4C9E94B7B0B490275CCE', 'menuDetail', '[menuId:691BB7442DED45F2A2D36F802C33E7B6],[menuType:2]', 'wangan', '2017-05-04 22:01:02');
INSERT INTO `sys_log` VALUES ('DC59CAC243E84345914F7006857C0A70', 'welcome', '', 'wangan', '2017-04-27 14:02:48');
INSERT INTO `sys_log` VALUES ('DCA609518BBA48E699F032FEF4A7F51E', 'menuTree', '[time:1511338944787]', 'wangan', '2017-11-22 16:22:25');
INSERT INTO `sys_log` VALUES ('DCE893B9C18E4E3C864B8E911A30DF18', 'menuTree', '[time:1493906449184]', 'wangan', '2017-05-04 22:00:49');
INSERT INTO `sys_log` VALUES ('DD410D456AFB439EBDF6A2B8D3F15C8C', 'listDepartment', '', 'wangan', '2017-04-26 18:24:33');
INSERT INTO `sys_log` VALUES ('DDE379C2C4E3432394D49B4BF69466A9', 'menuDetail', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuType:1]', 'wangan', '2017-04-27 14:15:35');
INSERT INTO `sys_log` VALUES ('DE52DA3A99E84C6C928B6E1DAD023ABD', 'toMenuTreeView', '', 'wangan', '2017-05-04 22:00:15');
INSERT INTO `sys_log` VALUES ('DE844269984E4D85858197C43BEA3808', 'toAdd', '', 'wangan', '2017-05-04 20:45:27');
INSERT INTO `sys_log` VALUES ('DE9200E82A664C64B7FF0A7D305B4E28', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 17:02:32');
INSERT INTO `sys_log` VALUES ('DEC6D7B39E9E4BEA96E7CB6ECBD8D7FB', 'list', '', 'wangan', '2017-05-04 20:50:04');
INSERT INTO `sys_log` VALUES ('DF3BD84E1276478FBCE35B9CD601FD70', 'list', '', 'wangan', '2017-04-26 18:24:38');
INSERT INTO `sys_log` VALUES ('DF5B997AD8074EF2987E5B548166F6AB', 'toEditMenuView', '[menuId:7952ADCE8BE94659903BF32E3737A322]', 'wangan', '2017-05-04 19:47:18');
INSERT INTO `sys_log` VALUES ('DF618359BB204C55BC8CBAE82F399E74', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:39:28');
INSERT INTO `sys_log` VALUES ('DF808959C43B44F9B4A1E288D9C9D94F', 'scmSystem', '', 'wangan', '2017-05-06 10:32:23');
INSERT INTO `sys_log` VALUES ('DFBA5638D7E6486782DB6BEF53C007E1', 'roleList', '[name:],[status:1],[_status:on、on、on]', 'wangan', '2017-05-04 19:48:27');
INSERT INTO `sys_log` VALUES ('DFFAFD74DB2649D3809501B0C5895420', 'menuDetail', '[menuId:7952ADCE8BE94659903BF32E3737A322],[menuType:2]', 'wangan', '2017-05-04 19:47:28');
INSERT INTO `sys_log` VALUES ('E0159F4E80474107A3BE8E2E9C051B20', 'delete', '[mobileTypeId:hw-004]', 'wangan', '2017-05-04 20:42:57');
INSERT INTO `sys_log` VALUES ('E051578E47B241F7A9EFEBA0B33DEB1B', 'list', '[startDate:2017-11-16],[endDate:2017-11-24],[show:导出Excel],[supplier.supplierType.id:],[supplier.id:],[tradeType:77]', 'wangan', '2017-11-23 16:44:03');
INSERT INTO `sys_log` VALUES ('E0589F9133F249CA83701A0A670F1410', 'menuTree', '[time:1493282965474]', 'wangan', '2017-04-27 16:49:25');
INSERT INTO `sys_log` VALUES ('E144BD33AA1E4AEC8FEEC6CBA47CD097', 'listDepartment', '[name:技术部],[address:]', 'wangan', '2017-05-04 19:52:42');
INSERT INTO `sys_log` VALUES ('E146B4F931194143892D52E854228AB5', 'scmSystem', '', 'wangan', '2017-05-04 21:25:49');
INSERT INTO `sys_log` VALUES ('E1503B33F5EB47D4B35FB59A4FE06106', 'listDepartment', '', 'wangan', '2017-05-04 20:25:19');
INSERT INTO `sys_log` VALUES ('E199C607ADB648A0BD590EAA00C6899E', 'toMenuTreeView', '', 'wangan', '2017-04-27 15:27:13');
INSERT INTO `sys_log` VALUES ('E1B6CF14AA584203A7B2D38BBC2B70F0', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('E1BC7ACC1ABB40418317C29962CFAC85', 'login', '', 'wangan', '2017-05-04 20:39:53');
INSERT INTO `sys_log` VALUES ('E1FD1A6AFF3347C6A626610D51FEE40B', 'moveUp', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuParentId:root],[menuSortOrder:8]', 'wangan', '2017-04-27 16:46:48');
INSERT INTO `sys_log` VALUES ('E1FEA0AB5AFA48898A9D3EB60ADCFC5C', 'menuTree', '[time:1493906465160]', 'wangan', '2017-05-04 22:01:05');
INSERT INTO `sys_log` VALUES ('E219315D60044E7CAAB8ACB39546557B', 'menuTree', '[time:1511426633563]', 'wangan', '2017-11-23 16:43:54');
INSERT INTO `sys_log` VALUES ('E219655D84414BA0B7BE97B459252D69', 'menuDetail', '[menuId:3DD11D14DCCC4EDD8BA59491E25FBDEA],[menuType:1]', 'wangan', '2017-04-27 16:48:22');
INSERT INTO `sys_log` VALUES ('E24B0FC326D94A90BA1818651662D162', 'listUser', '', 'wangan', '2017-05-06 09:59:01');
INSERT INTO `sys_log` VALUES ('E2698B9B9D624482882456E737626C33', 'menuTree', '[time:1493982278270]', 'wangan', '2017-05-05 19:04:38');
INSERT INTO `sys_log` VALUES ('E2742D4D39C14DB6A517F3057EEC0B24', 'toEditMenuView', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07]', 'wangan', '2017-05-04 19:46:38');
INSERT INTO `sys_log` VALUES ('E27DBA3418E74572B9D2344AAD9D8474', 'menuTree', '[time:1511341417324]', 'wangan', '2017-11-22 17:03:37');
INSERT INTO `sys_log` VALUES ('E300BED2000A43BFB7276C99F891D884', 'listDepartment', '[name:],[address:]', 'wangan', '2017-05-04 19:52:35');
INSERT INTO `sys_log` VALUES ('E34632A0C17240788B0DA976AF179408', 'savePrivilege', '[roleId:AA6124637C1241DC97FD855CC8401267],[menuIds:root、3E0FA41A27874D6BABE3F02C552FAA07、BE2E58BAFA8E4AF19E42FCB32BFBB4F0、F413BD8683B54A67B1A2C5380A391854、5F0D2570016B41D18E0CEB83FF8F2AE5、9946C289C49D4ADD93E9EB7B6E3AA9BE、3DD11D14DCCC4EDD8BA59491E25FBDEA、D012F1DD21F1473B838382E04A011BF7],[actionIds:A886DA9DD9AB4A2682713DE8510E9F2F、532145EE5140486DBE72F0ED95B6AA12、819AFD28DF284BCB84D5C57D6BB9B594]', 'wangan', '2017-05-06 15:28:06');
INSERT INTO `sys_log` VALUES ('E39E7FD1A3CC4F4E87A70B69B3A0980B', 'error', '', 'wangan', '2017-05-04 19:51:40');
INSERT INTO `sys_log` VALUES ('E3DDB5C0B79A4F209947B145CEAB6F18', 'roleList', '[name:],[_status:on、on、on],[status:2]', 'wangan', '2017-05-04 19:49:24');
INSERT INTO `sys_log` VALUES ('E4194535B6A14E36B6370C9F3E269A89', 'menuTree', '[time:1493906477864]', 'wangan', '2017-05-04 22:01:18');
INSERT INTO `sys_log` VALUES ('E438A037A02B4EE7B894DF33B8A2C9B1', 'menuTree', '[time:1493898471882]', 'wangan', '2017-05-04 19:47:52');
INSERT INTO `sys_log` VALUES ('E48B524AF8B141B997C96D22155C62CB', 'listUser', '[account:java]', 'wangan', '2017-05-04 22:02:15');
INSERT INTO `sys_log` VALUES ('E49F25A9972D4AC9B316C7AB18381AB5', 'list', '', 'wangan', '2017-05-04 21:26:00');
INSERT INTO `sys_log` VALUES ('E4E8C5FA8F8A467B918DE4D9661BD4D5', 'login', '', 'wangan', '2017-05-04 20:50:09');
INSERT INTO `sys_log` VALUES ('E5008E24F85F4BE39FF131222173C808', 'menuTree', '[time:1493277863495]', 'wangan', '2017-04-27 15:24:24');
INSERT INTO `sys_log` VALUES ('E57611E3278645A6A131FFCCA9F6124C', 'menuTree', '[time:1493282341425]', 'wangan', '2017-04-27 16:39:01');
INSERT INTO `sys_log` VALUES ('E5E5047E5D7B404EA79A5EE1C9D5F431', 'getVCode', '', NULL, '2017-04-26 18:32:59');
INSERT INTO `sys_log` VALUES ('E641C48BAC11441B925EB0556AF2A13B', 'toEdit', '[supplierId:HUAWEI_CQ]', 'wangan', '2017-05-04 19:53:54');
INSERT INTO `sys_log` VALUES ('E6429EA952E04A518000239D0811EFC9', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-05-02 22:17:29');
INSERT INTO `sys_log` VALUES ('E6444ABC7DC14E4894CBA8E1C6280D55', 'scmSystem', '', 'wangan', '2017-05-02 22:17:13');
INSERT INTO `sys_log` VALUES ('E73D7D1719674AE785A46A9D23ED4ABB', 'menuTree', '[time:1493282830746]', 'wangan', '2017-04-27 16:47:11');
INSERT INTO `sys_log` VALUES ('E75FECD9F3984A8CABB38CB323E5D1F8', 'menuTree', '[time:1493276958937]', 'wangan', '2017-04-27 15:09:19');
INSERT INTO `sys_log` VALUES ('E76B80A2EB0D4DC69E06153FA27D5D4D', 'scmSystem', '', 'wangan', '2017-05-04 21:13:15');
INSERT INTO `sys_log` VALUES ('E7B5F030DD8841A9BCA3A6427DB7DAB0', 'list', '[table:basic_color]', 'wangan', '2017-05-04 22:06:52');
INSERT INTO `sys_log` VALUES ('E7D31D6B189D4541BFEA4D7A101644F6', 'menuTree', '[time:1493898473637]', 'wangan', '2017-05-04 19:47:54');
INSERT INTO `sys_log` VALUES ('E7EE299164594EB1A499296CC68F93A6', 'scmSystem', '', 'wangan', '2017-11-22 17:03:37');
INSERT INTO `sys_log` VALUES ('E800444D974948889BE60317580A6EB1', 'menuTree', '[time:1493898441376]', 'wangan', '2017-05-04 19:47:21');
INSERT INTO `sys_log` VALUES ('E86153A272E046D9A43E06D1942D200F', 'welcome', '', 'wangan', '2017-04-28 17:10:20');
INSERT INTO `sys_log` VALUES ('E8654824C5374938BED480CBA160FA61', 'welcome', '', 'wangan', '2017-05-04 20:53:09');
INSERT INTO `sys_log` VALUES ('E880D1049D6D40AC89BEA2EED6DADD0C', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 21:07:45');
INSERT INTO `sys_log` VALUES ('E8833A540EA442A4B2764CFA7E870485', 'toPrivilegeView', '', 'wangan', '2017-05-03 16:42:00');
INSERT INTO `sys_log` VALUES ('E88EB0D4A16F4536BC69261810A1EAE8', 'roleList', '', 'wangan', '2017-05-04 20:42:26');
INSERT INTO `sys_log` VALUES ('E890BA32CAEF41919A186D14885B297D', 'list', '', 'wangan', '2017-04-26 18:33:31');
INSERT INTO `sys_log` VALUES ('E8C3FC86DDEC4205835D3CBE054DB911', 'menuDetail', '[menuId:3108E8A2E5C443BD89B413D72CC23262],[menuType:1]', 'wangan', '2017-05-02 22:18:24');
INSERT INTO `sys_log` VALUES ('E8D8804E97E44562B23EF6D645855CC5', 'menuTree', '[time:1511422627719]', 'wangan', '2017-11-23 15:37:08');
INSERT INTO `sys_log` VALUES ('E8F05C67F3774518ACD1619DBC8C04EA', 'error', '', NULL, '2017-04-27 10:41:01');
INSERT INTO `sys_log` VALUES ('E97F39A0908447C29ED1630C36054DED', 'menuTree', '[time:1493906432812]', 'wangan', '2017-05-04 22:00:33');
INSERT INTO `sys_log` VALUES ('E997F78462894BB0A75D253C334A94B7', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 10:52:39');
INSERT INTO `sys_log` VALUES ('E9D95276A85B4E73A6DF7F37ACD5C455', 'menuTree', '[time:1493260001096]', 'wangan', '2017-04-27 10:26:41');
INSERT INTO `sys_log` VALUES ('EA0C9FDCB45841EFB9E9825F7C763BA2', 'listLog', '', 'wangan', '2017-04-26 18:10:48');
INSERT INTO `sys_log` VALUES ('EA3B92CC53A946EBA44A7CA8F0B0D9C3', 'toAdd', '', 'wangan', '2017-05-04 22:06:23');
INSERT INTO `sys_log` VALUES ('EACB5F6B5C994C93B6A7A32DF5F37F74', 'list', '', 'wangan', '2017-05-04 19:53:47');
INSERT INTO `sys_log` VALUES ('EB576842F89E48DBAC245299CAA89B42', 'menuTree', '[time:1493282902640]', 'wangan', '2017-04-27 16:48:23');
INSERT INTO `sys_log` VALUES ('EB5BC10A12794C0598CA534CB7B99D92', 'scmSystem', '', 'jishu', '2017-05-06 16:03:58');
INSERT INTO `sys_log` VALUES ('EB761AEF7F95454DB0AA2DF0510CF624', 'menuTree', '[time:1493903235746]', 'wangan', '2017-05-04 21:07:16');
INSERT INTO `sys_log` VALUES ('EBE8B58534664621A70542A5B8BBB489', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 17:02:51');
INSERT INTO `sys_log` VALUES ('EBE9331176AF49DAA4A16734F75AE75C', 'listLog', '[page.pageIndex:1]', 'wangan', '2017-04-26 17:58:54');
INSERT INTO `sys_log` VALUES ('EC35C74FEB644D7E86EA1271B5C5A1C3', 'list', '', 'wangan', '2017-05-04 21:58:27');
INSERT INTO `sys_log` VALUES ('EC3D0882891C42ECA709120CCA644788', 'scmSystem', '', 'wangan', '2017-05-04 21:42:46');
INSERT INTO `sys_log` VALUES ('EC4E270ED4EB45DCBC347DABDD1E026A', 'scmSystem', '', 'jishu', '2017-05-06 16:04:29');
INSERT INTO `sys_log` VALUES ('EC7F9B07ADDD43B488870EBF27329609', 'toEdit', '', 'wangan', '2017-05-04 21:31:36');
INSERT INTO `sys_log` VALUES ('ECBDBA7C7BEB4B42A931D271D1382361', 'toAdd', '', 'wangan', '2017-05-02 22:26:28');
INSERT INTO `sys_log` VALUES ('ECFE11C88A4445B3881331242E8FC220', 'welcome', '', 'wangan', '2017-05-04 20:09:13');
INSERT INTO `sys_log` VALUES ('ED0321A7E41747FBBB3E6A9A51E9DAF8', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1],[refreshTree:true]', 'wangan', '2017-04-27 14:16:41');
INSERT INTO `sys_log` VALUES ('ED08C5C2A01C4A828F30399873D6B448', 'menuTree', '[time:1493906415992]', 'wangan', '2017-05-04 22:00:16');
INSERT INTO `sys_log` VALUES ('ED58BA1685AF4C0CBBC36356FCFF3462', 'menuTree', '[time:1493283078545]', 'wangan', '2017-04-27 16:51:19');
INSERT INTO `sys_log` VALUES ('ED927F8C9A9846848C61018BB7B692E6', 'welcome', '', 'jishu', '2017-05-06 16:33:34');
INSERT INTO `sys_log` VALUES ('ED9F978A87CE48EA8307899AD30F385C', 'toMenuTreeView', '', 'wangan', '2017-04-27 15:10:20');
INSERT INTO `sys_log` VALUES ('EDB3B9B0639B448F8B90F395F0CB159F', 'toEditActionView', '[actionId:0CEEF819CE984E679D65FF7B8F60BFCD],[menuId:7952ADCE8BE94659903BF32E3737A322]', 'wangan', '2017-05-04 19:47:31');
INSERT INTO `sys_log` VALUES ('EDD9679E66DE45CCB483D12568E7DF59', 'listEmployee', '', 'wangan', '2017-05-02 22:22:14');
INSERT INTO `sys_log` VALUES ('EDE548A585F641E1AE2709F55D4D2217', 'menuTree', '[time:1493906445725]', 'wangan', '2017-05-04 22:00:46');
INSERT INTO `sys_log` VALUES ('EE07011FAC0147A99A80712CBBBFBEA0', 'menuTree', '[time:1494033538747]', 'wangan', '2017-05-06 09:18:59');
INSERT INTO `sys_log` VALUES ('EE805B373FA04E27A44E1339597A6B70', 'menuTree', '[time:1493899246207]', 'wangan', '2017-05-04 20:00:46');
INSERT INTO `sys_log` VALUES ('EE835E605E6943E0A09385D6ADAAD674', 'login', '', 'wangan', '2017-05-04 21:28:27');
INSERT INTO `sys_log` VALUES ('EE9D070788594A8D924B6222856E376C', 'toEditMenuView', '[menuId:D012F1DD21F1473B838382E04A011BF7]', 'wangan', '2017-04-27 14:16:47');
INSERT INTO `sys_log` VALUES ('EE9ED690E1FF4A269648DF8127077D4D', 'menuDetail', '[menuId:3E0FA41A27874D6BABE3F02C552FAA07],[menuType:1]', 'wangan', '2017-05-04 19:47:01');
INSERT INTO `sys_log` VALUES ('EF07792F2FCB45CE8874C61BAA80AF08', 'list', '[table:basic_brand]', 'wangan', '2017-05-04 19:54:26');
INSERT INTO `sys_log` VALUES ('EF147227723D4CD3BEDE5A733B94BA18', 'list', '', 'wangan', '2017-05-04 22:07:40');
INSERT INTO `sys_log` VALUES ('EF51A5D3D58F4F4299B65DD1098EF768', 'toAdd', '', 'wangan', '2017-05-04 20:18:50');
INSERT INTO `sys_log` VALUES ('EF55163FDC224814AF91DC79F15BD9B6', 'welcome', '', 'wangan', '2017-05-04 20:11:52');
INSERT INTO `sys_log` VALUES ('F02B36F3A84A4083BCA8605A753DA6DB', 'list', '', 'wangan', '2017-05-04 21:58:32');
INSERT INTO `sys_log` VALUES ('F02E94F1BFBA43EB9B5623ED34C5BF81', 'welcome', '', 'wangan', '2017-05-04 08:41:17');
INSERT INTO `sys_log` VALUES ('F06633FBBAC54E2CBD4CD81F6D7547C2', 'toAdd', '', 'wangan', '2017-05-04 22:10:11');
INSERT INTO `sys_log` VALUES ('F066CB1B3A764F7D9FA276EAF2E9E2D1', 'listLog', '', 'wangan', '2017-04-26 18:10:03');
INSERT INTO `sys_log` VALUES ('F0704B3012724365BAFE3B277E021C9D', 'menuTree', '[time:1494033546390]', 'wangan', '2017-05-06 09:19:06');
INSERT INTO `sys_log` VALUES ('F070B034B4904318A5DB3DE15CC5AE07', 'menuTree', '[time:1493199964930]', 'wangan', '2017-04-26 17:46:05');
INSERT INTO `sys_log` VALUES ('F076CDAF3CD14BDBA481933B345F7DCC', 'menuTree', '[time:1493734704414]', 'wangan', '2017-05-02 22:18:24');
INSERT INTO `sys_log` VALUES ('F08CB5E5129242B0B15F11AA6CFFAEF9', 'error', '', NULL, '2017-04-27 10:35:45');
INSERT INTO `sys_log` VALUES ('F09765F0A42B42F3916C15E9F45FA2A6', 'menuTree', '[time:1493278778221]', 'wangan', '2017-04-27 15:39:38');
INSERT INTO `sys_log` VALUES ('F0DA46E4A0B8401FB0293A41851B1533', 'welcome', '', 'wangan', '2017-05-04 20:31:29');
INSERT INTO `sys_log` VALUES ('F1640798B8234A948AACB6D5BD089DF9', 'scmSystem', '', 'wangan', '2017-05-04 20:09:13');
INSERT INTO `sys_log` VALUES ('F180847A70DF49369D34A78E3E2E745A', 'scmSystem', '', 'java', '2017-05-06 15:00:02');
INSERT INTO `sys_log` VALUES ('F190662CC2454BBE99EADBEEB43F19C1', 'welcome', '', 'wangan', '2017-04-26 18:18:57');
INSERT INTO `sys_log` VALUES ('F1BF779E30354AA8A4E0FC095C1A36A5', 'toEditDeptView', '[id:47DAF9B6E0F54A7FAC847F209719E913]', 'wangan', '2017-05-04 20:25:17');
INSERT INTO `sys_log` VALUES ('F1C6DE6B64DC4A61B62964AE1C492FF3', 'loadTree', '[ts:1494055672493]', 'wangan', '2017-05-06 15:27:53');
INSERT INTO `sys_log` VALUES ('F1CD73B852464754BE748EA022CBDAEB', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493906568603]', 'wangan', '2017-05-04 22:02:49');
INSERT INTO `sys_log` VALUES ('F1D4286EC37E4E59B480C98D847F5B2D', 'menuTree', '[time:1494057295518]', 'jishu', '2017-05-06 15:54:56');
INSERT INTO `sys_log` VALUES ('F1DE54D405B1460BAD3B543EC56B6635', 'error', '', NULL, '2017-04-27 11:21:36');
INSERT INTO `sys_log` VALUES ('F205FBB38C1D4B5DB4D466A2A283669A', 'menuTree', '[time:1493901089015]', 'wangan', '2017-05-04 20:31:29');
INSERT INTO `sys_log` VALUES ('F211A65E2AD54D779C8CFC22E91D0142', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('F2609A73B909497FBE4CFBCDDED5971D', 'roleList', '[name:],[status:1、2、3],[_status:on、on、on]', 'wangan', '2017-05-04 19:49:18');
INSERT INTO `sys_log` VALUES ('F29B1AF06132487492E07B2270F6C30E', 'menuTree', '[time:1511338413223]', 'wangan', '2017-11-22 16:13:33');
INSERT INTO `sys_log` VALUES ('F2A05D7DB3A64ADBBBE906754A392BA0', 'scmSystem', '', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('F2A384FC30214EEDA4DFDDC3B5BED7BB', 'menuTree', '[time:1493201593833]', 'wangan', '2017-04-26 18:13:14');
INSERT INTO `sys_log` VALUES ('F2F93797F32B4D96ABBA6F3D8556D1D6', 'loadTree', '[ts:1493800920693]', 'wangan', '2017-05-03 16:42:01');
INSERT INTO `sys_log` VALUES ('F31ACE5A62F94DFD93ABF966A42A73F4', 'getVCode', '', NULL, '2017-04-26 18:09:48');
INSERT INTO `sys_log` VALUES ('F33005C1E2B94F3DA1D6BB5E174C7809', 'listLog', '[beginDate:2017-04-04],[endDate:2017-05-02],[userAccount:],[page.pageIndex:22]', 'wangan', '2017-05-04 22:03:36');
INSERT INTO `sys_log` VALUES ('F3BA0D7805C746D28FF755CE06DFD2A6', 'listUser', '', 'wangan', '2017-05-04 22:02:09');
INSERT INTO `sys_log` VALUES ('F46DDA3B98624C468770736A3D89D446', 'menuDetail', '[menuId:0ED688E8C9C64A189488A6EFFDC756ED],[menuType:2]', 'wangan', '2017-05-04 19:47:55');
INSERT INTO `sys_log` VALUES ('F4A01B3E380D42DCA1B9582A34258D79', 'add', '[table:basic_brand],[data:中兴]', 'wangan', '2017-05-04 19:54:25');
INSERT INTO `sys_log` VALUES ('F4A42E91361246B092110D40F1BCD0F4', 'scmSystem', '', 'wangan', '2017-05-05 19:05:48');
INSERT INTO `sys_log` VALUES ('F4E100DBE5C34243A354C7E5A63A05B2', 'welcome', '', 'wangan', '2017-05-04 20:27:01');
INSERT INTO `sys_log` VALUES ('F561FB7C59A54F819A522F7BF5FB84E5', 'error', '', 'wangan', '2017-05-02 22:22:32');
INSERT INTO `sys_log` VALUES ('F58F8B58C5694C0796CA2503A956EB01', 'toEdit', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 22:07:11');
INSERT INTO `sys_log` VALUES ('F5A471E7E7D944B385852F958811ABF9', 'toPrivilegeView', '', 'jishu', '2017-05-06 15:39:02');
INSERT INTO `sys_log` VALUES ('F5C27D1DE80B48B98A9E296547A2C5B7', 'menuTree', '[time:1493259238695]', 'wangan', '2017-04-27 10:13:59');
INSERT INTO `sys_log` VALUES ('F5D8C360456B4F119C72CE6FB61EC238', 'list', '', 'wangan', '2017-05-02 22:23:39');
INSERT INTO `sys_log` VALUES ('F613D5DDD0144F8CB7369F05F1F6E204', 'welcome', '', 'java', '2017-11-22 16:11:05');
INSERT INTO `sys_log` VALUES ('F6253AA10B68449A9D3E00BE010B8A71', 'scmSystem', '', 'wangan', '2017-04-27 16:46:05');
INSERT INTO `sys_log` VALUES ('F6520D9382F14D6B9ABBC095478E0BBC', 'error', '[mobileTypeId:HW-001]', 'wangan', '2017-05-04 20:47:34');
INSERT INTO `sys_log` VALUES ('F65D7AF27A374AA6A0F52847E27E5237', 'loadPrivilege', '[roleId:02C31CB8F1204EF7984B1EFA5D77207C],[ts:1494053684436]', 'wangan', '2017-05-06 14:54:44');
INSERT INTO `sys_log` VALUES ('F66E615FED224935A90C39DB523762D6', 'menuDetail', '[menuId:1F312FD42DCC48A48528E1285C36F321],[menuType:2]', 'wangan', '2017-05-04 22:01:11');
INSERT INTO `sys_log` VALUES ('F6AD14A145584C3B997F56E96D9FD83F', 'login', '', 'wangan', '2017-05-04 20:14:13');
INSERT INTO `sys_log` VALUES ('F6D9F39D00614E489894B0C13099DDF7', 'welcome', '', 'wangan', '2017-05-04 20:19:42');
INSERT INTO `sys_log` VALUES ('F716442BA120497BA6865D9F135F8B76', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-11-23 15:37:07');
INSERT INTO `sys_log` VALUES ('F77E6275341844A1A643F3A0B70DEAD1', 'login', '', 'wangan', '2017-05-04 20:43:01');
INSERT INTO `sys_log` VALUES ('F7C4911F4D794116A29224B43E950813', 'menuTree', '[time:1493898941846]', 'wangan', '2017-05-04 19:55:42');
INSERT INTO `sys_log` VALUES ('F7CEE8A826A5474B9E67F65BA24BC0E6', 'scmSystem', '', 'wangan', '2017-04-27 13:52:11');
INSERT INTO `sys_log` VALUES ('F7F2E81739824E78954955941674527D', 'menuTree', '[time:1493273713731]', 'wangan', '2017-04-27 14:15:14');
INSERT INTO `sys_log` VALUES ('F7FF8D42F474404789564D858302231D', 'toMenuTreeView', '', 'wangan', '2017-05-06 09:19:06');
INSERT INTO `sys_log` VALUES ('F82933A5EF87437DB544B8627F647260', 'login', '', NULL, '2017-04-26 18:32:58');
INSERT INTO `sys_log` VALUES ('F83BF17C66B543AA94524482B6D0FA0A', 'welcome', '', 'wangan', '2017-05-06 15:30:32');
INSERT INTO `sys_log` VALUES ('F8413F89797844EEA1474AA2564E3425', 'logout', '', 'wangan', '2017-05-06 15:29:43');
INSERT INTO `sys_log` VALUES ('F8496FFD1E0A4938B60B8282974C2BE8', 'login', '', 'wangan', '2017-05-04 20:55:25');
INSERT INTO `sys_log` VALUES ('F8E3EACC7A174B019C5F34415872E6F6', 'listLog', '[page.pageIndex:3]', 'wangan', '2017-04-26 17:59:03');
INSERT INTO `sys_log` VALUES ('F8E6088F1CDE4D71B57EE98FA342EBB3', 'login', '', NULL, '2017-04-26 18:10:36');
INSERT INTO `sys_log` VALUES ('F9073A505D6849E3A2DDE6B10711C072', 'scmSystem', '', 'wangan', '2017-04-27 17:02:29');
INSERT INTO `sys_log` VALUES ('F91283A32BCF44E89E5573A826E4CB28', 'toMenuTreeView', '', 'wangan', '2017-11-23 15:37:07');
INSERT INTO `sys_log` VALUES ('F92455B1C2E54D6F92BF39E5FBBB16F5', 'scmSystem', '', 'wangan', '2017-05-04 21:19:47');
INSERT INTO `sys_log` VALUES ('F937E2FFA07F4B13B8D3EF144EC3C722', 'loadPrivilege', '[roleId:32B4C75CA124443F8812299624CEF219],[ts:1493855554007]', 'wangan', '2017-05-04 07:52:34');
INSERT INTO `sys_log` VALUES ('F966AD76572843828AD4B438507625F3', 'menuDetail', '[menuId:5BBE507F8451446DAAE0085EBC9DCD74],[menuType:2]', 'wangan', '2017-05-04 19:47:52');
INSERT INTO `sys_log` VALUES ('F978DA1ECF86447DA1BB88278A124502', 'welcome', '', 'wangan', '2017-11-22 16:22:25');
INSERT INTO `sys_log` VALUES ('F9F48C01280E4423858F484A00D3C9FB', 'toEditRoleView', '[roleId:82888F565F5747D3B41B9FBB94ED408A]', 'wangan', '2017-05-04 19:48:48');
INSERT INTO `sys_log` VALUES ('FA0E952925F14F309CB8A6D75510D84A', 'list', '', 'wangan', '2017-05-03 16:49:03');
INSERT INTO `sys_log` VALUES ('FA470B240020494CBB6D16316A2A5A2A', 'menuTree', '[time:1494054060330]', 'java', '2017-05-06 15:01:00');
INSERT INTO `sys_log` VALUES ('FA4BD972E6CF4C659970AE0C3EEF3B86', 'toAdd', '', 'wangan', '2017-05-04 22:05:13');
INSERT INTO `sys_log` VALUES ('FA6ECCD2AB1340E09EA82396DDF2ECB2', 'login', '', NULL, '2017-04-27 10:38:05');
INSERT INTO `sys_log` VALUES ('FA73E0815D95471E80A2FA6001CB6A3D', 'list', '', 'wangan', '2017-05-04 22:10:48');
INSERT INTO `sys_log` VALUES ('FA7CDAE5406E46FFB3A6B03C423E4D5E', 'listEmployee', '[name:李白]', 'wangan', '2017-05-04 22:05:00');
INSERT INTO `sys_log` VALUES ('FA92FE1FB7F846B3AB303557EF40AFA0', 'toEdit', '', 'wangan', '2017-05-04 21:31:35');
INSERT INTO `sys_log` VALUES ('FAD6B12B525A4E168C0A7D1EEB4EF5E9', 'menuTree', '[time:1493283749359]', 'wangan', '2017-04-27 17:02:29');
INSERT INTO `sys_log` VALUES ('FADB02A5CDD84F08A4CFF5C947371A9C', 'scmSystem', '', 'wangan', '2017-05-04 21:16:32');
INSERT INTO `sys_log` VALUES ('FB2D673F28F644B2A48EEB82EB794F17', 'list', '', 'wangan', '2017-05-04 22:08:25');
INSERT INTO `sys_log` VALUES ('FB3FFDE364C3487FA9EFF6E11650197B', 'menuTree', '[time:1493903595170]', 'wangan', '2017-05-04 21:13:15');
INSERT INTO `sys_log` VALUES ('FB6C362C42954938BB81F3B1447BDED9', 'list', '', 'wangan', '2017-04-26 18:33:26');
INSERT INTO `sys_log` VALUES ('FB6E8E467D424BD5BD4761752F128DA7', 'login', '[time:1493982277436]', 'wangan', '2017-05-05 19:04:37');
INSERT INTO `sys_log` VALUES ('FBA6B733CBF6425BB8BD139DB6CBC9B0', 'list', '', 'wangan', '2017-04-26 18:28:14');
INSERT INTO `sys_log` VALUES ('FBE1A2C6AAAA4689960A7152853E2301', 'menuDetail', '[menuId:D012F1DD21F1473B838382E04A011BF7],[menuType:1]', 'wangan', '2017-04-27 14:50:16');
INSERT INTO `sys_log` VALUES ('FBE5C200BB01402AA6DCE575174CBBC0', 'scmSystem', '', 'wangan', '2017-11-23 16:43:56');
INSERT INTO `sys_log` VALUES ('FC5D2E056AC74FB7B6B1FEDB65C61BC6', 'error', '', 'wangan', '2017-05-04 22:03:22');
INSERT INTO `sys_log` VALUES ('FD0E22E37FF145FAAFD82D8BBBC979F3', 'welcome', '', 'wangan', '2017-11-23 15:37:02');
INSERT INTO `sys_log` VALUES ('FD2BD60D3CE0424B9FECC0C3DBFD7921', 'welcome', '', 'wangan', '2017-04-27 14:15:04');
INSERT INTO `sys_log` VALUES ('FE49A556BF3F48BBBC9BC36FDA112A5A', 'welcome', '', 'wangan', '2017-11-23 15:37:05');
INSERT INTO `sys_log` VALUES ('FE4B0CDCCFD548C0826BEF50DC2700D9', 'listDepartment', '', 'wangan', '2017-05-04 22:04:48');
INSERT INTO `sys_log` VALUES ('FEAB7E9BC3B94341B2B6171AA6488DF6', 'toEditDeptView', '[id:47DAF9B6E0F54A7FAC847F209719E913]', 'wangan', '2017-05-04 22:04:29');
INSERT INTO `sys_log` VALUES ('FED9692FD09F4D8DA739D1F20522F787', 'welcome', '', 'jishu', '2017-05-06 15:05:03');
INSERT INTO `sys_log` VALUES ('FF0E3559B8214B6091EC377EADB4CCD8', 'login', '', NULL, '2017-04-27 10:39:15');
INSERT INTO `sys_log` VALUES ('FF1F32CD5FE6440AA7013A5D9CFA4195', 'menuTree', '[time:1493734689883]', 'wangan', '2017-05-02 22:18:10');
INSERT INTO `sys_log` VALUES ('FF2C3CC9ADD349E78649A4156CE0446A', 'listDepartment', '', 'wangan', '2017-05-02 22:22:11');
INSERT INTO `sys_log` VALUES ('FF8840F5108E4162B84C2814435070B7', 'list', '', 'wangan', '2017-05-04 19:53:34');
INSERT INTO `sys_log` VALUES ('FFA060E9F0DC4652876D8A013FCDBA5B', 'menuDetail', '[menuId:root],[menuType:1]', 'wangan', '2017-04-27 16:51:18');
INSERT INTO `sys_log` VALUES ('FFA328FBC8774DBBAF56FECF34A5CA2C', 'scmSystem', '', 'wangan', '2017-05-02 16:21:21');
INSERT INTO `sys_log` VALUES ('FFA4FCEBEA9F439086398DFC14A416A8', 'loadPrivilege', '[roleId:C968B245101E4687A476AE7582ED1620],[ts:1493906587554]', 'wangan', '2017-05-04 22:03:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `parentId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `actionId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) NOT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('022606F27FDD4CE7BFF3BABE16872D2C', '-- 分隔线 --', 3, '1A29CDD70FF14348BE8806CB56FEA77E', NULL, 3, '');
INSERT INTO `sys_menu` VALUES ('0AC72214D36F4B69B02EC662A055E0DF', '菜单管理', 2, '3E0FA41A27874D6BABE3F02C552FAA07', '932AD6493FE84278ABF9714DCE67252F', 1, '');
INSERT INTO `sys_menu` VALUES ('0ED688E8C9C64A189488A6EFFDC756ED', '供应商管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', '4E283D7758EA4DA4B7F3D5751771B83C', 5, '');
INSERT INTO `sys_menu` VALUES ('1A29CDD70FF14348BE8806CB56FEA77E', '基础设置', 1, 'root', NULL, 2, '');
INSERT INTO `sys_menu` VALUES ('1F312FD42DCC48A48528E1285C36F321', '手机型号管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', 'FE1D1F656BB9415D9AE322E35410DF69', 12, '');
INSERT INTO `sys_menu` VALUES ('24C6CAB6D19949C08060D56C2CDCE6FA', '客户业务', 1, 'root', NULL, 5, '');
INSERT INTO `sys_menu` VALUES ('2B82868A0EAA45F6B1728328764247DD', '供应商交易明细', 2, '3108E8A2E5C443BD89B413D72CC23262', '44DF836F0C2B4873B6E658E8A73EF9B9', 14, '');
INSERT INTO `sys_menu` VALUES ('3108E8A2E5C443BD89B413D72CC23262', '供应商业务', 1, 'root', NULL, 3, '');
INSERT INTO `sys_menu` VALUES ('3B814410C63849DEAA88106D3CDBA695', '一般返利', 2, '3108E8A2E5C443BD89B413D72CC23262', '5FBDF1FD0CE64478AD72CC6D757EDF84', 9, '');
INSERT INTO `sys_menu` VALUES ('3DD11D14DCCC4EDD8BA59491E25FBDEA', '报表业务', 1, 'root', NULL, 7, '');
INSERT INTO `sys_menu` VALUES ('3E0FA41A27874D6BABE3F02C552FAA07', '系统管理', 1, 'root', NULL, 1, '');
INSERT INTO `sys_menu` VALUES ('48021C719844402A9FCA39D5CE824B75', '季度报表', 2, '3DD11D14DCCC4EDD8BA59491E25FBDEA', 'AF4DA5A8AB99437FB9BB4E2299CD045B', 7, '公司报表');
INSERT INTO `sys_menu` VALUES ('4BD95DC3380F44B0B280CC11FD31433C', '品牌管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', '92C65D688A48462190F9E3199978A271', 9, '手机基础设置');
INSERT INTO `sys_menu` VALUES ('5007F80E96F04832915F0BEBB7E7689F', '-- 分隔线 --', 3, '1A29CDD70FF14348BE8806CB56FEA77E', NULL, 8, '');
INSERT INTO `sys_menu` VALUES ('522717FF1BD145068D464BA5F9F5743A', '-- 分隔线 --', 3, '1A29CDD70FF14348BE8806CB56FEA77E', NULL, 14, '');
INSERT INTO `sys_menu` VALUES ('533F50404E084706A7268ABC328DEFB5', '返利类别设定', 2, '1A29CDD70FF14348BE8806CB56FEA77E', '5B5006ADEE5E4121BC79BD08DA0E061A', 15, '');
INSERT INTO `sys_menu` VALUES ('5BBE507F8451446DAAE0085EBC9DCD74', '员工管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', '7F42531633B14474B43038FAAE5DC44A', 2, '');
INSERT INTO `sys_menu` VALUES ('5EABD82C979847EC97457947E1BFDD89', '-- 分隔线 --', 3, '3108E8A2E5C443BD89B413D72CC23262', NULL, 11, '');
INSERT INTO `sys_menu` VALUES ('5F0D2570016B41D18E0CEB83FF8F2AE5', '修改密码', 2, '3E0FA41A27874D6BABE3F02C552FAA07', '532145EE5140486DBE72F0ED95B6AA12', 7, '');
INSERT INTO `sys_menu` VALUES ('63D2CACCF63E4AA8B72194C3851B0A78', '现金返利', 2, '3108E8A2E5C443BD89B413D72CC23262', '4260C6E4F9264D98A7D9C6959EFD9E51', 8, '');
INSERT INTO `sys_menu` VALUES ('66CE47589138475F9FD6C22EF4C9F027', '客户管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', 'C9F5C6851B5642A29402DBB0FE872A1A', 7, '');
INSERT INTO `sys_menu` VALUES ('691BB7442DED45F2A2D36F802C33E7B6', '部门管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', '5CDB1667EDC342248A96730E51B1488D', 1, '');
INSERT INTO `sys_menu` VALUES ('694819DEB27249EBADAC1CC284A2C84B', '库存业务', 1, 'root', NULL, 4, '');
INSERT INTO `sys_menu` VALUES ('6EC307FA700E41AB8DD27143D8A33043', '配件换货', 2, '3108E8A2E5C443BD89B413D72CC23262', 'B1AE02248D0A43BAAE275C9411FFB903', 6, '');
INSERT INTO `sys_menu` VALUES ('748EBE8CC7F141E1B5DC55518CB6B23F', '配件型号管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', '044F1AF835DE41D49E3CD7D458EC88A9', 13, '');
INSERT INTO `sys_menu` VALUES ('7812E5294DC6406D8229D384F2D538AA', '手机入库', 2, '3108E8A2E5C443BD89B413D72CC23262', '3008227DA614435A875F6FCDBF40CF53', 1, 'mobileStorage');
INSERT INTO `sys_menu` VALUES ('7952ADCE8BE94659903BF32E3737A322', '角色管理', 2, '3E0FA41A27874D6BABE3F02C552FAA07', '0CEEF819CE984E679D65FF7B8F60BFCD', 2, '显示角色列表');
INSERT INTO `sys_menu` VALUES ('896ADEE7EFC345748E1EA5FF8DC0C1C4', '配置管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', 'BFAF2F1C7F4B4892B9AA85E243D738BE', 11, '手机基础设置');
INSERT INTO `sys_menu` VALUES ('8B2ADEFD065648D8BFBE73BEB62AE83E', '手机保价', 2, '3108E8A2E5C443BD89B413D72CC23262', '8DDBE487A1554B24BA1D6FEDA1060C3C', 10, '');
INSERT INTO `sys_menu` VALUES ('933383AFB268462A9054E0C7EAF99030', '对账单', 2, '3108E8A2E5C443BD89B413D72CC23262', '0C2C597331A549769AD008344BB125D0', 13, '');
INSERT INTO `sys_menu` VALUES ('98BE1D75CDF54D18A84923BC74A946A1', '客户类别管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', 'FF72ADAA77074F5292D0A528D0822705', 6, '');
INSERT INTO `sys_menu` VALUES ('9946C289C49D4ADD93E9EB7B6E3AA9BE', '退出系统', 2, '3E0FA41A27874D6BABE3F02C552FAA07', '819AFD28DF284BCB84D5C57D6BB9B594', 8, '');
INSERT INTO `sys_menu` VALUES ('9F5250BD90D74A278ABC8112293A5C7C', '颜色管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', 'E71F4C5235F34BABAD0B2D7E11F527E8', 10, '手机基础设置');
INSERT INTO `sys_menu` VALUES ('9F9BB192B89E402C98E143E69DFAF7AA', '配件入库', 2, '3108E8A2E5C443BD89B413D72CC23262', 'C3A35B2B56CD4918BBFB40DE7217C7B7', 2, '');
INSERT INTO `sys_menu` VALUES ('ACB72617219F474DBC60CA01DC74D4A2', '用户管理', 2, '3E0FA41A27874D6BABE3F02C552FAA07', '15427E2887F9478D9D734F1FD264151A', 3, '');
INSERT INTO `sys_menu` VALUES ('B72883980749409999720272F6D5841C', '上家换机', 2, '3108E8A2E5C443BD89B413D72CC23262', '9223B77EDCF546CA8944C67D636277BD', 4, '');
INSERT INTO `sys_menu` VALUES ('B8A300772ECD425FA6F101D922C2DB06', '账户业务', 1, 'root', NULL, 6, '');
INSERT INTO `sys_menu` VALUES ('BE2E58BAFA8E4AF19E42FCB32BFBB4F0', '日志管理', 2, '3E0FA41A27874D6BABE3F02C552FAA07', 'A886DA9DD9AB4A2682713DE8510E9F2F', 5, '');
INSERT INTO `sys_menu` VALUES ('C0AF0B9E269842239DABAEFF7CBC913A', '配件退货', 2, '3108E8A2E5C443BD89B413D72CC23262', '8D4C935FF36C45BAA3327E0D9A57CF4B', 5, '');
INSERT INTO `sys_menu` VALUES ('C6CB628964FB453EB7362BA20DE422FA', '供应商类别管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', '9CC2AA30FD924F3BA5F0F829727DB5C8', 4, '');
INSERT INTO `sys_menu` VALUES ('CD0482DCFF374B4DA16225967895D8AF', '付款', 2, '3108E8A2E5C443BD89B413D72CC23262', '2484F71D8B63484DA9639AF76EB163CD', 12, '');
INSERT INTO `sys_menu` VALUES ('D012F1DD21F1473B838382E04A011BF7', '其它业务', 1, 'root', '', 8, '');
INSERT INTO `sys_menu` VALUES ('D5DBBFDE5EC549FF8E179C505C7B662A', '权限管理', 2, '3E0FA41A27874D6BABE3F02C552FAA07', 'B49B30EA330F4D818237A558897F1B27', 4, '这是权限管理');
INSERT INTO `sys_menu` VALUES ('D6386F1DE9FB47A6857AC1C0018109F5', '-- 分隔线 --', 3, '3108E8A2E5C443BD89B413D72CC23262', NULL, 7, '');
INSERT INTO `sys_menu` VALUES ('EF99DA4BBF394222A73C4B9DA87DA100', '手机退货', 2, '3108E8A2E5C443BD89B413D72CC23262', '0F4925205C8341DF83B7D0A11F3C6DD5', 3, '');
INSERT INTO `sys_menu` VALUES ('F413BD8683B54A67B1A2C5380A391854', '-- 分隔线 --', 3, '3E0FA41A27874D6BABE3F02C552FAA07', 'undefined', 6, '这是分割线');
INSERT INTO `sys_menu` VALUES ('FBE4F586D926425AB7D7593F3EAF73A8', '账户管理', 2, '1A29CDD70FF14348BE8806CB56FEA77E', 'BD171B799F6D4E78BF84E2862D1DCE19', 16, '公司账户');
INSERT INTO `sys_menu` VALUES ('root', '手机进销存系统', 1, '', 'a0', 0, '菜单根');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('02C31CB8F1204EF7984B1EFA5D77207C', '系统管理员', 1, '所有权限');
INSERT INTO `sys_role` VALUES ('030B18622DFA478C88129899D9E56ED8', 'CTO', 1, '这是技术经理。');
INSERT INTO `sys_role` VALUES ('32B4C75CA124443F8812299624CEF219', '商务经理', 1, '');
INSERT INTO `sys_role` VALUES ('82888F565F5747D3B41B9FBB94ED408A', '店长', 1, '店长');
INSERT INTO `sys_role` VALUES ('AA6124637C1241DC97FD855CC8401267', '技术员', 1, '技术部');
INSERT INTO `sys_role` VALUES ('C968B245101E4687A476AE7582ED1620', '财务人员', 1, '财务部');
INSERT INTO `sys_role` VALUES ('FE3C747252B14163AC962623EFA4B850', '销售人员', 1, '销售部');

-- ----------------------------
-- Table structure for sys_role_action
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_action`;
CREATE TABLE `sys_role_action`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roleId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `actionId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_action
-- ----------------------------
INSERT INTO `sys_role_action` VALUES ('083D5C68EF5D4B119BC9CF69744D626A', '02C31CB8F1204EF7984B1EFA5D77207C', '0F4925205C8341DF83B7D0A11F3C6DD5');
INSERT INTO `sys_role_action` VALUES ('0DEFD3FCB8684D2B8C148DBC01AFA027', '02C31CB8F1204EF7984B1EFA5D77207C', 'B1AE02248D0A43BAAE275C9411FFB903');
INSERT INTO `sys_role_action` VALUES ('0EF4E180750A4B9A8D5108DB00DACDEB', '02C31CB8F1204EF7984B1EFA5D77207C', '932AD6493FE84278ABF9714DCE67252F');
INSERT INTO `sys_role_action` VALUES ('19996556E22A464B89F5220E37405914', '02C31CB8F1204EF7984B1EFA5D77207C', 'BFAF2F1C7F4B4892B9AA85E243D738BE');
INSERT INTO `sys_role_action` VALUES ('29309DA7437E42DEB950453CFBF79632', '02C31CB8F1204EF7984B1EFA5D77207C', 'C3A35B2B56CD4918BBFB40DE7217C7B7');
INSERT INTO `sys_role_action` VALUES ('2A281059305143BB987644E092914A3A', '02C31CB8F1204EF7984B1EFA5D77207C', 'D8DE53EC60B84962BD2D08DE992A52F0');
INSERT INTO `sys_role_action` VALUES ('30993534498C490892F2B8BC9D037C2B', '02C31CB8F1204EF7984B1EFA5D77207C', '532145EE5140486DBE72F0ED95B6AA12');
INSERT INTO `sys_role_action` VALUES ('31EDE116579D44D88447124C9B987D55', '32B4C75CA124443F8812299624CEF219', '7F42531633B14474B43038FAAE5DC44A');
INSERT INTO `sys_role_action` VALUES ('368251F19CD7498EACD56EE2D52B500D', '02C31CB8F1204EF7984B1EFA5D77207C', '9223B77EDCF546CA8944C67D636277BD');
INSERT INTO `sys_role_action` VALUES ('3AA3CB9820FC43A8A0EDF2C37513D21E', '02C31CB8F1204EF7984B1EFA5D77207C', '92C65D688A48462190F9E3199978A271');
INSERT INTO `sys_role_action` VALUES ('40296B6722F4475CA9ABEC6860F0E773', '02C31CB8F1204EF7984B1EFA5D77207C', '5FBDF1FD0CE64478AD72CC6D757EDF84');
INSERT INTO `sys_role_action` VALUES ('417F5628487D47EBB5F2D8FA4652E902', '02C31CB8F1204EF7984B1EFA5D77207C', 'E71F4C5235F34BABAD0B2D7E11F527E8');
INSERT INTO `sys_role_action` VALUES ('5E2EBA53E36A4E56926D378A77EC09E4', 'AA6124637C1241DC97FD855CC8401267', '819AFD28DF284BCB84D5C57D6BB9B594');
INSERT INTO `sys_role_action` VALUES ('5E56442AC2914021BF2458B32807DB9E', '02C31CB8F1204EF7984B1EFA5D77207C', '7F42531633B14474B43038FAAE5DC44A');
INSERT INTO `sys_role_action` VALUES ('5E63626AE5D7433881D43E5B27E2EF09', '02C31CB8F1204EF7984B1EFA5D77207C', 'B49B30EA330F4D818237A558897F1B27');
INSERT INTO `sys_role_action` VALUES ('62209AE9122E4A76A75C1AD5FF09D8AE', '02C31CB8F1204EF7984B1EFA5D77207C', 'FF72ADAA77074F5292D0A528D0822705');
INSERT INTO `sys_role_action` VALUES ('6A00DB2EEC394734863054D9C2861C57', '02C31CB8F1204EF7984B1EFA5D77207C', '4260C6E4F9264D98A7D9C6959EFD9E51');
INSERT INTO `sys_role_action` VALUES ('72184C90166C48CEA23D6554E8D18D50', '32B4C75CA124443F8812299624CEF219', '532145EE5140486DBE72F0ED95B6AA12');
INSERT INTO `sys_role_action` VALUES ('755A499167E34CEBB75208BB71AA0C75', '02C31CB8F1204EF7984B1EFA5D77207C', '8DDBE487A1554B24BA1D6FEDA1060C3C');
INSERT INTO `sys_role_action` VALUES ('7D31A850B3E44D929B374088DA7EC3DE', '02C31CB8F1204EF7984B1EFA5D77207C', '9CC2AA30FD924F3BA5F0F829727DB5C8');
INSERT INTO `sys_role_action` VALUES ('7E4931DD9F5F4703AD393420A8F1388D', 'AA6124637C1241DC97FD855CC8401267', 'A886DA9DD9AB4A2682713DE8510E9F2F');
INSERT INTO `sys_role_action` VALUES ('839507AAEE9E452DB66091A28A5F5738', '32B4C75CA124443F8812299624CEF219', '819AFD28DF284BCB84D5C57D6BB9B594');
INSERT INTO `sys_role_action` VALUES ('8E6AAC7ED9E34DE393676CA05C5AA9C5', '02C31CB8F1204EF7984B1EFA5D77207C', '8D4C935FF36C45BAA3327E0D9A57CF4B');
INSERT INTO `sys_role_action` VALUES ('9B24B00F32A643DBA0BBFED2FB83C447', '02C31CB8F1204EF7984B1EFA5D77207C', '5CDB1667EDC342248A96730E51B1488D');
INSERT INTO `sys_role_action` VALUES ('9BDF863D81CC4A72901E6BF865A4514A', '02C31CB8F1204EF7984B1EFA5D77207C', '044F1AF835DE41D49E3CD7D458EC88A9');
INSERT INTO `sys_role_action` VALUES ('A09BD5C08D9442829F5C45BFB8808A2C', '02C31CB8F1204EF7984B1EFA5D77207C', 'BD171B799F6D4E78BF84E2862D1DCE19');
INSERT INTO `sys_role_action` VALUES ('A2656A1E6077430FA6CA8B7D4D1D6741', '02C31CB8F1204EF7984B1EFA5D77207C', '5B5006ADEE5E4121BC79BD08DA0E061A');
INSERT INTO `sys_role_action` VALUES ('ABC2103DD7C04A2EAF5FB1FD0AD6AFDC', '02C31CB8F1204EF7984B1EFA5D77207C', '0CEEF819CE984E679D65FF7B8F60BFCD');
INSERT INTO `sys_role_action` VALUES ('B00CAF3AF31C423289D49C3AB2F90F7C', '02C31CB8F1204EF7984B1EFA5D77207C', 'FE1D1F656BB9415D9AE322E35410DF69');
INSERT INTO `sys_role_action` VALUES ('B0EF08DC82314ED8ADCAD9267154EDB8', '02C31CB8F1204EF7984B1EFA5D77207C', 'A886DA9DD9AB4A2682713DE8510E9F2F');
INSERT INTO `sys_role_action` VALUES ('B86E832917114F759AC04C5F270B7AA7', '02C31CB8F1204EF7984B1EFA5D77207C', 'C9F5C6851B5642A29402DBB0FE872A1A');
INSERT INTO `sys_role_action` VALUES ('C770081254A64928AEC4A9093DB77994', '02C31CB8F1204EF7984B1EFA5D77207C', '819AFD28DF284BCB84D5C57D6BB9B594');
INSERT INTO `sys_role_action` VALUES ('D2A814238F19403AB96C49AD33B5AEC2', '02C31CB8F1204EF7984B1EFA5D77207C', '3008227DA614435A875F6FCDBF40CF53');
INSERT INTO `sys_role_action` VALUES ('D5BCA40DF0AD487598820AC39003B730', '02C31CB8F1204EF7984B1EFA5D77207C', '2484F71D8B63484DA9639AF76EB163CD');
INSERT INTO `sys_role_action` VALUES ('E090C868416E4D77B461C074A6FA3EB5', '02C31CB8F1204EF7984B1EFA5D77207C', '0C2C597331A549769AD008344BB125D0');
INSERT INTO `sys_role_action` VALUES ('EB60846A74AE4FE5AD578B2DC28D04CC', '02C31CB8F1204EF7984B1EFA5D77207C', '4E283D7758EA4DA4B7F3D5751771B83C');
INSERT INTO `sys_role_action` VALUES ('EDE0CEC192B24332A0BA3E428EB5C202', '02C31CB8F1204EF7984B1EFA5D77207C', '44DF836F0C2B4873B6E658E8A73EF9B9');
INSERT INTO `sys_role_action` VALUES ('F60D15A7201049CA89182152C81FCEAC', 'AA6124637C1241DC97FD855CC8401267', '532145EE5140486DBE72F0ED95B6AA12');
INSERT INTO `sys_role_action` VALUES ('FDE0DDB5342D49A2B87211E96E51E23A', '32B4C75CA124443F8812299624CEF219', '5CDB1667EDC342248A96730E51B1488D');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roleId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menuId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('00A4D2C53C28445283E218A429D26FF7', '02C31CB8F1204EF7984B1EFA5D77207C', '522717FF1BD145068D464BA5F9F5743A');
INSERT INTO `sys_role_menu` VALUES ('0112F7051D9C4FA68D607129E7C6A977', '02C31CB8F1204EF7984B1EFA5D77207C', '2B82868A0EAA45F6B1728328764247DD');
INSERT INTO `sys_role_menu` VALUES ('0241CB7FD5C941A6811610458C30F8DC', 'AA6124637C1241DC97FD855CC8401267', '3E0FA41A27874D6BABE3F02C552FAA07');
INSERT INTO `sys_role_menu` VALUES ('02F5C2778CE24D21947746571043DBF7', '02C31CB8F1204EF7984B1EFA5D77207C', '98BE1D75CDF54D18A84923BC74A946A1');
INSERT INTO `sys_role_menu` VALUES ('0BDCE426D7CD419291123E6373A85107', '02C31CB8F1204EF7984B1EFA5D77207C', '5F0D2570016B41D18E0CEB83FF8F2AE5');
INSERT INTO `sys_role_menu` VALUES ('1CCBEDA2DCBA48A2B851F1592B249D49', '02C31CB8F1204EF7984B1EFA5D77207C', 'C6CB628964FB453EB7362BA20DE422FA');
INSERT INTO `sys_role_menu` VALUES ('1CD4778ED7374CE3BF1269EE1C636083', '02C31CB8F1204EF7984B1EFA5D77207C', 'B8A300772ECD425FA6F101D922C2DB06');
INSERT INTO `sys_role_menu` VALUES ('21B21C010F2E46F9BE48BF35DC6F8488', '32B4C75CA124443F8812299624CEF219', '691BB7442DED45F2A2D36F802C33E7B6');
INSERT INTO `sys_role_menu` VALUES ('22D91FD06C0D4A4F8E4ACD2B62DAC672', '32B4C75CA124443F8812299624CEF219', '1A29CDD70FF14348BE8806CB56FEA77E');
INSERT INTO `sys_role_menu` VALUES ('24288D492EDC436C89687FDF6E695A9F', '02C31CB8F1204EF7984B1EFA5D77207C', '1A29CDD70FF14348BE8806CB56FEA77E');
INSERT INTO `sys_role_menu` VALUES ('24D7CD8D8BFF48C6BEF3A74DB67BF8EC', '02C31CB8F1204EF7984B1EFA5D77207C', '6EC307FA700E41AB8DD27143D8A33043');
INSERT INTO `sys_role_menu` VALUES ('280E0ACEF11944EFA0FDD52E55EA87C1', 'AA6124637C1241DC97FD855CC8401267', '3DD11D14DCCC4EDD8BA59491E25FBDEA');
INSERT INTO `sys_role_menu` VALUES ('2960E24942E94B30B3DB0E11EF5D9A53', '02C31CB8F1204EF7984B1EFA5D77207C', '533F50404E084706A7268ABC328DEFB5');
INSERT INTO `sys_role_menu` VALUES ('2AFD658AF2214BC0940892A9112E605C', '02C31CB8F1204EF7984B1EFA5D77207C', '3E0FA41A27874D6BABE3F02C552FAA07');
INSERT INTO `sys_role_menu` VALUES ('2B40AE034D4049BD8D6FF1F3AC4C4542', '02C31CB8F1204EF7984B1EFA5D77207C', '9946C289C49D4ADD93E9EB7B6E3AA9BE');
INSERT INTO `sys_role_menu` VALUES ('3045D3A9514941F0A1B34A71DD841945', '02C31CB8F1204EF7984B1EFA5D77207C', 'B72883980749409999720272F6D5841C');
INSERT INTO `sys_role_menu` VALUES ('328A420048864355A1987FB13EF328D4', '02C31CB8F1204EF7984B1EFA5D77207C', '66CE47589138475F9FD6C22EF4C9F027');
INSERT INTO `sys_role_menu` VALUES ('3811EBAEF91A48158AEAF395B23FE5D3', 'AA6124637C1241DC97FD855CC8401267', '5F0D2570016B41D18E0CEB83FF8F2AE5');
INSERT INTO `sys_role_menu` VALUES ('392C12D739944A2C8803D1C88C39393D', '02C31CB8F1204EF7984B1EFA5D77207C', '3DD11D14DCCC4EDD8BA59491E25FBDEA');
INSERT INTO `sys_role_menu` VALUES ('3EAA6F7E4E164E2F8984454EB94C024A', '02C31CB8F1204EF7984B1EFA5D77207C', '9F9BB192B89E402C98E143E69DFAF7AA');
INSERT INTO `sys_role_menu` VALUES ('400820F740DA4363B8D87B45CCF8FF4F', '02C31CB8F1204EF7984B1EFA5D77207C', 'root');
INSERT INTO `sys_role_menu` VALUES ('421354DE438C45AABCEAC028D7A1198C', '02C31CB8F1204EF7984B1EFA5D77207C', '1F312FD42DCC48A48528E1285C36F321');
INSERT INTO `sys_role_menu` VALUES ('43D1919224A5445C8DEAAD4118F173E6', '02C31CB8F1204EF7984B1EFA5D77207C', '691BB7442DED45F2A2D36F802C33E7B6');
INSERT INTO `sys_role_menu` VALUES ('4E068788061B47EFBD102D0919EE96B5', '02C31CB8F1204EF7984B1EFA5D77207C', '9F5250BD90D74A278ABC8112293A5C7C');
INSERT INTO `sys_role_menu` VALUES ('5089300D885E4847B8738CE3E4F2C440', '02C31CB8F1204EF7984B1EFA5D77207C', '4BD95DC3380F44B0B280CC11FD31433C');
INSERT INTO `sys_role_menu` VALUES ('5BBB697E0AAF44CC8F2C93188BD04988', '02C31CB8F1204EF7984B1EFA5D77207C', 'EF99DA4BBF394222A73C4B9DA87DA100');
INSERT INTO `sys_role_menu` VALUES ('6287B6889B7E46D2B6D03FBF8FF04130', '02C31CB8F1204EF7984B1EFA5D77207C', '63D2CACCF63E4AA8B72194C3851B0A78');
INSERT INTO `sys_role_menu` VALUES ('62FF8AD0E1504B46AE74A609AC9CFBF2', '02C31CB8F1204EF7984B1EFA5D77207C', '3B814410C63849DEAA88106D3CDBA695');
INSERT INTO `sys_role_menu` VALUES ('66DDFF1E12614AE393AF7DCCA0255CAE', 'AA6124637C1241DC97FD855CC8401267', 'root');
INSERT INTO `sys_role_menu` VALUES ('6D795CDA01204458BB01B0DE079EC8DD', '02C31CB8F1204EF7984B1EFA5D77207C', '24C6CAB6D19949C08060D56C2CDCE6FA');
INSERT INTO `sys_role_menu` VALUES ('6DF468CF3DBD41DE825E09A373DA829E', '02C31CB8F1204EF7984B1EFA5D77207C', 'BE2E58BAFA8E4AF19E42FCB32BFBB4F0');
INSERT INTO `sys_role_menu` VALUES ('72AFEEF161544ED0AC85CA95B168A435', '02C31CB8F1204EF7984B1EFA5D77207C', '694819DEB27249EBADAC1CC284A2C84B');
INSERT INTO `sys_role_menu` VALUES ('7A2964F5A60D4D2BB3CB615341CCEC05', '02C31CB8F1204EF7984B1EFA5D77207C', '3108E8A2E5C443BD89B413D72CC23262');
INSERT INTO `sys_role_menu` VALUES ('7DD8E6B29D5A4A2B9DBC7B95F5AE39CE', '32B4C75CA124443F8812299624CEF219', '5F0D2570016B41D18E0CEB83FF8F2AE5');
INSERT INTO `sys_role_menu` VALUES ('7FDA94135CF34489B82D04C4318BB335', '02C31CB8F1204EF7984B1EFA5D77207C', '0ED688E8C9C64A189488A6EFFDC756ED');
INSERT INTO `sys_role_menu` VALUES ('8769200152A149E4BA2C9C9AF9AA6F2D', '02C31CB8F1204EF7984B1EFA5D77207C', 'FBE4F586D926425AB7D7593F3EAF73A8');
INSERT INTO `sys_role_menu` VALUES ('87922EBEC4D24FEE80F9D2B70BC92D40', '32B4C75CA124443F8812299624CEF219', 'F413BD8683B54A67B1A2C5380A391854');
INSERT INTO `sys_role_menu` VALUES ('89F1AB0E7C3C406F934BDBC1918009A0', 'AA6124637C1241DC97FD855CC8401267', '9946C289C49D4ADD93E9EB7B6E3AA9BE');
INSERT INTO `sys_role_menu` VALUES ('8DFD276253E34ED0A502AE6D11F8ED37', '02C31CB8F1204EF7984B1EFA5D77207C', 'ACB72617219F474DBC60CA01DC74D4A2');
INSERT INTO `sys_role_menu` VALUES ('94F737C1CA52461B9EC06C688F4EE413', '02C31CB8F1204EF7984B1EFA5D77207C', '5BBE507F8451446DAAE0085EBC9DCD74');
INSERT INTO `sys_role_menu` VALUES ('99B53207889F455E8CE9EFEFF7625BD2', '02C31CB8F1204EF7984B1EFA5D77207C', 'F413BD8683B54A67B1A2C5380A391854');
INSERT INTO `sys_role_menu` VALUES ('9F1976069C3E4F888B90F338E94E6172', '02C31CB8F1204EF7984B1EFA5D77207C', '7812E5294DC6406D8229D384F2D538AA');
INSERT INTO `sys_role_menu` VALUES ('9F1D607114BF42ECA92016EF6C5AF49B', '32B4C75CA124443F8812299624CEF219', 'root');
INSERT INTO `sys_role_menu` VALUES ('A684F005D47E4F0BAE417CA0A1708D8A', 'AA6124637C1241DC97FD855CC8401267', 'D012F1DD21F1473B838382E04A011BF7');
INSERT INTO `sys_role_menu` VALUES ('B402EC48516644299CB7C06E20ECA1A1', '02C31CB8F1204EF7984B1EFA5D77207C', '7952ADCE8BE94659903BF32E3737A322');
INSERT INTO `sys_role_menu` VALUES ('B6DC696A60104C5294CF6FFF024DEAC7', '32B4C75CA124443F8812299624CEF219', '9946C289C49D4ADD93E9EB7B6E3AA9BE');
INSERT INTO `sys_role_menu` VALUES ('B96DE7A5986E4F949E8597864A3D46D1', '02C31CB8F1204EF7984B1EFA5D77207C', '0AC72214D36F4B69B02EC662A055E0DF');
INSERT INTO `sys_role_menu` VALUES ('BA7DA53F13474147910B8D3E042670E5', 'AA6124637C1241DC97FD855CC8401267', 'F413BD8683B54A67B1A2C5380A391854');
INSERT INTO `sys_role_menu` VALUES ('BB656862D90346E7B2A02E7F7C2F6049', '02C31CB8F1204EF7984B1EFA5D77207C', 'D6386F1DE9FB47A6857AC1C0018109F5');
INSERT INTO `sys_role_menu` VALUES ('BC094668BF8B49AD9F659FEA66EE7B95', '02C31CB8F1204EF7984B1EFA5D77207C', 'CD0482DCFF374B4DA16225967895D8AF');
INSERT INTO `sys_role_menu` VALUES ('C05EEAAB02A4422897912FE87F285297', '02C31CB8F1204EF7984B1EFA5D77207C', 'D012F1DD21F1473B838382E04A011BF7');
INSERT INTO `sys_role_menu` VALUES ('C8CE11A151C74A18BA37CF3AA3812F5E', '02C31CB8F1204EF7984B1EFA5D77207C', '748EBE8CC7F141E1B5DC55518CB6B23F');
INSERT INTO `sys_role_menu` VALUES ('D7C792300DC645299770C469219E7D13', '02C31CB8F1204EF7984B1EFA5D77207C', 'C0AF0B9E269842239DABAEFF7CBC913A');
INSERT INTO `sys_role_menu` VALUES ('D971830F1EFD48AB92C23B1A85A3CD85', '02C31CB8F1204EF7984B1EFA5D77207C', '933383AFB268462A9054E0C7EAF99030');
INSERT INTO `sys_role_menu` VALUES ('DA31D708457A48FCA2ACFED0B754F7C8', '02C31CB8F1204EF7984B1EFA5D77207C', '8B2ADEFD065648D8BFBE73BEB62AE83E');
INSERT INTO `sys_role_menu` VALUES ('DF7479CB5C624F8090E1757115ADAFB7', '02C31CB8F1204EF7984B1EFA5D77207C', 'D5DBBFDE5EC549FF8E179C505C7B662A');
INSERT INTO `sys_role_menu` VALUES ('E8390DD34D75446D9D3CEBDD270C81BA', '02C31CB8F1204EF7984B1EFA5D77207C', '022606F27FDD4CE7BFF3BABE16872D2C');
INSERT INTO `sys_role_menu` VALUES ('E8A6F2EFBFE5412D8DC0942C0C6F82CB', '02C31CB8F1204EF7984B1EFA5D77207C', '896ADEE7EFC345748E1EA5FF8DC0C1C4');
INSERT INTO `sys_role_menu` VALUES ('F109B5E5C74B4DB49DAE4AB74CBE2163', 'AA6124637C1241DC97FD855CC8401267', 'BE2E58BAFA8E4AF19E42FCB32BFBB4F0');
INSERT INTO `sys_role_menu` VALUES ('F1F1E6420EFC4EF786C42E1549DB17C2', '32B4C75CA124443F8812299624CEF219', '3E0FA41A27874D6BABE3F02C552FAA07');
INSERT INTO `sys_role_menu` VALUES ('F7B859300FD048A9B5D8AFABC211003F', '32B4C75CA124443F8812299624CEF219', '5BBE507F8451446DAAE0085EBC9DCD74');
INSERT INTO `sys_role_menu` VALUES ('F839F49FBC5546B5A7CED7868B34101F', '02C31CB8F1204EF7984B1EFA5D77207C', '5007F80E96F04832915F0BEBB7E7689F');
INSERT INTO `sys_role_menu` VALUES ('F96BD4F886A24584BBEB91E9FB2CAD00', '02C31CB8F1204EF7984B1EFA5D77207C', '5EABD82C979847EC97457947E1BFDD89');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roleId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('234CDCD6D6C1476ABB39175B87D31CBB', 'AA6124637C1241DC97FD855CC8401267', '84D1E33948DA486D85B08C21AAC7BA59');
INSERT INTO `sys_role_user` VALUES ('414340071C324FA4B3E81C026E01FB6D', '32B4C75CA124443F8812299624CEF219', '84D1E33948DA486D85B08C21AAC7BA59');
INSERT INTO `sys_role_user` VALUES ('632CA19E41A94F60BEC41ED45899C677', 'C968B245101E4687A476AE7582ED1620', '84D1E33948DA486D85B08C21AAC7BA59');
INSERT INTO `sys_role_user` VALUES ('C2C4F3A299BB411CB3AAC940DA931854', 'AA6124637C1241DC97FD855CC8401267', '9E304DAFFC4B40788477A61D1D99B510');
INSERT INTO `sys_role_user` VALUES ('D36BCDC46DAA49AA8397B51C2E757F7E', '02C31CB8F1204EF7984B1EFA5D77207C', '84D1E33948DA486D85B08C21AAC7BA59');
INSERT INTO `sys_role_user` VALUES ('D5183EE7EDB345C7BA3232A7249C8A4F', '82888F565F5747D3B41B9FBB94ED408A', '84D1E33948DA486D85B08C21AAC7BA59');
INSERT INTO `sys_role_user` VALUES ('DEC66CAB64DC4126BD92E28C1CAFF21B', '32B4C75CA124443F8812299624CEF219', '703368B5B8FF40F3AC92F347D76CBF92');
INSERT INTO `sys_role_user` VALUES ('E9607D5D95734735AFEED4C651D85414', '030B18622DFA478C88129899D9E56ED8', '84D1E33948DA486D85B08C21AAC7BA59');
INSERT INTO `sys_role_user` VALUES ('F50419E4693B4120B8D9AE4E92E8A92A', 'FE3C747252B14163AC962623EFA4B850', '84D1E33948DA486D85B08C21AAC7BA59');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  `skin` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employeeId` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `queryScope` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('703368B5B8FF40F3AC92F347D76CBF92', 'java', 'd2FuZ2Fu', 1, '开发部', '2017-03-18 14:13:44', 'default', '92695BBC5575446EB1A109A0C2F0590A', '65EBF040B74E4E73B3D7C475F01AFDC8');
INSERT INTO `sys_user` VALUES ('84D1E33948DA486D85B08C21AAC7BA59', 'wangan', 'd2FuZ2Fu', 1, '综合部', '2017-03-17 18:39:26', 'default', 'BC18434ABFBC4B958A6E0EEF2EAB8F7F', '47DAF9B6E0F54A7FAC847F209719E913,5106D66DE2AD42B5986F944D8E865444,B92AE7713BBF4FD38A997F92B33D98C9');
INSERT INTO `sys_user` VALUES ('9E304DAFFC4B40788477A61D1D99B510', 'jishu', 'd2FuZ2Fu', 1, '管理技术部门', '2017-03-17 18:46:47', 'default', '4ECC27BC694D47318BD85D21F4F274A5', '65EBF040B74E4E73B3D7C475F01AFDC8');

SET FOREIGN_KEY_CHECKS = 1;
