-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_course
DROP TABLE IF EXISTS `tbl_course`;
CREATE TABLE IF NOT EXISTS `tbl_course` (
  `COURSE_ID` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` bigint(11) unsigned NOT NULL,
  `TITLE` varchar(100) NOT NULL,
  `TEACHER_ID` bigint(11) unsigned NOT NULL,
  `VIDEO_URL` varchar(100) DEFAULT NULL,
  `IMAGE_URL` varchar(100) DEFAULT NULL,
  `CONTENT` text,
  `RATING` double DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `PUSLISH_DATE` datetime DEFAULT NULL,
  `TOTAL_VIEW` int(11) DEFAULT NULL,
  PRIMARY KEY (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table dolphin.tbl_course: ~8 rows (approximately)
INSERT INTO `tbl_course` (`COURSE_ID`, `CATEGORY_ID`, `TITLE`, `TEACHER_ID`, `VIDEO_URL`, `IMAGE_URL`, `CONTENT`, `RATING`, `PRICE`, `PUSLISH_DATE`, `TOTAL_VIEW`) VALUES
	(1, 1, 'Khóa học ABC XyZ\r\n', 1, 'https://www.youtube.com/watch?v=0vYb9TcUo0Q', 'image1.jpg', NULL, 88, 50000, '2016-08-31 22:51:00', 100),
	(2, 1, 'Trở thành Chiến binh Sales', 1, 'https://www.youtube.com/watch?v=xcJtL7QggTI', 'image2.jpg', NULL, 80, 800000, '2016-06-30 23:05:24', 213),
	(3, 3, 'Khám phá năng lực bẩm sinh với khoa học phân tích vân tay', 1, 'https://www.youtube.com/watch?v=4RUGmBxe65U', 'image3.jpg', NULL, 40, 1233554, '2016-07-31 23:05:33', 150),
	(4, 4, 'Bí quyết cân bằng giữa công việc và gia đình', 1, 'https://www.youtube.com/watch?v=iNJdPyoqt8U', 'image4.jpg', NULL, 60, 700000, '2016-10-30 23:05:37', 300),
	(5, 5, 'Tư duy logic và giải quyết vấn đề', 1, 'https://www.youtube.com/watch?v=xDMP3i36naA', 'image5.jpg', 'Bạn là một nhân viên bán hàng và bạn muốn bước lên thêm một bước nữa về kỹ năng bán hàng?\\r\\n\r\n\r\nBạn đã biết gì về những kỹ năng của 1 người bán hàng chuyên nghiệp?\r\n\r\nĐây có thể là một khóa học kỹ năng để giúp bạn thành công hơn trong công việc bán hàng của mình và có thể đây là một bước tiến để bạn bước đến một vị trí cao hơn trong công ty.\r\n\r\nKhóa học Kỹ năng bán hàng chuyên nghiệp được thiết kế để cung cấp cho các bạn 1 cái nhìn tổng quan nhất về nghề bán hàng, về tâm lý, hành vi khách hàng và quy trình bán hàng hiệu quả mà bạn có thể áp dụng trong công việc của mình trong hiện tại hoặc tương lai.\r\nTham gia khóa học bạn sẽ nắm được những kiến thức:\r\n\r\n- Cách thấu hiểu khách hàng bằng xác định đối tượng khách hàng tiềm năng.\r\n\r\n- Phân biệt bán hàng giao dịch và bán hàng dựa trên mối quan hệ.\r\n\r\n- Các yếu tố ảnh hưởng đến tiêu dùng.\r\n\r\n- Xây dựng quy trình bán hàng hiệu quả.', 70, 444444, '2016-05-30 23:06:39', 170),
	(6, 1, '111', 1, 'https://www.youtube.com/watch?v=-g5s4PoiWtk', 'image5.jpg', 'Description', 111, 0, '2016-09-10 07:00:00', 111),
	(7, 1, '111', 1, 'https://www.youtube.com/watch?v=-g5s4PoiWtk', 'image1.jpg', 'Description', 111, 0, '2016-04-10 07:00:00', 111),
	(8, 1, '11111111', 1, 'https://www.youtube.com/watch?v=-g5s4PoiWtk', 'image3.jpg', 'Bạn là một nhân viên bán hàng và bạn muốn bước lên thêm một bước nữa về kỹ năng bán hàng?\r\n\r\nBạn đã biết gì về những kỹ năng của 1 người bán hàng chuyên nghiệp?\r\n\r\nĐây có thể là một khóa học kỹ năng để giúp bạn thành công hơn trong công việc bán hàng của mình và có thể đây là một bước tiến để bạn bước đến một vị trí cao hơn trong công ty.\r\n\r\nKhóa học Kỹ năng bán hàng chuyên nghiệp được thiết kế để cung cấp cho các bạn 1 cái nhìn tổng quan nhất về nghề bán hàng, về tâm lý, hành vi khách hàng và quy trình bán hàng hiệu quả mà bạn có thể áp dụng trong công việc của mình trong hiện tại hoặc tương lai.\r\n\r\nTham gia khóa học bạn sẽ nắm được những kiến thức:\r\n\r\n- Cách thấu hiểu khách hàng bằng xác định đối tượng khách hàng tiềm năng.\r\n\r\n- Phân biệt bán hàng giao dịch và bán hàng dựa trên mối quan hệ.\r\n\r\n- Các yếu tố ảnh hưởng đến tiêu dùng.\r\n\r\n- Xây dựng quy trình bán hàng hiệu quả.', 111, 0, '2016-11-01 07:00:00', 444);


	
--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_course CASCADE;
DROP SEQUENCE IF EXISTS course_id_seq CASCADE;

CREATE SEQUENCE course_id_seq START 1;
ALTER TABLE public.course_id_seq OWNER TO dolphin;

CREATE TABLE tbl_course (
		course_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('course_id_seq'),
		content TEXT,
		image_url VARCHAR(255),
		price FLOAT8 NOT NULL,
		puslish_date TIMESTAMP,
		rating FLOAT8 NOT NULL,
		title VARCHAR(255),
		total_view INT4,
		video_url VARCHAR(255),
		category_id NUMERIC(19 , 2),
		teacher_id INT4
	);
ALTER TABLE tbl_course OWNER TO "dolphin";

alter table tbl_course add column display_order integer;

--Data
INSERT INTO tbl_course (CATEGORY_ID, TITLE, TEACHER_ID, VIDEO_URL, IMAGE_URL, CONTENT, RATING, PRICE, PUSLISH_DATE, TOTAL_VIEW) VALUES
	(1, 'Khóa học ABC XyZ\r\n', 1, 'https://www.youtube.com/watch?v=0vYb9TcUo0Q', 'image1.jpg', NULL, 88, 50000, '2016-08-31 22:51:00', 100),
	(1, 'Trở thành Chiến binh Sales', 1, 'https://www.youtube.com/watch?v=xcJtL7QggTI', 'image2.jpg', NULL, 80, 800000, '2016-06-30 23:05:24', 213),
	(3, 'Khám phá năng lực bẩm sinh với khoa học phân tích vân tay', 1, 'https://www.youtube.com/watch?v=4RUGmBxe65U', 'image3.jpg', NULL, 40, 1233554, '2016-07-31 23:05:33', 150),
	(4, 'Bí quyết cân bằng giữa công việc và gia đình', 1, 'https://www.youtube.com/watch?v=iNJdPyoqt8U', 'image4.jpg', NULL, 60, 700000, '2016-10-30 23:05:37', 300),
	(5, 'Tư duy logic và giải quyết vấn đề', 1, 'https://www.youtube.com/watch?v=xDMP3i36naA', 'image5.jpg', 'Bạn là một nhân viên bán hàng và bạn muốn bước lên thêm một bước nữa về kỹ năng bán hàng?\\r\\n\r\n\r\nBạn đã biết gì về những kỹ năng của 1 người bán hàng chuyên nghiệp?\r\n\r\nĐây có thể là một khóa học kỹ năng để giúp bạn thành công hơn trong công việc bán hàng của mình và có thể đây là một bước tiến để bạn bước đến một vị trí cao hơn trong công ty.\r\n\r\nKhóa học Kỹ năng bán hàng chuyên nghiệp được thiết kế để cung cấp cho các bạn 1 cái nhìn tổng quan nhất về nghề bán hàng, về tâm lý, hành vi khách hàng và quy trình bán hàng hiệu quả mà bạn có thể áp dụng trong công việc của mình trong hiện tại hoặc tương lai.\r\nTham gia khóa học bạn sẽ nắm được những kiến thức:\r\n\r\n- Cách thấu hiểu khách hàng bằng xác định đối tượng khách hàng tiềm năng.\r\n\r\n- Phân biệt bán hàng giao dịch và bán hàng dựa trên mối quan hệ.\r\n\r\n- Các yếu tố ảnh hưởng đến tiêu dùng.\r\n\r\n- Xây dựng quy trình bán hàng hiệu quả.', 70, 444444, '2016-05-30 23:06:39', 170),
	(1, '111', 1, 'https://www.youtube.com/watch?v=-g5s4PoiWtk', 'image5.jpg', 'Description', 111, 0, '2016-09-10 07:00:00', 111),
	(1, '111', 1, 'https://www.youtube.com/watch?v=-g5s4PoiWtk', 'image1.jpg', 'Description', 111, 0, '2016-04-10 07:00:00', 111),
	(1, '11111111', 1, 'https://www.youtube.com/watch?v=-g5s4PoiWtk', 'image3.jpg', 'Bạn là một nhân viên bán hàng và bạn muốn bước lên thêm một bước nữa về kỹ năng bán hàng?\r\n\r\nBạn đã biết gì về những kỹ năng của 1 người bán hàng chuyên nghiệp?\r\n\r\nĐây có thể là một khóa học kỹ năng để giúp bạn thành công hơn trong công việc bán hàng của mình và có thể đây là một bước tiến để bạn bước đến một vị trí cao hơn trong công ty.\r\n\r\nKhóa học Kỹ năng bán hàng chuyên nghiệp được thiết kế để cung cấp cho các bạn 1 cái nhìn tổng quan nhất về nghề bán hàng, về tâm lý, hành vi khách hàng và quy trình bán hàng hiệu quả mà bạn có thể áp dụng trong công việc của mình trong hiện tại hoặc tương lai.\r\n\r\nTham gia khóa học bạn sẽ nắm được những kiến thức:\r\n\r\n- Cách thấu hiểu khách hàng bằng xác định đối tượng khách hàng tiềm năng.\r\n\r\n- Phân biệt bán hàng giao dịch và bán hàng dựa trên mối quan hệ.\r\n\r\n- Các yếu tố ảnh hưởng đến tiêu dùng.\r\n\r\n- Xây dựng quy trình bán hàng hiệu quả.', 111, 0, '2016-11-01 07:00:00', 444);
	
alter table tbl_course add column currency character varying(3);
alter table tbl_course alter column category_id type integer;
alter table tbl_course add column content_summary character varying;