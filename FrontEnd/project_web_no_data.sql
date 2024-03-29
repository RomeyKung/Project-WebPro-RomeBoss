CREATE TABLE `Publisher` (
  `pub_id` INT(10),
  `pub_name` VARCHAR(255),
  `pub_phone` VARCHAR(255),
  `pub_url` VARCHAR(255),
  PRIMARY KEY (`pub_id`),
  KEY `NN` (`pub_name`, `pub_phone`, `pub_url`)
);

CREATE TABLE `Author` (
  `author_id` INT(10),
  `author_fn` VARCHAR(255),
  `author_ln` VARCHAR(255),
  `author_alias` VARCHAR(255),
  PRIMARY KEY (`author_id`),
  KEY `NN` (`author_fn`, `author_ln`, `author_alias`)
);

CREATE TABLE `Book` (
  `book_id` INT(10),
  `book_name` VARCHAR(255),
  `book_desc` VARCHAR(255),
  `book_img` VARCHAR(255),
  `author_id` INT(10),
  `pub_id` INT(10),
  PRIMARY KEY (`book_id`),
  FOREIGN KEY (`pub_id`) REFERENCES `Publisher`(`pub_id`),
  FOREIGN KEY (`author_id`) REFERENCES `Author`(`author_id`),
  KEY `NN` (`book_name`, `book_desc`, `book_img`)
);

CREATE TABLE `favorite` (
  `fav_id` INT(10),
  `user_id` INT(10),
  `book_id` INT(10),
  PRIMARY KEY (`fav_id`),
  FOREIGN KEY (`book_id`) REFERENCES `Book`(`book_id`)
);

CREATE TABLE `Chapter` (
  `book_id` INT(10),
  `chapter` INT(10),
  `chapter_story` VARCHAR(255),
  PRIMARY KEY (`book_id`, `chapter`),
  FOREIGN KEY (`book_id`) REFERENCES `Book`(`book_id`),
  KEY `NN` (`chapter_story`)
);

CREATE TABLE `Book Type` (
  `book_type_id` INT(10),
  `book_type_name` VARCHAR(255),
  PRIMARY KEY (`book_type_id`),
  KEY `NN` (`book_type_name`)
);

CREATE TABLE `Book with Type` (
  `book_id` INT(10) ,
  `book_type_id` INT(10),
  FOREIGN KEY (`book_id`) REFERENCES `Book`(`book_id`),
  FOREIGN KEY (`book_type_id`) REFERENCES `Book Type`(`book_type_id`)
);

CREATE TABLE `buy_history` (
  `history_id` INT(10),
  `user_id` INT(10),
  `book_id` INT(10),
  `his_page` INT(10),
  PRIMARY KEY (`history_id`),
  FOREIGN KEY (`book_id`) REFERENCES `Book`(`book_id`)
);

CREATE TABLE `Customer` (
  `customer_id` INT(10),
  `customer_username` VARCHAR(15),
  `customer_password` VARCHAR(10),
  `customer_firstN` VARCHAR(10),
  `customer_lastN` VARCHAR(10),
  `customer_email` VARCHAR(30),
  `customer_phone` VARCHAR(10),
  `customer_pic` VARCHAR(255),
  `customer_displayname` VARCHAR(20),
  `package_id` INT(10),
  `payment_id` INT(10),
  `history_id` INT(10),
  `fav_id` INT(10),
  `status` ENUM('R', 'NR'),
  PRIMARY KEY (`customer_id`),
  FOREIGN KEY (`history_id`) REFERENCES `buy_history`(`history_id`),
  FOREIGN KEY (`fav_id`) REFERENCES `favorite`(`fav_id`),
  KEY `NN` (`customer_username`, `customer_password`, `customer_firstN`, `customer_lastN`, `customer_email`, `customer_phone`, `customer_displayname`, `status`),
  KEY `UQ` (`customer_username`, `customer_email`)
);

CREATE TABLE `package` (
  `pack_id` INT(10),
  `price` INT(10),
  `pack_name` VARCHAR(255),
  PRIMARY KEY (`pack_id`),
  KEY `NN` (`price`, `pack_name`)
);

CREATE TABLE `buy_package` (
  `pay_id` INT(10),
  `pack_id` INT(10),
  `pack_start` Date,
  `pack_end` Date,
  `customer_id` INT(10),
  `pay_cardname` VARCHAR(255),
  `pay_expiry` DATE,
  `pay_secretcode` INT(6),
  PRIMARY KEY (`pay_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`),
  FOREIGN KEY (`pack_id`) REFERENCES `package`(`pack_id`),
  KEY `NN` (`pack_start`, `pack_end`, `pay_cardname`, `pay_expiry`, `pay_secretcode`)
);

CREATE TABLE `Admin` (
  `admin_username` VARCHAR(255),
  `admin_password` VARCHAR(255),
  `admin_email` VARCHAR(255),
  PRIMARY KEY (`admin_username`),
  KEY `NN` (`admin_password`, `admin_email`),
  KEY `UQ` (`admin_email`)
);

