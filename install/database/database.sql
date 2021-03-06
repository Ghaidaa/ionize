--
-- Ionize 0.9.9 SQL creation tables
--

CREATE TABLE IF NOT EXISTS article (
  id_article int(11) UNSIGNED NOT NULL auto_increment,
  name varchar(255) default NULL,
  author varchar(55) default NULL,
  updater varchar(55) default NULL,
  created datetime NOT NULL,
  publish_on datetime NOT NULL default '0000-00-00 00:00:00',
  publish_off datetime NOT NULL default '0000-00-00 00:00:00',
  updated datetime NOT NULL,
  logical_date datetime NOT NULL default '0000-00-00 00:00:00',
  indexed tinyint(1) UNSIGNED NOT NULL default 0,
  id_category int(11) UNSIGNED default NULL,
  comment_allow char(1) default '0',
  comment_autovalid char(1) default '0',
  comment_expire datetime,
  flag smallint(1) default 0,
  has_url tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY  (id_article)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS article_category (
	id_article INT(11) UNSIGNED NOT NULL ,
	id_category INT(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS article_lang (
  id_article int(11) UNSIGNED NOT NULL default 0,
  lang varchar(3) NOT NULL default '',
  url VARCHAR( 100 ) NOT NULL default '',
  title varchar(255) default NULL,
  subtitle varchar(255) default NULL,
  meta_title varchar(255) default NULL,
  content longtext,
  meta_keywords varchar(255) default NULL,
  meta_description varchar(255) default NULL,
  online tinyint(1) UNSIGNED NOT NULL default 1,
  PRIMARY KEY  (id_article,lang)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS article_media (
  id_article int(11) UNSIGNED NOT NULL default 0,
  id_media int(11) UNSIGNED NOT NULL default 0,
  online tinyint(1) UNSIGNED NOT NULL default 1,
  ordering int(11) UNSIGNED default 9999,
  url varchar(255) default NULL,
  lang_display varchar(3) DEFAULT NULL,
  PRIMARY KEY  (id_article,id_media)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS article_comment (
	id_article_comment int(11) UNSIGNED NOT NULL auto_increment,
	id_article int(11) UNSIGNED NOT NULL default 0,
	author varchar(255) default NULL,
	email varchar(255) default NULL,
	site varchar(255) default NULL,
	content text,
	ip varchar(40) default NULL,
	status tinyint UNSIGNED default NULL,
	created datetime NOT NULL,
	updated datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
	admin tinyint UNSIGNED NOT NULL	default 0										COMMENT 'If comment comes from admin, set to 1',
	PRIMARY KEY (id_article_comment)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS article_tag (
	id_article int(11) UNSIGNED NOT NULL,
	id_tag int(11) UNSIGNED NOT NULL,
	PRIMARY KEY  (id_article, id_tag)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS article_type (
  id_type int(11) unsigned NOT NULL auto_increment,
  type varchar(50) collate utf8_unicode_ci NOT NULL,
  ordering int(11) default 0,
  description text NOT NULL default '',
  type_flag TINYINT( 1 ) NOT NULL default 0,
  PRIMARY KEY  (id_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS captcha (
  id_captcha int(11) UNSIGNED NOT NULL auto_increment,
  question varchar(255) NOT NULL default '',
  answer varchar(255) NOT NULL default '',
  lang varchar(3) NOT NULL default '',
  hash varchar(32) NOT NULL default '',
  PRIMARY KEY  (id_captcha)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS category (
  id_category int(11) UNSIGNED NOT NULL auto_increment,
  name varchar(50) NOT NULL,
  ordering int(11) default 0,
  PRIMARY KEY  (id_category)
)  ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS category_lang (
  id_category int(11) UNSIGNED NOT NULL default '0',
  lang char(3) NOT NULL,
  title varchar(255) NOT NULL default '',
  subtitle VARCHAR( 255 ) NOT NULL default '',
  description text NOT NULL,
	  PRIMARY KEY  (id_category, lang)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS element (
  id_element int(11) unsigned NOT NULL auto_increment,
  id_element_definition int(11) unsigned NOT NULL,
  parent varchar(50) NOT NULL,
  id_parent int(11) NOT NULL,
  ordering int(11) NOT NULL default '0',
  PRIMARY KEY  (id_element),
  KEY idx_element_id_element_definition (id_element_definition),
  KEY idx_element_id_parent (id_parent),
  KEY idx_element_parent (parent)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS element_definition (
  id_element_definition int(11) unsigned NOT NULL auto_increment,
  name varchar(50) NOT NULL,
  description text,
  ordering int(11) not null default 0,
  PRIMARY KEY  (id_element_definition)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS element_definition_lang (
  id_element_definition int(11) unsigned NOT NULL,
  lang varchar(3) NOT NULL,
  title varchar(255) NOT NULL default '',
  PRIMARY KEY  (id_element_definition, lang)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS extend_field (
	id_extend_field INT(11) UNSIGNED NOT NULL auto_increment,
	name varchar(255) NOT NULL,
	type varchar(1) NOT NULL,
	description varchar(255) DEFAULT '',
	parent varchar(50) NOT NULL,
  	ordering int(11) default 0,
	translated char(1) default '0',
	value text NULL,
	default_value varchar(255) NULL,
	global tinyint(1) UNSIGNED NOT NULL default '0',
	parents varchar(300) NOT NULL default '',
	id_element_definition INT( 11 ) UNSIGNED NOT NULL DEFAULT '0',
	block VARCHAR( 50 ) NOT NULL DEFAULT '',
	PRIMARY KEY  (id_extend_field),
	KEY idx_extend_field_parent (parent),
    KEY idx_extend_field_id_element_definition (id_element_definition) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8   AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS extend_field_lang (
    id_extend_field int(11) unsigned NOT NULL,
    lang char(3) NOT NULL,
    label varchar(255),
    PRIMARY KEY  (id_extend_field, lang)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


CREATE TABLE IF NOT EXISTS extend_fields (
	id_extend_fields INT(11) UNSIGNED NOT NULL auto_increment,
	id_extend_field INT(11) UNSIGNED NOT NULL,
	parent varchar(50) NOT NULL default '',
	id_parent int(11) UNSIGNED NOT NULL,
	lang char(3) NOT NULL default '',
	content text,
	ordering INT( 11 ) UNSIGNED NOT NULL DEFAULT '0',
	id_element INT( 11 ) UNSIGNED NOT NULL,
	PRIMARY KEY  (id_extend_fields),
	KEY idx_extend_fields_id_parent (id_parent),
	KEY idx_extend_fields_lang (lang),
    KEY idx_extend_fields_id_extend_field (id_extend_field) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8   AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS ion_sessions (
  session_id varchar(40) collate utf8_unicode_ci NOT NULL default '0',
  ip_address varchar(16) collate utf8_unicode_ci NOT NULL default '0',
  user_agent varchar(50) collate utf8_unicode_ci NULL,
  last_activity int(10) unsigned NOT NULL default '0',
  user_data text collate utf8_unicode_ci NULL,
  PRIMARY KEY  (session_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS lang (
  lang varchar(3) NOT NULL default '',
  name varchar(40) default NULL,
  online char(1) default '0',
  def char(1) default '0',
  ordering int(11),
  PRIMARY KEY  (lang)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS login_tracker (
  ip_address varchar(32) collate utf8_unicode_ci NOT NULL,
  first_time int(11) unsigned NOT NULL,
  failures tinyint(2) unsigned default NULL,
  PRIMARY KEY  (ip_address)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS media (
	id_media int(11) UNSIGNED NOT NULL auto_increment,
	type varchar(10) NOT NULL DEFAULT '',
	file_name varchar(255) NOT NULL default ''		COMMENT 'file_name',
	path varchar(500) NOT NULL						COMMENT 'Complete path to the medium, including media file name, excluding host name',
	base_path varchar(500) NOT NULL					COMMENT 'medium folder base path, excluding host name',
	copyright varchar(128) default NULL,
	date datetime NOT NULL							COMMENT 'Medium date',
	link varchar(255) default NULL					COMMENT 'Link to a resource, attached to this medium',
	square_crop enum('tl','m','br') NOT NULL DEFAULT 'm',
	PRIMARY KEY  (id_media)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS media_lang (
  lang varchar(3) NOT NULL default '',
  id_media int(11) UNSIGNED NOT NULL default 0,
  title varchar(255) default NULL,
  alt varchar(500) default NULL,
  description longtext,
  PRIMARY KEY  (id_media, lang)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS menu (
  id_menu int(11) NOT NULL auto_increment,
  name varchar(50) collate utf8_unicode_ci NOT NULL,
  title varchar(50) collate utf8_unicode_ci NOT NULL,
  ordering int(11),
  PRIMARY KEY  (id_menu),
  UNIQUE KEY name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS module (
	id_module int(11) UNSIGNED NOT NULL auto_increment,
	name varchar(100) NOT NULL default '',
	with_admin tinyint UNSIGNED  NOT NULL default 0,
	version varchar(10) NOT NULL default '',
	status tinyint UNSIGNED NOT NULL default 0,
	ordering tinyint UNSIGNED NOT NULL default 0,
	info text NOT NULL,
	description text NOT NULL,
	PRIMARY KEY  (id_module),
	KEY i_module_name (name)
)  ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS module_setting (
  id_module_setting int(11) NOT NULL auto_increment,
  id_module int(11) NOT NULL,
  name varchar(50) NOT NULL					COMMENT 'Setting name',
  content varchar(255) NOT NULL				COMMENT 'Setting content',	
  lang varchar(2) default NULL,
  PRIMARY KEY  (id_module_setting) 
)   ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS note (
  id_note INT( 11 ) NOT NULL AUTO_INCREMENT,
  id_user INT( 11 ) NOT NULL ,
  date DATETIME NOT NULL ,
  type VARCHAR( 10 ) NOT NULL,
  content TEXT NOT NULL ,
  PRIMARY KEY  (id_note)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS page (
  id_page int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_parent int(11) UNSIGNED NOT NULL default 0,
  id_menu int(11) UNSIGNED NOT NULL default 0,
  id_type smallint(2) NOT NULL default 0,
  id_subnav int(11) UNSIGNED NOT NULL default 0, 
  name varchar(255) default NULL,
  ordering int(11) UNSIGNED default 0,
  level int(11) UNSIGNED NOT NULL default 0,
  online tinyint(1) UNSIGNED NOT NULL default 0,
  home tinyint( 1 ) NOT NULL DEFAULT '0',
  author varchar(55) default NULL,
  updater varchar(55) default NULL,
  created datetime NOT NULL,
  publish_on datetime NOT NULL,
  publish_off datetime NOT NULL,
  updated datetime NOT NULL,
  logical_date datetime NOT NULL default '0000-00-00 00:00:00',
  appears tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  has_url tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  view varchar(50) default NULL										COMMENT 'Page view',
  view_single varchar(50) default NULL								COMMENT 'Single Article Page view',
  article_list_view VARCHAR(50) default NULL						COMMENT 'Article list view for each article linked to this page',
  article_view varchar(50) default NULL								COMMENT 'Article detail view for each article linked to this page',
  article_order VARCHAR(50) NOT NULL DEFAULT 'ordering'				COMMENT 'Article order in this page. Can be "ordering", "date"',
  article_order_direction VARCHAR(50) NOT NULL DEFAULT 'ASC',	
  link varchar(255) default ''										COMMENT 'Link to internal / external resource',
  link_type varchar(25) collate utf8_unicode_ci default NULL COMMENT '''page'', ''article'' or NULL',
  link_id varchar(20) NOT NULL default '',
  pagination tinyint(1) UNSIGNED NOT NULL DEFAULT 0						COMMENT 'Pagination use ?',
  pagination_nb tinyint(1) UNSIGNED NOT NULL DEFAULT 5						COMMENT 'Article number per page',
  id_group SMALLINT( 4 ) UNSIGNED NOT NULL,
  priority int(1) unsigned NOT NULL DEFAULT '5' COMMENT 'Page priority',
  used_by_module tinyint(1) unsigned NULL,
  PRIMARY KEY  (id_page),
  KEY idx_page_id_parent (id_parent),
  KEY idx_page_level (level),
  KEY idx_page_menu (id_menu) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS page_article (
	id_page INT(11) UNSIGNED NOT NULL,
	id_article INT(11) UNSIGNED NOT NULL,
	online tinyint(1) UNSIGNED NOT NULL default 0,
	view varchar(50) default NULL,
  	ordering int(11) default 0,
	id_type int(11) UNSIGNED NULL,
	link_type VARCHAR( 25 ) NOT NULL DEFAULT '',
	link_id varchar(20) NOT NULL DEFAULT '',
	link VARCHAR( 255 ) NOT NULL DEFAULT '',
	main_parent TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY  (id_page, id_article),
    KEY idx_page_article_id_type (id_type) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS page_user_groups (
  id_page int(11) UNSIGNED NOT NULL default 0,
  ig_group smallint(4) UNSIGNED NOT NULL default 0,
  PRIMARY KEY  (id_page,ig_group)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS page_lang (
  lang varchar(3) NOT NULL default '',
  id_page int(11) UNSIGNED NOT NULL default 0,
  url VARCHAR( 100 ) NOT NULL default '',
  link VARCHAR( 255 ) NOT NULL default '',
  title varchar(255) default NULL,
  subtitle varchar(255) default NULL,
  nav_title VARCHAR( 255 ) NOT NULL DEFAULT  '',
  subnav_title VARCHAR( 255 ) NOT NULL DEFAULT '',
  meta_title varchar(255) default NULL,
  meta_description varchar(255) default NULL,
  meta_keywords varchar(255) default NULL,
  online tinyint(1) UNSIGNED NOT NULL default 1,
  PRIMARY KEY  (id_page,lang)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS page_media (
  id_page int(11) UNSIGNED NOT NULL default 0,
  id_media int(11) UNSIGNED NOT NULL default 0,
  online tinyint(1) UNSIGNED NOT NULL default 1,
  ordering int(11) UNSIGNED default 9999,
  lang_display varchar(3) DEFAULT NULL,
  PRIMARY KEY  (id_page,id_media)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS setting (
  id_setting int(11) UNSIGNED NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  content text not null,
  lang varchar(3),
  PRIMARY KEY (id_setting)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS tag (
	id_tag int(11) UNSIGNED NOT NULL auto_increment,
	tag varchar(50) default NULL,
	PRIMARY KEY  (id_tag)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;

CREATE TABLE tracker (
  id_user int(11) unsigned NOT NULL,
  ip_address varchar(32) DEFAULT NULL,
  element varchar(50) DEFAULT NULL,
  id_element int(11) DEFAULT NULL,
  last_time datetime DEFAULT NULL,
  elements varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS type (
  id_type int(11) unsigned NOT NULL AUTO_INCREMENT,
  code varchar(50) NOT NULL,
  parent char(20) NOT NULL,
  title varchar(255) NOT NULL,
  description varchar(3000) DEFAULT NULL,
  ordering smallint(6) NOT NULL,
  view varchar(50) DEFAULT NULL,
  flag tinyint(1) NOT NULL,
  PRIMARY KEY (id_type)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS url (
  id_url int(11) unsigned NOT NULL AUTO_INCREMENT,
  id_entity int(11) unsigned NOT NULL,
  type varchar(10) NOT NULL,
  canonical smallint(1) NOT NULL DEFAULT '0',
  active smallint(1) NOT NULL DEFAULT '0',
  lang varchar(3) NOT NULL,
  path varchar(255) NOT NULL DEFAULT '',
  path_ids varchar(50),
  full_path_ids varchar(50),
  creation_date datetime NOT NULL,
  PRIMARY KEY (id_url),
  KEY idx_url_type (type),
  KEY idx_url_active (active),
  KEY idx_url_lang (lang)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS users (
  id_user int(11) unsigned NOT NULL auto_increment,
  id_group smallint(4) unsigned NOT NULL,
  join_date timestamp NULL default NULL,
  last_visit timestamp NULL default NULL,
  username varchar(50) collate utf8_unicode_ci NOT NULL,
  screen_name varchar(50) collate utf8_unicode_ci default NULL,
  firstname varchar(100) NOT NULL,
  lastname varchar(100) DEFAULT NULL,
  birthdate datetime NOT NULL,
  gender smallint(1) DEFAULT NULL COMMENT '1: Male, 2 : Female',
  password varchar(255) collate utf8_unicode_ci NOT NULL,
  email varchar(120) collate utf8_unicode_ci NOT NULL,
  salt varchar(50) collate utf8_unicode_ci NULL,
  PRIMARY KEY  (id_user),
  UNIQUE KEY username (username),
  KEY id_group (id_group)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1; 


CREATE TABLE IF NOT EXISTS user_groups (
  id_group smallint(4) UNSIGNED NOT NULL auto_increment,
  level int(11) default NULL,
  slug varchar(25) collate utf8_unicode_ci NOT NULL,
  group_name varchar(100) collate utf8_unicode_ci NOT NULL,
  description tinytext collate utf8_unicode_ci,
  PRIMARY KEY (id_group),
  UNIQUE KEY slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;


TRUNCATE TABLE login_tracker;

INSERT IGNORE INTO user_groups VALUES (1, 10000, 'super-admins', 'Super Admins', NULL);
INSERT IGNORE INTO user_groups VALUES (2, 5000, 'admins', 'Admins', NULL);
INSERT IGNORE INTO user_groups VALUES (3, 1000, 'editors', 'Editors', NULL);
INSERT IGNORE INTO user_groups VALUES (4, 100, 'users', 'Users', NULL);
INSERT IGNORE INTO user_groups VALUES (5, 50, 'pending', 'Pending', NULL);
INSERT IGNORE INTO user_groups VALUES (6, 10, 'guests', 'Guests', NULL);
INSERT IGNORE INTO user_groups VALUES (7, -10, 'banned', 'Banned', NULL);
INSERT IGNORE INTO user_groups VALUES (8, -100, 'deactivated', 'Deactivated', NULL);

DELETE FROM setting WHERE name='cache';
DELETE FROM setting WHERE name='cache_time';
DELETE FROM setting WHERE name='create_dir_use_ftp';
DELETE FROM setting WHERE name='ftp_host';
DELETE FROM setting WHERE name='ftp_user';
DELETE FROM setting WHERE name='ftp_password';
DELETE FROM setting WHERE name='picture_copyright';


INSERT IGNORE INTO setting VALUES ('', 'website_email', '', NULL);
INSERT IGNORE INTO setting VALUES ('', 'files_path', 'files', NULL);
INSERT IGNORE INTO setting VALUES ('', 'cache', '0', NULL);
INSERT IGNORE INTO setting VALUES ('', 'cache_time', '150', NULL);
INSERT IGNORE INTO setting VALUES ('', 'theme', 'default', NULL);
INSERT IGNORE INTO setting VALUES ('', 'theme_admin', 'admin', NULL);
INSERT IGNORE INTO setting VALUES ('', 'google_analytics', '', NULL);
INSERT IGNORE INTO setting VALUES ('', 'filemanager', 'mootools-filemanager', NULL);
INSERT IGNORE INTO setting VALUES ('', 'show_help_tips', '1', NULL);

INSERT IGNORE INTO setting VALUES ('', 'display_connected_label', '1', NULL);
INSERT IGNORE INTO setting VALUES ('', 'texteditor', 'tinymce', NULL);
INSERT IGNORE INTO setting VALUES ('', 'media_thumb_size', '120', NULL);

INSERT IGNORE INTO setting VALUES ('', 'tinybuttons1', 'pdw_toggle,|,bold,italic,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,|,bullist,numlist,|,link,unlink,image,|,spellchecker', NULL);
INSERT IGNORE INTO setting VALUES ('', 'tinybuttons2', 'fullscreen, undo,redo,|,pastetext,selectall,removeformat,|,media,charmap,hr,blockquote,|,template,|,codemirror', NULL);
INSERT IGNORE INTO setting VALUES ('', 'tinybuttons3', 'tablecontrols', NULL);
INSERT IGNORE INTO setting VALUES ('', 'smalltinybuttons1', 'bold,italic,|,bullist,numlist,|,link,unlink,image,|,nonbreaking', '');
INSERT IGNORE INTO setting VALUES ('', 'smalltinybuttons2', '', '');
INSERT IGNORE INTO setting VALUES ('', 'smalltinybuttons3', '', '');

INSERT IGNORE INTO setting VALUES ('', 'displayed_admin_languages', 'en', NULL);
INSERT IGNORE INTO setting VALUES ('', 'date_format', '%Y.%m.%d', NULL);
INSERT IGNORE INTO setting VALUES ('', 'force_lang_urls', '0', NULL);
INSERT IGNORE INTO setting VALUES ('', 'tinyblockformats', 'p,h2,h3,h4,h5,pre,div', NULL);
INSERT IGNORE INTO setting VALUES ('', 'picture_max_width','',NULL);
INSERT IGNORE INTO setting VALUES ('', 'picture_max_height','',NULL);
INSERT IGNORE INTO setting VALUES ('', 'filemanager_file_types','gif,jpe,jpeg,jpg,png,flv,mpg,mp3,doc,pdf,rtf',NULL);
INSERT IGNORE INTO setting VALUES ('', 'article_allowed_tags','h1,h2,h3,h4,h5,h6,em,img,table,div,span,dl,pre,code,thead,tbody,tfoot,tr,th,td,caption,dt,dd,map,area,p,a,ul,ol,li,br,b,strong',NULL);
INSERT IGNORE INTO setting VALUES ('', 'no_source_picture','default.png',NULL);
INSERT IGNORE INTO setting VALUES ('', 'enable_backend_tracker','1', NULL);



DELETE FROM setting WHERE name='default_admin_lang';
INSERT INTO setting VALUES ('', 'default_admin_lang', 'en', NULL);

DELETE FROM setting WHERE name='ionize_version';
INSERT INTO setting VALUES ('', 'ionize_version', '0.9.9', NULL);

DELETE FROM setting WHERE name='media_upload_mode';
INSERT INTO setting VALUES ('', 'media_upload_mode', 'multiple', NULL);


INSERT IGNORE INTO menu (id_menu, name, title) VALUES
	(1 , 'main', 'Main menu'),
	(2 , 'system', 'System menu');
		

