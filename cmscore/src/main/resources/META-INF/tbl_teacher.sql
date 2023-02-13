-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_teacher
DROP TABLE IF EXISTS `tbl_teacher`;
CREATE TABLE IF NOT EXISTS `tbl_teacher` (
  `TEACHER_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TEACHER_NAME` varchar(50) DEFAULT NULL,
  `TEACHER_COMPANY` varchar(50) DEFAULT NULL,
  `TEACHER_CONTENT` text,
  `TEACHER_IMAGE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TEACHER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `tbl_teacher` (`TEACHER_ID`, `TEACHER_NAME`, `TEACHER_COMPANY`, `TEACHER_CONTENT`, `TEACHER_IMAGE`) VALUES
	(1, 'Lê Kim Tú', 'Co-Founder VUTAMILK Corporation', '- Cổ đông sáng lập của Công ty cổ phần Sữa Vũng Tàu (VUTAMILK)\r\n\r\n- Cố vấn Kinh Doanh của Công ty CP Tượng Sáp Việt\r\n\r\n- Cố vấn kinh doanh cho Trường đào tạo thiết kế quốc tế ADS\r\n\r\n- Quản lý cấp cao trong lĩnh vực bán hàng và tiếp thị tại các công ty hàng tiêu dùng như KALBE Pharma (lĩnh vực dinh dưỡng) và Campina (công ty sữa từ Hà Lan).\r\n\r\n\r\nPhương pháp và phong cách đào tạo của anh Tú được đánh giá cao bởi các kỹ thuật cho kết quả thực tế và hiệu quả. Với kinh nghiệm của mình trong kinh doanh, dịch vụ khách hàng, chuỗi cung ứng, sản xuất, quản lý trong các công ty hàng tiêu dùng, anh Tú xây dựng hệ thống bài giảng thực tế, khoa học, cung cấp những kỹ năng thiết thực. Người tham gia có thể áp dụng ngay sau khi tham gia chương trình đào tạo để cải tiến chất lượng công việc, cuộc sống.', 'teacher1.jpg');


	
--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_teacher CASCADE;
DROP SEQUENCE IF EXISTS teacher_id_seq CASCADE;

CREATE SEQUENCE teacher_id_seq START 1;
ALTER TABLE public.teacher_id_seq OWNER TO dolphin;

CREATE TABLE tbl_teacher (
		teacher_id INT4 NOT NULL PRIMARY KEY DEFAULT nextval('teacher_id_seq'),
		teacher_company VARCHAR(255),
		teacher_content TEXT,
		teacher_image VARCHAR(255),
		teacher_name VARCHAR(255)
	);

ALTER TABLE tbl_teacher OWNER TO "dolphin";

---Data
INSERT INTO tbl_teacher (TEACHER_NAME, TEACHER_COMPANY, TEACHER_CONTENT, TEACHER_IMAGE) VALUES
	('MASTER SRIDEVI TỐ HẢI', 'Công ty Thiền và Yoga Trái Tim Vàng Việt Nam và Ấn Độ ', '- Chủ tịch Công ty Thiền và Yoga Trái Tim Vàng Việt Nam và Ấn Độ<br> - Chuyên gia đào tạo HLV yoga, HDV Thiền quốc tế <br> Chuyên gia huấn luyện thuật lãnh đạo Thiền Quốc Tế <br> Chuyên gia quản trị năng lượng con người\nChuyên gia phục hồi tự nhiên không dùng thuốc<br> - Nhà sáng lập Thiền Khí Tâm <br> - Chủ tịch công ty Thiền & Yoga Những Trái Tim Vàng', 'teacher1.jpg');

alter table tbl_teacher alter column teacher_company type text;
alter table tbl_teacher alter column teacher_image type character varying(512);	

-- New column
alter table tbl_teacher add column login_name character varying(512);
alter table tbl_teacher add column email character varying(255);
alter table tbl_teacher add column telephone integer;
alter table tbl_teacher add column login_id integer;