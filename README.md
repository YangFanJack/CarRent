# CarRent

#  汽车租赁系统

## 功能

* 管理员：
  * 汽车增、删、改
  * 所有申请的订单查看
  * 所有申请的订单拒绝和接受

* 普通用户：
  * 汽车查询
  * 订单提交
* 游客：
  * 浏览首页的汽车信息

## 项目模块

* 首页公共模块：
  - [x] 普通用户注册
  - [x] 普通用户登录
  - [x] 管理员登录
* 管理员模块：
  - [x] 管理员注册
  - [ ] 普通用户注册
  - [ ] 普通用户查询
  - [ ] 管理员用户查询

## 页面

* 汽车租赁网首页（以polo360为模板）
* 用户登录
* 用户注册
* 管理员登录
* 用户管理界面
  * 查询汽车信息（租车查询）
  * 订单提交（我的订单）
* 管理员管理界面
  * 汽车增、删、改（车辆管理）
  * 查看申请的订单（查看订单）
    * 订单的拒绝
    * 订单的接受
  * 查看留言

## 使用技术

* Struts2
* Spring
* Hibernate
* Mysql
* maven

## 数据库建立

### Car

* id
* name
* price
* url
* details
* IsSale
* type

### User

* id

* name
* userName
* password

### Manager

* id

* name
* userName
* password

### Order

* id
* CarId
* UserId
* city
* takeTime
* days
* IsConfirm
* totalPrice

### Message

* id
* name
* mail
* messageItem
* messageContent
* time
* IsRead

### Rent

* id
* Item
* Content

```sql
CREATE TABLE IF NOT EXISTS `t_user`(
   `id` INT AUTO_INCREMENT UNIQUE,
   `userName` VARCHAR(32) NOT NULL UNIQUE,
   `password` VARCHAR(32) NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_manager`(
   `id` INT AUTO_INCREMENT UNIQUE,
   `name` VARCHAR(32) NOT NULL,
   `userName` VARCHAR(32) NOT NULL UNIQUE,
   `password` VARCHAR(32) NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_car`(
   `id` INT AUTO_INCREMENT UNIQUE,
   `name` VARCHAR(32) NOT NULL,
   `price` INT NOT NULL,
   `details` VARCHAR(100) NOT NULL,
   `isSale` INT NOT NULL,
   `type` VARCHAR(32) NOT NULL,
   `url` VARCHAR(50) NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_message`(
   `id` INT AUTO_INCREMENT UNIQUE,
   `userId` INT NOT NULL,
   `name` VARCHAR(32) NOT NULL,
   `mail` VARCHAR(32) NOT NULL,
   `messageItem` VARCHAR(32) NOT NULL,
   `messageContent` VARCHAR(100) NOT NULL,
   `time` DATE NOT NULL,
   `idRead` INT NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_order`(
   `id` INT AUTO_INCREMENT UNIQUE,
   `carId` INT NOT NULL,
   `takeTime` DATE NOT NULL,
   `days` INT NOT NULL,
   `isConfirm` INT NOT NULL,
   `totalConfirm` INT NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_rent`(
   `id` INT AUTO_INCREMENT UNIQUE,
   `item` VARCHAR(32) NOT NULL,
   `content` VARCHAR(200) NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=INNODB DEFAULT CHARSET=utf8;
```