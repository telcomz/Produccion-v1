CREATE DATABASE IF NOT EXISTS emqx;

USE emqx;

CREATE TABLE mqtt_user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  is_superuser TINYINT(1) DEFAULT 0
);

INSERT INTO mqtt_user (username, password, is_superuser)
VALUES ('admin', SHA2('admin_password', 256), 1),
       ('telcomz', SHA2('user1_password', 256), 0);

CREATE TABLE mqtt_acl (
  id INT AUTO_INCREMENT PRIMARY KEY,
  allow INT(1) NOT NULL COMMENT '0: deny, 1: allow',
  username VARCHAR(255),
  topic VARCHAR(255),
  access INT(1) NOT NULL COMMENT '1: subscribe, 2: publish, 3: pubsub'
);

INSERT INTO mqtt_acl (allow, username, topic, access)
VALUES (1, 'admin', '#', 3),
       (1, 'user1', 'home/#', 1);
