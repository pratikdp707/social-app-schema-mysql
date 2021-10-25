
-- creation of schema for social media app 
create schema socialAppSchema;
use socialAppSchema;

-- creation of table for user details
CREATE TABLE `socialappschema`.`user_profile` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `dob` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`));
  
-- creation of profile status table for users
CREATE TABLE `socialappschema`.`profile_status` (
  `user_id` INT NOT NULL,
  `active_status` VARCHAR(45) NOT NULL DEFAULT 'no',
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `socialappschema`.`user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- creation of friends table for user
CREATE TABLE `socialappschema`.`friends` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `friend_id` VARCHAR(45) NOT NULL,
  `friend_name` VARCHAR(45) NOT NULL,
  `user` INT NOT NULL,
  `created_at` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `user`
    FOREIGN KEY (`user`)
    REFERENCES `socialappschema`.`user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
ALTER TABLE `socialappschema`.`friends` 
CHANGE COLUMN `created_at` `created_at` VARCHAR(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ;

ALTER TABLE `socialappschema`.`friends` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ;



-- creation of posts table for user
CREATE TABLE `socialappschema`.`posts` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NOT NULL,
  `user_id_from` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `user_id_from_idx` (`user_id_from` ASC) VISIBLE,
  CONSTRAINT `user_id_from`
    FOREIGN KEY (`user_id_from`)
    REFERENCES `socialappschema`.`user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
ALTER TABLE `socialappschema`.`posts` 
CHANGE COLUMN `created_at` `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ;
    
    
-- creation of comments table for user
CREATE TABLE `socialappschema`.`comments` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id_from` INT NOT NULL,
  `content` VARCHAR(200) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  INDEX `on_post_idx` (`post_id` ASC) VISIBLE,
  INDEX `comment_from_user_idx` (`user_id_from` ASC) VISIBLE,
  CONSTRAINT `on_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `socialappschema`.`posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_from_user`
    FOREIGN KEY (`user_id_from`)
    REFERENCES `socialappschema`.`user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- creation of likes table for user
CREATE TABLE `socialappschema`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `like_on_post_idx` (`post_id` ASC) VISIBLE,
  INDEX `user_liked_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `like_on_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `socialappschema`.`posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_liked`
    FOREIGN KEY (`user_id`)
    REFERENCES `socialappschema`.`user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- creation of login details column for user
CREATE TABLE `socialappschema`.`login_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `login_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `login_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `login_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `socialappschema`.`user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- inserting data into user_profile table
insert into user_profile(user_id,email,username,password,first_name,last_name,gender,dob) values('1','abc@gmail.com','abc','abc123','abc','xyz','male','12-98-2001');
insert into user_profile(email,username,password,first_name,last_name,gender,dob) values('def@gmail.com','def','def123','def','xyz','male','12-12-2003');
insert into user_profile(email,username,password,first_name,last_name,gender,dob) values('ghi@gmail.com','ghi','ghi123','ghi','xyz','male','12-12-2004');
insert into user_profile(email,username,password,first_name,last_name,gender,dob) values('jkl@gmail.com','jkl','jkl123','jkl','xyz','male','12-12-2005');
insert into user_profile(email,username,password,first_name,last_name,gender,dob) values('mno@gmail.com','mno','mno123','mno','xyz','male','12-12-2006'); 
 
-- inserting data into profile_status table 
insert into profile_status(user_id, active_status) values(1,'yes');
insert into profile_status(user_id) values(2);
insert into profile_status(user_id, active_status) values(3,'yes');
insert into profile_status(user_id, active_status) values(4,'yes');
insert into profile_status(user_id) values(5);   

-- inserting data into login details table
insert into login_details(user_id) values(1);
insert into login_details(user_id) values(2);
insert into login_details(user_id) values(3);
insert into login_details(user_id) values(4);
insert into login_details(user_id) values(5);
insert into login_details(user_id) values(1);
insert into login_details(user_id) values(3);
insert into login_details(user_id) values(4);

-- inserting data into friends table
insert into friends(friend_id, friend_name, user) values(1, 'abc', 2);
insert into friends(friend_id, friend_name, user) values(1, 'abc', 4);
insert into friends(friend_id, friend_name, user) values(2, 'def', 1);
insert into friends(friend_id, friend_name, user) values(4, 'jkl', 1);
insert into friends(friend_id, friend_name, user) values(10, 'asa', 1);
insert into friends(friend_id, friend_name, user) values(22, 'yybgf', 5);

-- inserting data into posts table
insert into posts(content, user_id_from) values('Pakistan defeats India for the very first time',1);
insert into posts(content, user_id_from) values('Will Aryan Khan get bail ? ',2);
insert into posts(content, user_id_from) values('Is Ananya Panday involved in drugs racket?',4);
insert into posts(content, user_id_from) values('Ajay Pawar asks BJP to prove the charges agains him !',5);

-- inserting data into comments table
insert into comments(post_id, user_id_from, content) values(1,2,'Well Played Boys!!!');
insert into comments(post_id, user_id_from, content) values(1,4,'Babar and Rizwan just nailed yesterday');
insert into comments(post_id, user_id_from, content) values(2,1,'He should not get bail if he is really involved into this');
insert into comments(post_id, user_id_from, content) values(4,4,'BJP cant prove the charges against Ajay as all the charges are nullable');
insert into comments(post_id, user_id_from, content) values(3,5,'Yes, I heard a news stating Ananya helped Aryan in gettin drugs');
insert into comments(post_id, user_id_from, content) values(1,4,'Hard luck Boys!');
insert into comments(post_id, user_id_from, content) values(4,4,'BJP vs NCP never gonna end!');


-- inserting data into likes table
insert into likes(post_id, user_id) values(1,2);
insert into likes(post_id, user_id) values(1,4);
insert into likes(post_id, user_id) values(2,1);
insert into likes(post_id, user_id) values(2,3);
insert into likes(post_id, user_id) values(3,1);
insert into likes(post_id, user_id) values(3,5);
insert into likes(post_id, user_id) values(4,5);


-- QUERIES

-- 1. in friends table list the data which are matched with user profile id
select distinct friends.friend_id, friend_name from friends JOIN user_profile on friends.friend_id = user_profile.user_id;

-- 2. display all the posts of user id 5
select * from posts where user_id_from = 5;

-- 3. write a query that matching the words or character with %gmail%
select * from user_profile where email like '%gmail%';

-- 4. limit the display data from the table comments for 3 which belongs to user 4
select * from comments where user_id_from = 4 order by created_at desc limit 3;


-- 5. combile profile_status and user_profile and login_details display matchin records
select u.user_id, u.email, u.username, u.first_name, u.last_name, p.active_status, max(l.login_at) from user_profile u, profile_status p, login_details l
where u.user_id=p.user_id and p.active_status = 'yes' and l.user_id = p.user_id group by u.user_id; 
