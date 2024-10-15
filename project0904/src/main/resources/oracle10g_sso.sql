-- COMMON 

-- START CREATE TABLE ------------------------
CREATE TABLE bds_cm_audit_log
(
	oid VARCHAR2(100) NOT NULL,
	use_yn VARCHAR2(1) DEFAULT 'Y',
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	event_type VARCHAR2(36),
	request_id VARCHAR2(100),
	user_oid VARCHAR2(100),
	user_id VARCHAR2(100),
	user_name VARCHAR2(250),
	client_oid VARCHAR2(100),
	client_id VARCHAR2(250),
	access_ip VARCHAR2(50),
	description VARCHAR2(2000 CHAR),
	entity_data VARCHAR2(2000 CHAR),
	event_time NUMBER(19) DEFAULT 0 NOT NULL,
	server_ip VARCHAR2(50),
	server_name VARCHAR2(100 CHAR),
	success VARCHAR2(1) NOT NULL
);

ALTER TABLE bds_cm_audit_log ADD (CONSTRAINT pk_bds_cm_audit_log PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_audit_log IS '감사로그';

COMMENT ON COLUMN bds_cm_audit_log.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_audit_log.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_audit_log.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_audit_log.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_audit_log.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_audit_log.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_audit_log.event_type IS '이벤트 유형';
COMMENT ON COLUMN bds_cm_audit_log.request_id IS '요청 ID';
COMMENT ON COLUMN bds_cm_audit_log.user_oid IS '사용자 OID';
COMMENT ON COLUMN bds_cm_audit_log.user_id IS '사용자 ID';
COMMENT ON COLUMN bds_cm_audit_log.user_name IS '사용자 이름';
COMMENT ON COLUMN bds_cm_audit_log.client_oid IS '클라이언트 OID';
COMMENT ON COLUMN bds_cm_audit_log.client_id IS '클라이언트ID';
COMMENT ON COLUMN bds_cm_audit_log.access_ip IS '접근 IP';
COMMENT ON COLUMN bds_cm_audit_log.description IS '설명';
COMMENT ON COLUMN bds_cm_audit_log.entity_data IS '엔티티 데이터';
COMMENT ON COLUMN bds_cm_audit_log.event_time IS '이벤트 발생시간';
COMMENT ON COLUMN bds_cm_audit_log.server_ip IS '서버 IP';
COMMENT ON COLUMN bds_cm_audit_log.server_name IS '서버 명';
COMMENT ON COLUMN bds_cm_audit_log.success IS '성공여부';

--
CREATE TABLE bds_cm_admin
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	fail_count NUMBER(10) DEFAULT 0,
	fail_time NUMBER(19) DEFAULT 0,
	locked VARCHAR2(1) DEFAULT 'N',
	password VARCHAR2(250) NOT NULL,
	pass_changed_time NUMBER(19) DEFAULT 0,
	password_salt VARCHAR2(250),
	user_role VARCHAR2(250) NOT NULL,
	start_time NUMBER(19) DEFAULT 0,
	end_time NUMBER(19) DEFAULT 0,
	last_login_time NUMBER(19) DEFAULT 0,
	pre_login_time NUMBER(19) DEFAULT 0,
	status VARCHAR2(30) DEFAULT 'ACTIVE' NOT NULL,
	user_id VARCHAR2(100) NOT NULL,
	email VARCHAR2(200),
	hand_phone VARCHAR2(200),
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    name VARCHAR2(255),
    second_str VARCHAR2(250)
);

ALTER TABLE bds_cm_admin ADD (CONSTRAINT pk_bds_cm_admin PRIMARY KEY (oid));
ALTER TABLE bds_cm_admin ADD (CONSTRAINT uk_bds_cm_admin_user_id UNIQUE (user_id));

COMMENT ON TABLE bds_cm_admin IS '관리자';

COMMENT ON COLUMN bds_cm_admin.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_admin.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_admin.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_admin.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_admin.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_admin.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_admin.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_admin.fail_count IS '실패횟수';
COMMENT ON COLUMN bds_cm_admin.fail_time IS '실패시간';
COMMENT ON COLUMN bds_cm_admin.locked IS '잠금 여부';
COMMENT ON COLUMN bds_cm_admin.password IS '비밀번호';
COMMENT ON COLUMN bds_cm_admin.pass_changed_time IS '비밀번호 변경일';
COMMENT ON COLUMN bds_cm_admin.password_salt IS '비밀번호 SALT';
COMMENT ON COLUMN bds_cm_admin.user_role IS '역할';
COMMENT ON COLUMN bds_cm_admin.start_time IS '시작날짜';
COMMENT ON COLUMN bds_cm_admin.end_time IS '만료날짜';
COMMENT ON COLUMN bds_cm_admin.last_login_time IS '최근 로그인 시간';
COMMENT ON COLUMN bds_cm_admin.pre_login_time IS '이전 로그인 시간';
COMMENT ON COLUMN bds_cm_admin.status IS '상태';
COMMENT ON COLUMN bds_cm_admin.user_id IS '사용자 ID';
COMMENT ON COLUMN bds_cm_admin.email IS '이메일';
COMMENT ON COLUMN bds_cm_admin.hand_phone IS '핸드폰 번호';
COMMENT ON COLUMN bds_cm_admin.custom_info IS '커스텀 정보';
COMMENT ON COLUMN bds_cm_admin.name IS '사용자 이름';
COMMENT ON COLUMN bds_cm_admin.first_str IS '커스텀필드';
COMMENT ON COLUMN bds_cm_admin.second_str IS '커스텀필드';

--
CREATE TABLE bds_cm_client_access
(
	client_oid VARCHAR2(100) NOT NULL,
	client_ip VARCHAR2(50) NOT NULL,
	access_time NUMBER(19) DEFAULT 0,
	version_info VARCHAR2(200),
	use_yn VARCHAR2(1),
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100)
);

ALTER TABLE bds_cm_client_access ADD (CONSTRAINT pk_bds_cm_client_access PRIMARY KEY (client_oid, client_ip));

COMMENT ON TABLE bds_cm_client_access IS '클라이언트 접근내역';

COMMENT ON COLUMN bds_cm_client_access.client_oid IS '클라이언트 OID';
COMMENT ON COLUMN bds_cm_client_access.client_ip IS '클라이언트 IP';
COMMENT ON COLUMN bds_cm_client_access.access_time IS '접근 시간';
COMMENT ON COLUMN bds_cm_client_access.version_info IS '버전 정보';
COMMENT ON COLUMN bds_cm_client_access.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_client_access.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_client_access.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_client_access.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_client_access.update_user IS '수정자';
--
CREATE TABLE bds_cm_client_uri
(
	client_oid VARCHAR2(100) NOT NULL,
	uri_type VARCHAR2(60) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	redirect_uri VARCHAR2(2000) NOT NULL
);

ALTER TABLE bds_cm_client_uri ADD (CONSTRAINT pk_bds_cm_client_uri PRIMARY KEY (client_oid, uri_type));

COMMENT ON TABLE bds_cm_client_uri IS '클라이언트 URI';

COMMENT ON COLUMN bds_cm_client_uri.client_oid IS '클라이언트 OID';
COMMENT ON COLUMN bds_cm_client_uri.uri_type IS 'URI 유형';
COMMENT ON COLUMN bds_cm_client_uri.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_client_uri.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_client_uri.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_client_uri.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_client_uri.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_client_uri.redirect_uri IS '리다이렉트 URI';
--
CREATE TABLE bds_cm_ip_filter
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	access_type VARCHAR2(20) NOT NULL,
	entity_oid VARCHAR2(100),
	group_type VARCHAR2(20 CHAR) NOT NULL,
	ip VARCHAR2(100) NOT NULL,
	ip_type VARCHAR2(20) NOT NULL,
	sort_order NUMBER(19) DEFAULT 0,
	title VARCHAR2(200 CHAR)
);

ALTER TABLE bds_cm_ip_filter ADD (CONSTRAINT pk_bds_cm_ip_filter PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_ip_filter IS 'IP 필터';

COMMENT ON COLUMN bds_cm_ip_filter.oid IS '객체 ID';
COMMENT ON COLUMN bds_cm_ip_filter.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_ip_filter.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_ip_filter.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_ip_filter.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_ip_filter.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_ip_filter.access_type IS '접근타입';
COMMENT ON COLUMN bds_cm_ip_filter.entity_oid IS '엔티티 OID';
COMMENT ON COLUMN bds_cm_ip_filter.group_type IS '그룹 타입';
COMMENT ON COLUMN bds_cm_ip_filter.ip IS 'IP';
COMMENT ON COLUMN bds_cm_ip_filter.ip_type IS 'IP 타입';
COMMENT ON COLUMN bds_cm_ip_filter.sort_order IS '정렬 순서';
COMMENT ON COLUMN bds_cm_ip_filter.title IS '설명';
--
CREATE TABLE bds_cm_config
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'N',
	title VARCHAR2(1000 CHAR),
	conf_value VARCHAR2(2000 CHAR) NOT NULL
);

ALTER TABLE bds_cm_config ADD (CONSTRAINT pk_bds_cm_config PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_config IS '환경 설정';

COMMENT ON COLUMN bds_cm_config.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_config.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_config.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_config.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_config.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_config.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_config.title IS '설정 명';
COMMENT ON COLUMN bds_cm_config.conf_value IS '설정 값';

--
CREATE TABLE bds_cm_license
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	app VARCHAR2(250) NOT NULL,
	license_key VARCHAR2(4000 CHAR) NOT NULL
);

ALTER TABLE bds_cm_license ADD (CONSTRAINT pk_bds_cm_license PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_license IS '라이센스';

COMMENT ON COLUMN bds_cm_license.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_license.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_license.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_license.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_license.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_license.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_license.app IS '제품명';
COMMENT ON COLUMN bds_cm_license.license_key IS '라이선스 키';
--
CREATE TABLE bds_cm_login_history
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	login_ip VARCHAR2(50) NOT NULL,
	message VARCHAR2(2000 CHAR),
	session_id VARCHAR2(250),
	success VARCHAR2(1),
	user_id VARCHAR2(100) NOT NULL,
	user_oid VARCHAR2(100),
	user_name VARCHAR2(250),
	auth_type VARCHAR2(30),
	user_type VARCHAR2(36) NOT NULL,
	client_id VARCHAR2(250),
	client_oid VARCHAR2(100),
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
);

ALTER TABLE bds_cm_login_history ADD (CONSTRAINT pk_bds_cm_login_history PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_login_history IS '로그인 이력';

COMMENT ON COLUMN bds_cm_login_history.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_login_history.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_login_history.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_login_history.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_login_history.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_login_history.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_login_history.login_ip IS '로그인IP';
COMMENT ON COLUMN bds_cm_login_history.message IS '메시지';
COMMENT ON COLUMN bds_cm_login_history.session_id IS '세션ID';
COMMENT ON COLUMN bds_cm_login_history.success IS '성공여부';
COMMENT ON COLUMN bds_cm_login_history.user_id IS '사용자 ID';
COMMENT ON COLUMN bds_cm_login_history.user_oid IS '사용자OID';
COMMENT ON COLUMN bds_cm_login_history.user_name IS '사용자 이름';
COMMENT ON COLUMN bds_cm_login_history.auth_type IS '로그인 유형';
COMMENT ON COLUMN bds_cm_login_history.user_type IS '사용자 유형';
COMMENT ON COLUMN bds_cm_login_history.client_id IS '클라이언트 ID';
COMMENT ON COLUMN bds_cm_login_history.client_oid IS '클라이언트 OID';
--
CREATE TABLE bds_cm_password_changed
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	changed_time NUMBER(19) DEFAULT 0,
	password VARCHAR2(250) NOT NULL,
	password_salt VARCHAR2(250),
	user_oid VARCHAR2(100) NOT NULL,
	user_type VARCHAR2(36) NOT NULL
);

ALTER TABLE bds_cm_password_changed ADD (CONSTRAINT pk_bds_cm_password_changed PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_password_changed IS '비밀번호 변경이력';

COMMENT ON COLUMN bds_cm_password_changed.oid IS '객체 ID';
COMMENT ON COLUMN bds_cm_password_changed.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_password_changed.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_password_changed.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_password_changed.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_password_changed.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_password_changed.changed_time IS '변경시간';
COMMENT ON COLUMN bds_cm_password_changed.password IS '비밀번호';
COMMENT ON COLUMN bds_cm_password_changed.password_salt IS '비밀번호 SALT';
COMMENT ON COLUMN bds_cm_password_changed.user_oid IS '사용자 OID';
COMMENT ON COLUMN bds_cm_password_changed.user_type IS '사용자 유형';
--
CREATE TABLE bds_cm_server_key
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	encode_type VARCHAR2(20) NOT NULL,
	expired VARCHAR2(1),
	expired_time NUMBER(19) DEFAULT 0,
	key_type VARCHAR2(20) NOT NULL,
	private_key VARCHAR2(4000) NOT NULL,
	public_key VARCHAR2(2000) NOT NULL,
	version NUMBER(*, 0) DEFAULT 0 NOT NULL
);

ALTER TABLE bds_cm_server_key ADD (CONSTRAINT pk_bds_cm_server_key PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_server_key IS '서버키';

COMMENT ON COLUMN bds_cm_server_key.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_server_key.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_server_key.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_server_key.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_server_key.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_server_key.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_server_key.encode_type IS '암호화 유형';
COMMENT ON COLUMN bds_cm_server_key.expired IS '만료여부';
COMMENT ON COLUMN bds_cm_server_key.expired_time IS '만료일';
COMMENT ON COLUMN bds_cm_server_key.key_type IS '키 유형';
COMMENT ON COLUMN bds_cm_server_key.private_key IS '개인키';
COMMENT ON COLUMN bds_cm_server_key.public_key IS '공개키';
COMMENT ON COLUMN bds_cm_server_key.version IS '버전';
--
create table bds_cm_client_group
(
    oid         VARCHAR2(100)            not null,
    name        VARCHAR2(50)            not null,
    group_id    VARCHAR2(50)            not null,
    use_yn      VARCHAR2(1) default 'Y' null,
    insert_time NUMBER(19)     default 0   null,
    parent_oid  VARCHAR2(50)            not null,
    insert_user VARCHAR2(50)            null,
    update_time NUMBER(19)     default 0   null,
    update_user VARCHAR2(50)            null,
    sort_order  NUMBER(19)        default 0   null
);
ALTER TABLE bds_cm_client_group ADD (CONSTRAINT pk_bds_cm_client_group PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_client_group IS '클라이언트  그룹';

COMMENT ON COLUMN bds_cm_client_group.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_client_group.name IS '이름';
COMMENT ON COLUMN bds_cm_client_group.group_id IS '그룹ID';
COMMENT ON COLUMN bds_cm_client_group.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_client_group.parent_oid IS '부모 그룹OID';
COMMENT ON COLUMN bds_cm_client_group.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_client_group.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_client_group.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_client_group.update_user IS '수정자';
--
CREATE TABLE bds_cm_client
(
	oid VARCHAR2(100) NOT NULL,
	group_oid VARCHAR2(100) DEFAULT 'ROOT' NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1),
	api_valid_time NUMBER(19) DEFAULT 0,
	app VARCHAR2(250),
	app_type VARCHAR2(250),
	client_id VARCHAR2(250) NOT NULL,
	deleted VARCHAR2(1) NOT NULL,
	comp_oid VARCHAR2(100),
	end_time NUMBER(19) DEFAULT 0,
	grant_types VARCHAR2(250),
	name VARCHAR2(250 CHAR) NOT NULL,
	secret VARCHAR2(250) NOT NULL,
	start_time NUMBER(19) DEFAULT 0,
	two_factor VARCHAR2(1) DEFAULT 'N',
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
);

ALTER TABLE bds_cm_client ADD (CONSTRAINT pk_bds_cm_client PRIMARY KEY (oid));
ALTER TABLE bds_cm_client ADD (CONSTRAINT uk_bds_cm_client_client_id UNIQUE (client_id));
ALTER TABLE bds_cm_client ADD (CONSTRAINT fk_bds_cm_client_group_oid FOREIGN KEY (group_oid) REFERENCES bds_cm_client_group (oid));

COMMENT ON TABLE bds_cm_client IS '클라이언트';

COMMENT ON COLUMN bds_cm_client.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_client.group_oid IS '그룹ID';
COMMENT ON COLUMN bds_cm_client.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_client.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_client.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_client.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_client.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_client.api_valid_time IS '클라이언트 API 검증시간';
COMMENT ON COLUMN bds_cm_client.app IS '제품 명';
COMMENT ON COLUMN bds_cm_client.app_type IS '제품 유형';
COMMENT ON COLUMN bds_cm_client.client_id IS '클라이언트 ID';
COMMENT ON COLUMN bds_cm_client.deleted IS '삭제여부';
COMMENT ON COLUMN bds_cm_client.comp_oid IS '회사 OID';
COMMENT ON COLUMN bds_cm_client.end_time IS '만료날짜';
COMMENT ON COLUMN bds_cm_client.grant_types IS '권한 유형';
COMMENT ON COLUMN bds_cm_client.name IS '클라이언트 명';
COMMENT ON COLUMN bds_cm_client.secret IS '클라이언트 SECRET';
COMMENT ON COLUMN bds_cm_client.start_time IS '시작날짜';
COMMENT ON COLUMN bds_cm_client.two_factor IS '2차 인증여부';

--
CREATE TABLE bds_cm_user
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1) DEFAULT 'Y',
	comp_oid VARCHAR2(100) DEFAULT 'default' NOT NULL,
	custom_info VARCHAR2(2000 CHAR),
	dept_id VARCHAR2(100) DEFAULT 'G000' NOT NULL,
	division VARCHAR2(36) DEFAULT 'STAFF',
	email VARCHAR2(200) NULL,
	gender VARCHAR2(1) NULL,
    birthdate VARCHAR2(30) NULL,
	fail_count NUMBER(10) DEFAULT 0,
	fail_time NUMBER(19) DEFAULT 0,
	hand_phone VARCHAR2(200),
	locked VARCHAR2(1) DEFAULT 'N',
	name VARCHAR2(250 CHAR) NOT NULL,
	password VARCHAR2(250) NOT NULL,
	pass_changed_time NUMBER(19) DEFAULT 0,
	password_salt VARCHAR2(250),
	start_time NUMBER(19) DEFAULT 0,
	end_time NUMBER(19) DEFAULT 0,
	status VARCHAR2(50) DEFAULT 'ACTIVE' NOT NULL,
	two_factor VARCHAR2(1) DEFAULT 'N',
	user_id VARCHAR2(100) NOT NULL,
	family_name VARCHAR2(100 CHAR),
	given_name VARCHAR2(100 CHAR),
	email_verified VARCHAR2(1) DEFAULT 'N',
	phone_number_verified VARCHAR2(1) DEFAULT 'N',
	picture VARCHAR2(250),
	gpki_id VARCHAR2(250),
	user_locale VARCHAR2(50),
	del_user_id VARCHAR2(100),
	last_login_time NUMBER(19,0) DEFAULT 0,
	pre_login_time NUMBER(19) DEFAULT 0,
	first_str VARCHAR2(250),
	second_str VARCHAR2(250)
);

ALTER TABLE bds_cm_user ADD (CONSTRAINT pk_bds_cm_user PRIMARY KEY (oid));
ALTER TABLE bds_cm_user ADD (CONSTRAINT uk_bds_cm_user_user_id UNIQUE (user_id));

COMMENT ON TABLE bds_cm_user IS '사용자';

COMMENT ON COLUMN bds_cm_user.oid IS '객체ID';
COMMENT ON COLUMN bds_cm_user.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_user.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_user.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_user.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_user.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_user.comp_oid IS '회사 OID';
COMMENT ON COLUMN bds_cm_user.custom_info IS '커스텀 정보';
COMMENT ON COLUMN bds_cm_user.dept_id IS '부서 ID';
COMMENT ON COLUMN bds_cm_user.division IS '직책 구분';
COMMENT ON COLUMN bds_cm_user.email IS '이메일';
COMMENT ON COLUMN bds_cm_user.gender IS '성별';
COMMENT ON COLUMN bds_cm_user.birthdate IS '생년월일';
COMMENT ON COLUMN bds_cm_user.fail_count IS '실패횟수';
COMMENT ON COLUMN bds_cm_user.fail_time IS '실패시간';
COMMENT ON COLUMN bds_cm_user.hand_phone IS '핸드폰 번호';
COMMENT ON COLUMN bds_cm_user.locked IS '잠금 여부';
COMMENT ON COLUMN bds_cm_user.name IS '사용자 이름';
COMMENT ON COLUMN bds_cm_user.password IS '비밀번호';
COMMENT ON COLUMN bds_cm_user.pass_changed_time IS '비밀번호 변경일';
COMMENT ON COLUMN bds_cm_user.password_salt IS '비밀번호 SALT';
COMMENT ON COLUMN bds_cm_user.start_time IS '시작날짜';
COMMENT ON COLUMN bds_cm_user.end_time IS '만료날짜';
COMMENT ON COLUMN bds_cm_user.status IS '상태';
COMMENT ON COLUMN bds_cm_user.two_factor IS '2차인증 여부';
COMMENT ON COLUMN bds_cm_user.user_id IS '사용자 ID';
COMMENT ON COLUMN bds_cm_user.family_name IS '이름 (성)';
COMMENT ON COLUMN bds_cm_user.given_name IS '이름';
COMMENT ON COLUMN bds_cm_user.email_verified IS '이메일 인증여부';
COMMENT ON COLUMN bds_cm_user.phone_number_verified IS '핸드폰 인증여부';
COMMENT ON COLUMN bds_cm_user.picture IS '사진';
COMMENT ON COLUMN bds_cm_user.gpki_id IS 'GPKI 아이디';
COMMENT ON COLUMN bds_cm_user.user_locale IS '사용자 로케일';
COMMENT ON COLUMN bds_cm_user.del_user_id IS '삭제된 아이디';
COMMENT ON COLUMN bds_cm_user.first_str IS '커스텀필드';
COMMENT ON COLUMN bds_cm_user.second_str IS '커스텀필드';
COMMENT ON COLUMN bds_cm_user.last_login_time IS '최근 로그인 시간';
COMMENT ON COLUMN bds_cm_user.pre_login_time IS '이전 로그인 시간';

--
CREATE TABLE bds_cm_cache
(
	group_id VARCHAR2(250) NOT NULL,
	name VARCHAR2(250) NOT NULL,
	cache_value VARCHAR2(4000) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0
);

ALTER TABLE bds_cm_cache ADD (CONSTRAINT pk_bds_cm_cache PRIMARY KEY (group_id, name));

COMMENT ON TABLE bds_cm_cache IS '캐시';

COMMENT ON COLUMN bds_cm_cache.group_id IS '그룹 ID';
COMMENT ON COLUMN bds_cm_cache.name IS '이름';
COMMENT ON COLUMN bds_cm_cache.cache_value IS '값';
COMMENT ON COLUMN bds_cm_cache.insert_time IS '생성일';

--
CREATE TABLE bds_cm_schedule
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1),
	title VARCHAR2(1000 CHAR),
	expression VARCHAR2(100 CHAR) NOT NULL,
	success_yn VARCHAR2(1),
	execute_time NUMBER(19) DEFAULT 0,
	description VARCHAR2(1000)
);

ALTER TABLE bds_cm_schedule ADD (CONSTRAINT pk_bds_cm_schedule PRIMARY KEY (oid));

COMMENT ON TABLE bds_cm_schedule IS '스케줄러';

COMMENT ON COLUMN bds_cm_schedule.oid IS '객체 ID';
COMMENT ON COLUMN bds_cm_schedule.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_schedule.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_schedule.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_schedule.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_schedule.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_schedule.title IS '제목';
COMMENT ON COLUMN bds_cm_schedule.expression IS '표현식';
COMMENT ON COLUMN bds_cm_schedule.success_yn IS '성공여부';
COMMENT ON COLUMN bds_cm_schedule.execute_time IS '실행시간';
COMMENT ON COLUMN bds_cm_schedule.description IS '설명';
--
CREATE TABLE bds_shedlock(
	name VARCHAR2(64) NOT NULL,
	lock_until TIMESTAMP(3) NOT NULL,
	locked_at TIMESTAMP(3) NOT NULL,
	locked_by VARCHAR2(255) NOT NULL
);

ALTER TABLE bds_shedlock ADD (CONSTRAINT pk_bds_shedlock PRIMARY KEY (name));

COMMENT ON TABLE bds_shedlock IS 'shedlock정보';

COMMENT ON COLUMN bds_shedlock.name IS '사용자OID';
COMMENT ON COLUMN bds_shedlock.lock_until IS '잠금유지시간';
COMMENT ON COLUMN bds_shedlock.locked_at IS '잠긴시간';
COMMENT ON COLUMN bds_shedlock.locked_by IS '잠긴스케줄러';
--
CREATE TABLE bds_cm_alk_user
(
    alk_type VARCHAR2(100) NOT NULL,
    alk_site VARCHAR2(100) NOT NULL,
    alk_id VARCHAR2(250) NOT NULL,
    use_yn VARCHAR2(1) DEFAULT 'Y',
    insert_time NUMBER(19) DEFAULT 0,
    insert_user VARCHAR2(100),
    update_time NUMBER(19) DEFAULT 0,
    update_user VARCHAR2(100),
    user_oid VARCHAR2(100) NOT NULL,
    user_id VARCHAR2(100),
    expires_in NUMBER(19) DEFAULT 0,
    first_str VARCHAR2(250),
    second_str VARCHAR2(250),
    custom_info VARCHAR2(2000)
) ;

ALTER TABLE bds_cm_alk_user ADD (CONSTRAINT pk_bds_cm_alk_user PRIMARY KEY (alk_type, alk_site, alk_id));

COMMENT ON TABLE bds_cm_alk_user IS '사용자 인증 확장';

COMMENT ON COLUMN bds_cm_alk_user.alk_type IS '연동 타입';
COMMENT ON COLUMN bds_cm_alk_user.alk_site IS '연동 사이트';
COMMENT ON COLUMN bds_cm_alk_user.alk_id IS '객체 ID';
COMMENT ON COLUMN bds_cm_alk_user.use_yn IS '사용여부';
COMMENT ON COLUMN bds_cm_alk_user.insert_time IS '생성일';
COMMENT ON COLUMN bds_cm_alk_user.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_alk_user.update_time IS '수정일';
COMMENT ON COLUMN bds_cm_alk_user.update_user IS '수정자';
COMMENT ON COLUMN bds_cm_alk_user.user_oid IS '연동 객체ID';
COMMENT ON COLUMN bds_cm_alk_user.user_id IS '연동 아이디';
COMMENT ON COLUMN bds_cm_alk_user.expires_in IS '만료시간';
COMMENT ON COLUMN bds_cm_alk_user.first_str IS '커스텀컬럼';
COMMENT ON COLUMN bds_cm_alk_user.second_str IS '커스텀컬럼';
COMMENT ON COLUMN bds_cm_alk_user.custom_info IS '커스텀 컬럼';


--
CREATE TABLE bds_cm_client_user
(
    client_oid VARCHAR2(100) NOT NULL,
    user_oid VARCHAR2(100) NOT NULL,
    insert_user VARCHAR2(100),
    insert_time NUMBER(19) DEFAULT 0,
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
) ;

ALTER TABLE bds_cm_client_user ADD (CONSTRAINT pk_bds_cm_client_user PRIMARY KEY (client_oid, user_oid));

COMMENT ON TABLE bds_cm_client_user IS '클라이언트 접근 사용자';

COMMENT ON COLUMN bds_cm_client_user.client_oid IS '클라이언트 OID';
COMMENT ON COLUMN bds_cm_client_user.user_oid IS '유저 OID';
COMMENT ON COLUMN bds_cm_client_user.insert_user IS '생성자';
COMMENT ON COLUMN bds_cm_client_user.insert_time IS '생성일';
-- END CREATE TABLE --------------------------


ALTER TABLE bds_cm_password_changed ADD CONSTRAINT fk_bds_cm_password_changed FOREIGN KEY (user_oid) REFERENCES bds_cm_user (oid);

ALTER TABLE bds_cm_client_user ADD CONSTRAINT fk_bds_cm_client_user_user_oid FOREIGN KEY (user_oid) REFERENCES bds_cm_user(oid); 

-- START CREATE INDEX ------------------------
-- ipfilter
CREATE INDEX idx_bds_cm_ip_filter ON bds_cm_ip_filter (entity_oid);

-- auth log
CREATE INDEX idx_bds_cm_audit_log ON bds_cm_audit_log (insert_time);

-- login history
CREATE INDEX idx_bds_cm_login_history1 ON bds_cm_login_history (user_id);
CREATE INDEX idx_bds_cm_login_history2 ON bds_cm_login_history (user_id, login_ip);
CREATE INDEX idx_bds_cm_login_history3 ON bds_cm_login_history (insert_time);

-- password changed
CREATE INDEX idx_bds_cm_password_changed1 ON bds_cm_password_changed (user_oid, user_type);
CREATE INDEX idx_bds_cm_password_changed2 ON bds_cm_password_changed (changed_time);

-- cm cache
CREATE INDEX idx_bds_cm_cache1 ON bds_cm_cache (group_id);
CREATE INDEX idx_bds_cm_cache2 ON bds_cm_cache (insert_time);
-- END CREATE INDEX --------------------------

INSERT INTO bds_cm_license (oid, app, license_key, use_yn, insert_user, insert_time, update_user, update_time) VALUES
('12345o99Jy7P3Fh23nWvhF', 'SSO', 'eyJvaWQiOiJkZWZhdWx0IiwiYXBwIjoiU1NPIiwiaXBMaXN0IjpudWxsLCJjbGllbnRMaXN0IjpudWxsLCJzdGFydFRpbWUiOjAsImVuZFRpbWUiOjAsInVuTGltaXRlZCI6dHJ1ZX0.FNr7hgJDEU78DGuCirYEE8cPuyqpN6VNlN_708ZNtAtoZZvLnq59_IYYniV4709x8UF5OVW7aMypkShj0bHNqhF8tFSTRR2bYMmbOFTUKEkP-TS2qdSBmDYp4h8ip5EvXMPUSmI6Ib8P3uH_PjujJbtE8LntujJvWMzqKiging_I3OINuWOcgw-e3xgR9Q6LtVvDG8fETDBoYLE2_Kge3F3jHA7BRaiHRXoTRHRFu5FfaeC_p99fHyRapz_uucw_rfbY9ycOA0wheHIFuU5yHgPWPNKMz__Y1OPL7fDAxc9E9d73MJSJccDzM5oj7TegiD5zU-QEAmIrfWGrtA19sg.MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkTsBJI9nlaLuKHUI75l1B7L52WjzpZpWHTi7CCBaCMu6ApDI8JT8ah7RcexZ5ieLZxS8uVWSKRv4JTAYg0z0-FlyE3w8nodBDv48vU4XCQWEcfMTetsHAp7IXWLvEBTIevbf_bBbFCyif1-u-dKPChgMov_hbVX1YqYAQfwZCIsNTbCa1XIS28PE8vOsb0rruYZMzah6fAwJXE_ErC3EbO3V8SrYpwA_pKDgS-gVjLjrExaPbABz-2fcBQZR559cHtlZBUUBkLy6rjHMr9bBQGpQjrkP_fUd0IwAKzR3lNBtRmPbvv9-eQMJ7-rOLpzlWEqkgNDtE7BHivobnBMy3QIDAQAB', 'Y', 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1582273490607);

INSERT INTO bds_cm_user (oid, user_id, status, division, start_time, end_time, comp_oid, dept_id, password, password_salt, email, name, fail_count, fail_time, hand_phone, locked, pass_changed_time, two_factor, use_yn, insert_user, insert_time, update_user, update_time) VALUES
('BKO7M7XqOtqoszsfS19VDH', 'test', 'ACTIVE', 'STAFF', 0, 0, 'default', 'G000', '4b925ba2806478fed5ff95476615936cf16263c0a48bb666f040893f608c1df982961ff7b293e58c25ce1f83a325e4c64bbe0e5849c4b7fff071eba41ac35bdf', 'lpY6TFJi3lZKsZx6c3zJb5c01gjOQGyX-lh1u_Y6jxE', 'test@test.net', 'Test Name', 0, 1579676524846, '010-1234-1234', 'N', 1580447667994, 'N', 'Y', 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1582273490607);
INSERT INTO bds_cm_user (oid, user_id, status, division, start_time, end_time, comp_oid, dept_id, password, password_salt, email, name, fail_count, fail_time, hand_phone, locked, pass_changed_time, two_factor, use_yn, insert_user, insert_time, update_user, update_time) VALUES
('9fjdRo99Jy7P3Fh23nWvhF', 'bandisso', 'ACTIVE', 'STAFF', 0, 0, 'default', 'G000', 'bb1bae392009f07512c7188b30624a012e34277225f25318f33d935ccddb75e7cab2e615969d52691862cd116881d45af2614a7bc03ab772195af9702d9fd6ed', 'o5KdSOKSVLYZiWemPpXDXnhLHJAtJAYFwymDh6G25ZQ', 'bandisnc@bandisnc.com', 'Bandisnc', 0, 1579676524846, '010-1234-1234', 'N', 1580447667994, 'N', 'Y', 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1582273490607);

INSERT INTO bds_cm_admin (oid, user_id, name, user_role, status, start_time, end_time, password, password_salt, fail_count, fail_time, locked, pass_changed_time, use_yn, insert_user, insert_time, update_user, update_time) VALUES
('9fjdRo99Jy7P3Fh23nWvhF', 'bandisnc', 'bandisso', 'ADMIN', 'ACTIVE', 0, 0, 'bb1bae392009f07512c7188b30624a012e34277225f25318f33d935ccddb75e7cab2e615969d52691862cd116881d45af2614a7bc03ab772195af9702d9fd6ed', 'o5KdSOKSVLYZiWemPpXDXnhLHJAtJAYFwymDh6G25ZQ', 0, 1579676524846, 'N', 1580447667994, 'Y', 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1582273490607);

INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('admin.login.two.factor.check', 'false', 'Y', '관리자 로그인 2차인증 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('admin.password.change.period', '180', 'Y', '관리자 비밀번호 변경기간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('admin.password.max.fail.count', '5', 'Y', '관리자 비밀번호 최대 실패 회수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('admin.unlock.auto.period', '1', 'Y', '관리자 잠길경우 자동으로 unlock 되는 시간(분) 1보다 크면', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('admin.ip.limit.count', '1', 'Y', '관리자 IP 입력 개수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('audit.log.use', 'true', 'Y', '감사 로그 기록 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('audit.log.max.size', '1024', 'Y', 'sso audit log 최대 용량 (MB)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('audit.log.sendmail.percent', '80', 'Y', 'sso audit log 경고 메일 발송 (%)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('audit.log.remove.percent', '90', 'Y', 'sso audit log 삭제 한계 (%)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('audit.log.remove.period', '12', 'Y', 'SSO Audit Log 유지 기간(달)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('user.unlock.auto.period', '0', 'Y', '사용자 잠길경우 자동으로 unlock 되는 시간(분) 1보다 크면', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('userid.min.length', '5', 'Y', '사용자 아이디 최소 길이', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('userid.max.length', '30', 'Y', '사용자 아이디 최대 길이', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('userid.first.english.count', '1', 'Y', '사용자 아이디 처음 영어 알파벳 사용 개수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('userid.check.pattern', '^[a-zA-Z0-9]*$', 'Y', '사용자 아이디 검사 정규식 ', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('userid.check.pattern.message.ko', '아이디에는 영문, 숫자만 사용할 수 있습니다.', 'Y', '사용자 아이디 검사 정규식 메시지(한글) ', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('userid.check.pattern.message.en', 'Only English letters, numbers can be used for ID.', 'Y', '사용자 아이디 검사 정규식 메시지(영문) ', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.lower.case.count', '1', 'Y', '비밀번호 알파벳 소문자 개수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.min.length', '10', 'Y', '비밀번호 최소 길이', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.max.length', '30', 'Y', '비밀번호 최대 길이', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.inputable.special.characters', '`~!@#$%^&*()-_=+[]{};:''"\|,.<>/?', 'Y', '입력할 수 툭수 문자열', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.special.characters.count', '1', 'Y', '비밀번호 특수 문자 개수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.non.repeatable.count', '3', 'Y', '똑같은 문자 반복 회수 제한', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.number.count', '1', 'Y', '비밀번호 숫자 개수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.recent.check.count', '3', 'Y', '최근 사용한 비밀번호 입력불가 수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.upper.case.count', '0', 'Y', '비밀번호 알파벳 대문자 개수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.init.method', 'random', 'Y', '비밀번호 초기화 방법(input, random, fixed)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.init.method.fixed.value', '_', 'Y', '비밀번호 초기화 고정값', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.change.period', '180', 'Y', '비밀번호 변경기간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.change.delay.day', '14', 'Y', '비밀번호 변경하지 않고 다음에 연기하는 기간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.max.fail.count', '5', 'Y', '비밀번호 최대 실패 회수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.use.salt', 'true', 'Y', '비밀번호 암호화에 salt 사용 여부(true/false)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.salt.length', '32', 'Y', '비밀번호 암호화에 salt 길이', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('password.change.check.day', '10', 'Y', '비밀번호 변경 검사 일(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('two.factor.expire.time', '600', 'Y', 'Two Factor 인증 만료시간 (초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.cm.config', 'false', 'Y', 'Config cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.cm.ipfilter', 'false', 'Y', 'IpFilter cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.cm.user', 'true', 'Y', 'User cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.cm.client', 'true', 'Y', 'Client cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.cm.client.uri', 'true', 'Y', 'Client URI cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('login.duplicate.count', '5', 'Y', '중복로그인 허용개수', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('login.duplicate.exceed.method', 'logout', 'Y', '중복 로그인 처리 방법(logout, exception)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('login.duplicate.token.type.check', 'true', 'Y', '로그인 타입(normal, mobile)별 중복 로그인 검사 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('login.form.use.pki', 'true', 'Y', '로그인 폼 공개키 방식 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('mail.default.sender', 'admin@sso.baindisnc.com:Admin', 'Y', '기본 Notice 발송 주소', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('mail.notice.receiver.list', 'test@sso.baindisnc.com:Test,test1@test.com:Test1', 'Y', 'SSO Notice 받을 주소 목록', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('client.invalid.check.period', '60', 'Y', 'client api valid 검사 시간 (분)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('client.ip.check', 'false', 'Y', 'client ip 검사 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('client.user.check', 'false', 'Y', 'client별 사용자 검사 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('bandisnc.user.info.remove', 'true', 'Y', '사용자 삭제시 사용자정보 삭제 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('user.add.init.status', 'INIT', 'Y', '사용자 등록 시 초기상태', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('admin.login.user.status.check', 'false', 'Y', '관리자 로그인 시 사용자 상태여부 체크', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('user.check.valid.after.password', 'false', 'Y', '비밀번호 검사 전에 사용자 유효한지 검사 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('login.history.remove.period', '12', 'Y', '로그인 이력 유지 기간(달)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('user.sleeper.check.period', '0', 'Y', '휴면계정 검사 기간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');


INSERT INTO bds_cm_server_key (oid, insert_time, insert_user, update_time, update_user, use_yn, expired, expired_time, encode_type, key_type, private_key, public_key, version) VALUES
('1sQETtsGCBwiRM1yaIKAYC', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 'Y', 'N', 0, 'BASE64URL', 'DEFAULT', 'GjhzWC8hTk9cCYF8ZAiHQPKHu1gGAun-VDDQFeYgCydyISFfA6g2eMSmDTBhgttN7wOKNgJ_S3FtfFzoKo5_RnbdXonoYn-LgqaYlCWrkU3-mWFGSYDQL2vxEzg_6VNtkENA20Umqv_cH0GhT-Ys369cm92_D1oVZxY88LUzrlZ3puZnojEB8Oo9tJk-3hmT3XLukq2239eTvS1-7Vn2_8hef-OC_PPbODeDkaTsku7wtBtqodtrJUinByDw78Sfdp85RHcKYQqwmawiO_b7mo9bJF_b2tNTKT2ZAJGEqI6UcIt66KL_El1_e3vFDrXVUHOBWn1H_Kb36Pp46iy7eSlG937q1ICKI43DkzuC1MSSD2Ta7bqXpyomIHlEAbgAM6eRFdwJdane6xj1_apElwQNX8SDTaDZPih931tdGHjFeUhCcAx0lJBontuvOPQqo8l75yvO3ZUNeI2EXow5cr92Nad3HZ0EFnj3WR5pFGmcXeE-g7vQFTrQRLdHEyFgXmvZqbHT_9A6FgnkvGzEHZ_taA-aIRJRopBvOUQYPb4mXBtBHzkuY_EUaH_pIKKpdgN2_QpTKKm4YTq-lRlGKILwB3HSOON9YT4W9f0roh7EhXGsRqwVzwX_n2p0DWq_6dd-8aMS-EIqJ4yhl9YIW1AFpiDIng3RbMuRPAPlZ-5Gch_VxO1E0RRAFqdy1Nq7APyqHeNNCliEoeLuML0tKubWQsCfkRBxp5oipIHuZ9--rxDjIC2ovkOvEwx6hL4Ypu6yh5L0rLo5HXtzG9XyABJ__ColUCwZsq2RHPr6FqDGParbgVnbr6RtPJRI6PTYebv4svzVCSMGdSX_2DenKbcTjiFIgsvdkmK1HpPBVNHUUGkkpj75gvHL5QJDVCZgLllUeddgspr8Kz6k9YpneKdUFqnwlVHfS1_1JWnm0p2omgtaCxDJpXbut7kGHZic6MKO58iZlUbahX5ZqkBCO-s1hBl1Y0Kh-P_oCr0bnCZvfQ2IiAA6SgI9F4duPxWUjXEYXW9AgfouRH7KY04Yl33VffjUvwaTkq_zBFvNzRISzjZR0UwgWK5jXGUhq_8mzhj0P_213eKkB3JQFijlUhz-LxhBDt6G7k45LrjZUbm2ZpYm0JTLfah5bE99g-Q1tI1zmszdfCzqui0VLirAKIOWkl-FpfpoTFraOv90TQx_nWpeRvC-0hJlQvO-MotNAbHb633pbM-qtWOHzfxyKGqP7tz4sagnRPlNP4OL4mteg3LqyPMoRR8dktdsKlNlr_6Cz1AG2i-zvKAbF-twpKGr7F02rmNhKjswFjkr5USTa1hBUOHSAd0HtovFUbJUONIBBvgdgHdF5LpdiLyd72KI-O97PcOD6a8MRCoJZlwA1n5-nX2VuWb53AVzDZFUAd1ZRinOg8UKLSm12aN2ddtumlm3KKSwrChfo4bgW3Xu-Up9cK-bSsdpehPFMHffpQAoiP9OV5KcZZucQ0RvW3QKJ2ryV8P-sZ6Zj4JINMv9GiWAga_l3DHNCMQzfD79UJKzk1gXTmE7hZbEVaKaRyKCtlzUQx6UBizgY5knXqbBXQjHfZTtMoXszuhqns4I0V9mPCIbpnVvBMFtg95GNWNJYQeWOurr6zQMm3jpBOw', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAld3iVV1qKjd_V2C9jDMFBTP-abxNeBLDLbYOMXdvSSkscZEgbMbQhQBhCaSpY6df0AuAzp098bAQqLEkbz7RxvrA8fMHMXkeMUfc-eTLrB-TwhlmBkHII6YsgedYZ6RmGUgth35mHU5VseKV-K8BIhtKBZUyKh4cSMEBkcyVfBScVbL9GcxD-4gA-NHRL2JKo46eWQ9_S_DLijbuusiVsXSiUM1zn432wKvRheZpRZe_n4JHKSFR0mA3HB0Fy8SzXReZ2cDz5kiSr62__mcYJSAq-SVTgo0aTVZtY0-iR9hloxXBDiJayWV8uAyv8RdjB1d4qbg4ANQLDG5-y6hnvwIDAQAB', 1);
INSERT INTO bds_cm_server_key (oid, insert_time, insert_user, update_time, update_user, use_yn, expired, expired_time, encode_type, key_type, private_key, public_key, version) VALUES
('GCKWSNZBRyCilkjWQfcgvA', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 'Y', 'N', 0, 'BASE64URL', 'SIGN', 'GjhzWC8hTk9cCYF8ZAiHQPKHu1gGAun-VDDQFeYgCyd4w25Gmp0fPCZ89cQQwhkUF4S2MztHNIs5TU0NHaCmTNZK6kQC67aHSfq1yPOMRiou1OkuXIOXu5r2BABEb3e4UiZKNm7m9tVNxnxVqjjsG_5QcwS5Jpln9rahQS8jyufeyeq9cCn06B8Zgx290MQZggz7CbCz5dM_7Ywls9TW7S5nDRp3Qy5dxbkQACehc8t5Aa5Ugtuj-aDOj4cAiY0Ng5S74buBYMoeBSWPNkFHACtw7lsx6oRP2rPyVThShiGCvcnTlI-9Q4tFqH7GH1G5H_ZCOaqt7wd0JH0mFEX-LilJGUmFQT9iGtseUdIt2u79-hmyNJnUPAuu2W7gEs84RgPy0Jsrggy82aJjHbdX6_PHpPNfoeyajlz0Q1bu_fh-qAZzXJnMQDEFkht66VvbA33-j5HPB6MJHpLpR2tNjyL8NpulkA5yBoWq8Vf5Jmm8XxXJfSP3DLtt8qVhYC-UlMkv5pIyy7DGlMiUGyYisrkLWt4ZU1eApM1Te5NeA5L2YKkxAbAR_qGlYav7uWpJ_jLOqhfMCImMRl7uDBIPEED9vM8xTD8h2NdI0YmynHqXSCIFQO-T5Y8JUM0wpprzBzNuvP3fx4YCe68YlmYDCtDoKKt6kSAWhA4j-zDSbJFbtSIwV-6hLNQFSjThk9KrrLdPJylGXr0FmdiQlbKmYxIWXjcEB2OKSgQWAQrtZwgVNRGEiFIO18zBTlCZa9KQp7tZ7NCkVIZrLEqlAe0UaN-_w7F5aGwl8ATByszw7h8OtL3ADp3fiGaeHhk7BXevCqSpAchygaNo_66NO2XoKuYGCByldhPGJSAyvQgSkj9AaCmHAHIs9nzrqN0MdrrZW170urfIP9KRZAG5y0eLwdiFaoEqj72dC690bVIiWxzjXrCfvlDekUQkaJy3uBIqpBxWeaXhF5M-nIKJbVq-uu1OsnVN9C14925BiGwcfFPbH6YKKaT9gheDFaXqRDzlvPp0d8dkMNudVNQZqenUwbY7qj9GUd-WKujm02fZxEumUYCN_8YhAyAqWbIg4tlPxQcjuM8BM3-dGEymVh-Gkl68-pR-sEKH25oxHpdDvegLQbSogmeRmA6nYvANYEhtT7FKwVE9eQLoRHj13hGPgXjk1_IH5Jg3Lpnp3l60HWmISmqVW4ewQQSp2h6xr-nReP0eOGdjKsN-yNGDIy3dEfRUzTgRUE9qTOPT0G6ekG3uUbeoWFRmJQHkYExc1cx6eJnH04osBhK2Cfwn78m6qFCxZPFUEiSVUTWLNQRgkxJJ1U87zlLxtvQOa0fhL4NyvPQDOoxS47-x5qPvrrTZ6Ea6Hvnv3dl8ikCtaAoAaEVv-JY21lKEHUUt1DbuTgeshcAVIJPImrMCjJgBLpF-jF5PEfdaK3VD9tEYGJjSluZpfH9UzkDSQQkTtSAKFVyMFAuquCwO6IP0hCez6sWKZr3kT54PX8MNH0Q68u_qu_H4i7SVrTApjCqZCaF8MvaZQO_T5vzBJuIFcc_5XPifoO2r9xRcgpedoXi7bgyn3WnAa7JNDXAvd8LTag-BQ42XJoskm8E6ef90TR3eRAKH1u14Lser4Xh_QdJAlWU6TcI', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqYf0MJSMayb6sRJyyqHpO0KS-yQDi4-05q1fN2c-CvTSfU6HDcJ69Q-Ta8MPA9UJ-TnaUbCml4Y6A6ZrkSwyI3U2IxkWTTFwN9AdnYEwV1cfD7kzbd9r-eoP6Plp2W-kW8ieQkNNuZ07-uxan98wWSnUSOaTXHIsPpcJKWC8IwS--XKSyd4J-jUHcqCYd0R8BoLeeHfZe2B3Cr8bW7j1_GgZa9QDBSFvCSGmrPXiclWz7IUynRQcWrw9zwyQBaLdGmaCFIL3lqdTHEM-1pmlW2_Q0z3-JpmUdYTyD9h_Zt6OS_k7Q2sH7BDL-aBE8rSHe1wKqNDwB9bz8f5vqOOLMwIDAQAB', 1);

INSERT INTO bds_cm_client_group (oid, name, group_id, use_yn, insert_time, parent_oid, insert_user, update_time, update_user, sort_order)
VALUES ('ROOT', 'SSO 클라이언트', 'ROOT', 'Y', 1684400558177, 'N/A', '9fjdRo99Jy7P3Fh23nWvhF',1684400558177, '9fjdRo99Jy7P3Fh23nWvhF', 0);

INSERT INTO bds_cm_client (oid, group_oid, client_id, comp_oid, start_time, end_time, api_valid_time, insert_time, insert_user, update_time, update_user, two_factor, use_yn, deleted, name, app, secret, grant_types) VALUES
('Nm4BdenPGKnEPozf8xk5YK', 'ROOT', 'sso_client', 'default', 0, 0, 0, 1566277486595, 'admin', 1566277486595, 'admin', 'N', 'Y', 'N', 'SSO 서버 클라이언트', 'SSO', 'VjW_wYMNlJ_Rlyr668TV1HrlJuJD8oKY6wtKObheoqUVEsiWUBngGs1NJUnBDn2psu7FJrILCJgatVWRffgL3wrSzzK3cNycG40lxcAptAo', 'A,I,P');
INSERT INTO bds_cm_client (oid, group_oid, client_id, comp_oid, start_time, end_time, api_valid_time, insert_time, insert_user, update_time, update_user, two_factor, use_yn, deleted, name, app, secret, grant_types) VALUES
('XD9UNCyTBJDkT1IIPFmM1B', 'ROOT', 'test_client_id', 'default', 0, 0, 0, 1566277486595, 'admin', 1566277486595, 'admin', 'N', 'Y', 'N', '테스트 클라이언트', 'SSO', '0Uz-UJX0kUOdGqBECq9WgFcUbIh-RKTgDkIHO0vI-58deIE35X8y_yYD4WCj6INCGL_tdJc8mhRPUr1Gx6k_JGCC8g49glg1qqRvVrtwDXM', 'A,I,P,C');

INSERT INTO bds_cm_client_uri (client_oid, uri_type, use_yn, redirect_uri, insert_time, insert_user, update_time, update_user) VALUES
('Nm4BdenPGKnEPozf8xk5YK', 'AUTH_URL', 'Y', 'http://localhost:9091', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_client_uri (client_oid, uri_type, use_yn, redirect_uri, insert_time, insert_user, update_time, update_user) VALUES
('Nm4BdenPGKnEPozf8xk5YK', 'AUTH_RESULT', 'Y', 'http://localhost:9091', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_client_uri (client_oid, uri_type, use_yn, redirect_uri, insert_time, insert_user, update_time, update_user) VALUES
('XD9UNCyTBJDkT1IIPFmM1B', 'AUTH_URL', 'Y', 'http://localhost:9092/sso/auth/form/to/server', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_client_uri (client_oid, uri_type, use_yn, redirect_uri, insert_time, insert_user, update_time, update_user) VALUES
('XD9UNCyTBJDkT1IIPFmM1B', 'AUTH_RESULT', 'Y', 'http://localhost:9092/sso/auth/result', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH', 1566277486595, 'BKO7M7XqOtqoszsfS19VDH');

INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('uq9SHhRwQBqvUh4UcHAaZw', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV4', '127.0.0.1', 1566277486595, 'bandisnc', '9fjdRo99Jy7P3Fh23nWvhF', 'ADMIN');
INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV4', '127.0.0.1', 1566277486595, 'bandisso', '9fjdRo99Jy7P3Fh23nWvhF', 'USER');
INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('8k3pta63EVdun2qpfmiqLH', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV6', '0:0:0:0:0:0:0:1', 1566277486595, 'sso_client', 'Nm4BdenPGKnEPozf8xk5YK', 'CLIENT');
INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('rY54lLxbJdlljXuEvl0VPA', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV4', '127.0.0.1', 1566277486595, 'sso_client', 'Nm4BdenPGKnEPozf8xk5YK', 'CLIENT');
INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('I6eCVHwDEaMXLUdAPQ4xmE', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV4', '192.168.11.179', 1566277486595, 'sso_client', 'Nm4BdenPGKnEPozf8xk5YK', 'CLIENT');
INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('BZ4rZdqCCxphvm1pKIHnRC', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV6', '0:0:0:0:0:0:0:1', 1566277486595, 'test_client_id', 'XD9UNCyTBJDkT1IIPFmM1B', 'CLIENT');
INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('OVl2DdAeOSeVq9QHg3ByfG', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV4', '192.168.11.179', 1566277486595, 'test_client_id', 'XD9UNCyTBJDkT1IIPFmM1B', 'CLIENT');
INSERT INTO bds_cm_ip_filter (oid, insert_time, insert_user, update_time, update_user, use_yn, access_type, ip_type, ip, sort_order, title, entity_oid, group_type) VALUES
('rJkmoZ4CN1sgaimhL0XzaC', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 1566277486595, '9fjdRo99Jy7P3Fh23nWvhF', 'Y', 'ALLOW', 'IPV4', '127.0.0.1', 1566277486595, 'test_client_id', 'XD9UNCyTBJDkT1IIPFmM1B', 'CLIENT');

INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('userSleeperCheckScheduleTask', '0 30 2 * * *', 'Y', '휴면계정(SLEEPER) 검사 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('needPasswordChangeCheckScheduleTask', '0 0 1 * * *', 'Y', 'COMMON 비밀번호 변경 날짜 가까운 사람 메일 발송', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('auditLogRemoveScheduleTask', '0 30 1 * * *', 'Y', 'COMMON 감사로그 삭제', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('clientInValidCheckScheduleTask', '0 0 2 * * *', 'Y', 'COMMON Client inValid check 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('cmCacheRemoveScheduleTask', '0 20 1 * * *', 'Y', 'CmCache(DB)에 저장되어 있는 예전 데이터 삭제', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('ssoUserSyncScheduleTask', '0 0 1 * * *', 'Y', '인사데이터 동기화 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
    ('loginHistoryRemoveScheduleTask', '0 0 0 * * *', 'Y', '로그인 이력 삭제 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');

commit;

CREATE TABLE bds_spring_session
(
	primary_id CHAR(36) NOT NULL,
	session_id CHAR(36) NOT NULL,
	creation_time NUMBER(19,0) NOT NULL,
	last_access_time NUMBER(19,0) NOT NULL,
	max_inactive_interval NUMBER(10,0) NOT NULL,
	expiry_time NUMBER(19,0) NOT NULL,
	principal_name VARCHAR2(100)
);

ALTER TABLE bds_spring_session ADD (CONSTRAINT pk_bds_spring_session PRIMARY KEY (primary_id));
CREATE UNIQUE INDEX idx_bds_spring_session1 ON bds_spring_session (session_id);
CREATE INDEX idx_bds_spring_session2 ON bds_spring_session (expiry_time);
CREATE INDEX idx_bds_spring_session3 ON bds_spring_session (principal_name);

--
CREATE TABLE bds_spring_session_attributes
(
	session_primary_id CHAR(36) NOT NULL,
	attribute_name VARCHAR2(200 CHAR) NOT NULL,
	attribute_bytes BLOB NOT NULL
);

-- 제약조건 길이 오류 때문에 길이 수정 pk_bds_spring_session_attributes > pk_spring_session_attributes
ALTER TABLE bds_spring_session_attributes ADD (CONSTRAINT pk_spring_session_attributes PRIMARY KEY (session_primary_id, attribute_name));
-- 제약조건 길이 오류 때문에 길이 수정 fk_bds_spring_session_attributes > fk_spring_session_attributes
ALTER TABLE bds_spring_session_attributes ADD (CONSTRAINT fk_spring_session_attributes FOREIGN KEY (session_primary_id) REFERENCES bds_spring_session (primary_id) ON DELETE CASCADE);
-- END CREATE TABLE --------------------------


-- SSO

-- START CREATE TABLE ------------------------
CREATE TABLE bds_sso_auth_code
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1),
	client_oid VARCHAR2(100) NOT NULL,
	client_id VARCHAR2(250),
	expired VARCHAR2(1),
	expired_time NUMBER(19) DEFAULT 0,
	max_expired_time NUMBER(19) DEFAULT 0,
	redirect_uri VARCHAR2(255),
	sso_token_id VARCHAR2(100),
	user_oid VARCHAR2(100) NOT NULL,
	user_id VARCHAR2(100),
	uri_params VARCHAR2(2000)
);

ALTER TABLE bds_sso_auth_code ADD (CONSTRAINT pk_bds_sso_auth_code PRIMARY KEY (oid));

COMMENT ON TABLE bds_sso_auth_code IS 'SSO인증코드';
COMMENT ON COLUMN bds_sso_auth_code.oid IS '객체ID';
COMMENT ON COLUMN bds_sso_auth_code.insert_time IS '생성일';
COMMENT ON COLUMN bds_sso_auth_code.insert_user IS '생성자';
COMMENT ON COLUMN bds_sso_auth_code.update_time IS '수정일';
COMMENT ON COLUMN bds_sso_auth_code.update_user IS '수정자';
COMMENT ON COLUMN bds_sso_auth_code.use_yn IS '사용여부';
COMMENT ON COLUMN bds_sso_auth_code.client_oid IS '클라이언트OID';
COMMENT ON COLUMN bds_sso_auth_code.client_id IS '클라이언트ID';
COMMENT ON COLUMN bds_sso_auth_code.expired IS '만료여부';
COMMENT ON COLUMN bds_sso_auth_code.expired_time IS '만료시간';
COMMENT ON COLUMN bds_sso_auth_code.max_expired_time IS '최대유효시간';
COMMENT ON COLUMN bds_sso_auth_code.redirect_uri IS '리다이렉트URI';
COMMENT ON COLUMN bds_sso_auth_code.sso_token_id IS 'SSO토큰ID';
COMMENT ON COLUMN bds_sso_auth_code.user_oid IS '사용자OID';
COMMENT ON COLUMN bds_sso_auth_code.user_id IS '사용자ID';
COMMENT ON COLUMN bds_sso_auth_code.uri_params IS 'URI파라미터';

--
CREATE TABLE bds_sso_integrity
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1),
	check_time NUMBER(19) DEFAULT 0 NOT NULL,
	hash_code VARCHAR2(250) NOT NULL,
	resource_value VARCHAR2(2000),
	resource_id VARCHAR2(250) NOT NULL,
	success VARCHAR2(1) NOT NULL
);

ALTER TABLE bds_sso_integrity ADD (CONSTRAINT pk_bds_sso_integrity PRIMARY KEY (oid));

-- 식별자의 길이가 오류로 인한 식별자명 변경 uk_bds_sso_integrity_resource_id > uk_sso_integrity_resource_id
ALTER TABLE bds_sso_integrity ADD (CONSTRAINT uk_sso_integrity_resource_id UNIQUE (resource_id));

COMMENT ON TABLE bds_sso_integrity IS 'SSO무결성검사';
COMMENT ON COLUMN bds_sso_integrity.oid IS '객체ID';
COMMENT ON COLUMN bds_sso_integrity.insert_time IS '생성일';
COMMENT ON COLUMN bds_sso_integrity.insert_user IS '생성자';
COMMENT ON COLUMN bds_sso_integrity.update_time IS '수정일';
COMMENT ON COLUMN bds_sso_integrity.update_user IS '수정자';
COMMENT ON COLUMN bds_sso_integrity.use_yn IS '사용여부';
COMMENT ON COLUMN bds_sso_integrity.check_time IS '검사시간';
COMMENT ON COLUMN bds_sso_integrity.hash_code IS '해시코드';
COMMENT ON COLUMN bds_sso_integrity.resource_value IS '원본값';
COMMENT ON COLUMN bds_sso_integrity.resource_id IS '리소스ID';
COMMENT ON COLUMN bds_sso_integrity.success IS '성공여부';

--
CREATE TABLE bds_sso_token_info
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1),
	client_oid VARCHAR2(100) NOT NULL,
	expired VARCHAR2(1),
	expired_time NUMBER(19) DEFAULT 0,
	last_conn_time NUMBER(19) DEFAULT 0,
	login_ip VARCHAR2(50) NOT NULL,
	login_type VARCHAR2(50) NOT NULL,
	max_expired_time NUMBER(19) DEFAULT 0,
	next_expired_time NUMBER(19) DEFAULT 0,
	once_id VARCHAR2(100 CHAR),
	session_id VARCHAR2(250) NOT NULL,
	start_time NUMBER(19) DEFAULT 0,
	user_oid VARCHAR2(100) NOT NULL,
	token_login_type VARCHAR2(50),
	device_id VARCHAR2(100),
	expired_cause VARCHAR2(250),
    login_param VARCHAR2(1000),
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
);

ALTER TABLE bds_sso_token_info ADD (CONSTRAINT pk_bds_sso_token_info PRIMARY KEY (oid));

COMMENT ON TABLE bds_sso_token_info IS 'SSO토큰정보';
COMMENT ON COLUMN bds_sso_token_info.oid IS '객체ID';
COMMENT ON COLUMN bds_sso_token_info.insert_time IS '생성일';
COMMENT ON COLUMN bds_sso_token_info.insert_user IS '생성자';
COMMENT ON COLUMN bds_sso_token_info.update_time IS '수정일';
COMMENT ON COLUMN bds_sso_token_info.update_user IS '수정자';
COMMENT ON COLUMN bds_sso_token_info.use_yn IS '사용여부';
COMMENT ON COLUMN bds_sso_token_info.client_oid IS '클라이언트OID';
COMMENT ON COLUMN bds_sso_token_info.expired IS '만료여부';
COMMENT ON COLUMN bds_sso_token_info.expired_time IS '만료시간';
COMMENT ON COLUMN bds_sso_token_info.last_conn_time IS '마지막통신시간';
COMMENT ON COLUMN bds_sso_token_info.login_ip IS '로그인IP';
COMMENT ON COLUMN bds_sso_token_info.login_type IS '로그인타입';
COMMENT ON COLUMN bds_sso_token_info.max_expired_time IS '최대유효시간';
COMMENT ON COLUMN bds_sso_token_info.next_expired_time IS '다음유효시간';
COMMENT ON COLUMN bds_sso_token_info.once_id IS '임시승인ID';
COMMENT ON COLUMN bds_sso_token_info.session_id IS '세션ID';
COMMENT ON COLUMN bds_sso_token_info.start_time IS '시작시간';
COMMENT ON COLUMN bds_sso_token_info.user_oid IS '사용자OID';
COMMENT ON COLUMN bds_sso_token_info.token_login_type IS '토큰로그인타입';
COMMENT ON COLUMN bds_sso_token_info.device_id IS '장치ID';
COMMENT ON COLUMN bds_sso_token_info.expired_cause IS '만료원인';
COMMENT ON COLUMN bds_sso_token_info.login_param IS '로그인파라미터';

--
CREATE TABLE bds_sso_token_pub
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1),
	expire_time NUMBER(19) DEFAULT 0 NOT NULL,
	sid VARCHAR2(100) NOT NULL,
	token_res_type VARCHAR2(20) NOT NULL,
	client_id VARCHAR2(250),
	ref_id VARCHAR2(100),
	nonce VARCHAR2(250),
    scope VARCHAR2(500),
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
);

ALTER TABLE bds_sso_token_pub ADD (CONSTRAINT pk_bds_sso_token_pub PRIMARY KEY (oid));

COMMENT ON TABLE bds_sso_token_pub IS 'SSO토큰발행';
COMMENT ON COLUMN bds_sso_token_pub.oid IS '객체ID';
COMMENT ON COLUMN bds_sso_token_pub.insert_time IS '생성일';
COMMENT ON COLUMN bds_sso_token_pub.insert_user IS '생성자';
COMMENT ON COLUMN bds_sso_token_pub.update_time IS '수정일';
COMMENT ON COLUMN bds_sso_token_pub.update_user IS '수정자';
COMMENT ON COLUMN bds_sso_token_pub.use_yn IS '사용여부';
COMMENT ON COLUMN bds_sso_token_pub.expire_time IS '만료시간';
COMMENT ON COLUMN bds_sso_token_pub.sid IS 'SID';
COMMENT ON COLUMN bds_sso_token_pub.token_res_type IS '토큰응답타입';
COMMENT ON COLUMN bds_sso_token_pub.client_id IS '클라이언트ID';
COMMENT ON COLUMN bds_sso_token_pub.ref_id IS '참조ID';
COMMENT ON COLUMN bds_sso_token_pub.nonce IS 'NONCE CLAIM';
COMMENT ON COLUMN bds_sso_token_pub.scope IS 'SCOPE CLAIM';

--
CREATE TABLE bds_sso_user_alt
(
	user_oid VARCHAR2(100) NOT NULL,
	client_oid VARCHAR2(100) NOT NULL,
	alt_user_oid VARCHAR2(100) NOT NULL,
	temp_yn VARCHAR2(1),
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100),
	use_yn VARCHAR2(1)
);

ALTER TABLE bds_sso_user_alt ADD (CONSTRAINT pk_bds_sso_user_alt PRIMARY KEY (user_oid, client_oid));

COMMENT ON TABLE bds_sso_user_alt IS 'SSO사용자대체정보';
COMMENT ON COLUMN bds_sso_user_alt.user_oid IS '사용자OID';
COMMENT ON COLUMN bds_sso_user_alt.client_oid IS '클라이언트OID';
COMMENT ON COLUMN bds_sso_user_alt.alt_user_oid IS '대체가능한사용자OID';
COMMENT ON COLUMN bds_sso_user_alt.temp_yn IS '임시여부';
COMMENT ON COLUMN bds_sso_user_alt.insert_time IS '생성일';
COMMENT ON COLUMN bds_sso_user_alt.insert_user IS '생성자';
COMMENT ON COLUMN bds_sso_user_alt.update_time IS '수정일';
COMMENT ON COLUMN bds_sso_user_alt.update_user IS '수정자';
COMMENT ON COLUMN bds_sso_user_alt.use_yn IS '사용여부';

-- END CREATE TABLE --------------------------

ALTER TABLE bds_sso_auth_code ADD CONSTRAINT fk_bds_sso_auth_code1 FOREIGN KEY (client_oid) REFERENCES bds_cm_client (oid);
ALTER TABLE bds_sso_auth_code ADD CONSTRAINT fk_bds_sso_auth_code2 FOREIGN KEY (user_oid) REFERENCES bds_cm_user (oid);
ALTER TABLE bds_sso_token_info ADD CONSTRAINT fk_bds_sso_token_info1 FOREIGN KEY (client_oid) REFERENCES bds_cm_client (oid);
ALTER TABLE bds_sso_token_info ADD CONSTRAINT fk_bds_sso_token_info2 FOREIGN KEY (user_oid) REFERENCES bds_cm_user (oid);

-- START CREATE INDEX ------------------------ 
-- sso token info
CREATE INDEX idx_bds_sso_token_info1 ON bds_sso_token_info (next_expired_time, max_expired_time, user_oid, expired);
CREATE INDEX idx_bds_sso_token_info2 ON bds_sso_token_info (max_expired_time);

-- sso auth code
CREATE INDEX idx_bds_sso_auth_code ON bds_sso_auth_code (insert_time);

-- sso token pub
CREATE INDEX idx_bds_sso_token_pub ON bds_sso_token_pub (expire_time);
CREATE INDEX idx_bds_sso_token_pub_sid ON bds_sso_token_pub (sid);
CREATE INDEX idx_bds_sso_token_pub_sid_type ON bds_sso_token_pub (sid, token_res_type);
-- END CREATE INDEX --------------------------

INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.sso.token.info', 'true', 'Y', 'SSO Token Info cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.sso.token.publish', 'true', 'Y', 'SSO Token Publish cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.authcode.max.age', '300', 'Y', 'SSO and Oauth authcode 최대 유효시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.max.age', '3600', 'Y', 'SSO 로그인 Token 최대 유효 시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.step.age', '600', 'Y', 'SSO 로그인 다음 유효 시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.ip.check', 'true', 'Y', 'SSO TOKEN ip 검사 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.info.remove.period', '12', 'Y', 'SSO Token Info 유지 기간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.publish.remove.period', '12', 'Y', 'SSO Token publish 유지 기간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.auth.code.remove.period', '12', 'Y', 'SSO Auth Code 유지 기간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.logout.redirect.url', 'http://localhost:9091', 'Y', '로그아웃 요청시 redirect_url을 보내주지 않으면 사용하는 URL', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.admin.step.age', '600', 'Y', 'SSO 로그인 ADMIN 다음 유효 시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.admin.max.age', '3600', 'Y', 'SSO 로그인 Token ADMIN 최대 유효 시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.max.age.mobile', '31104000', 'Y', 'mobile SSO 로그인 Token 최대 유효 시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.step.age.mobile', '86400', 'Y', 'mobile SSO 로그인 다음 유효 시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('sso.token.pub.max.age.mobile', '86400', 'Y', 'mobile 발행한 token SSO  최대 유효 시간(초단위)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('agent.start.exec', 'F', 'Y', 'agent 시작시 실행(F:빈값)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('agent.after.login.exec', 'F', 'Y', 'agent login 후 실행(F:빈값)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('agent.after.logout.exec', 'F', 'Y', 'agent logout 후 실행(F:빈값)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('agent.stop.exec', 'F', 'Y', 'agent 종료시 실행(F:빈값)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('agent.version', 'F', 'Y', 'agent 현재 버전(F:빈값)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('agent.download.url', 'F', 'Y', 'agent 다운로드 URL(F:빈값)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
    ('agent.custom.info', 'F', 'Y', 'agent Custom DATA (F:빈값)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');


INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('ssoTokenInfoExpireScheduleTask', '0 0 1 * * *', 'Y', 'SSO token info 만료 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('ssoTokenInfoRemoveScheduleTask', '0 0 2 * * *', 'Y', 'SSO token info 삭제 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('ssoTokenPublishRemoveScheduleTask', '0 0 3 * * *', 'Y', 'SSO token publish 삭제 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('ssoAuthCodeRemoveScheduleTask', '0 0 4 * * *', 'Y', 'SSO auth code 삭제 스케쥴러', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');

commit;


-- SAML
-- START CREATE TABLE ------------------------
CREATE TABLE bds_saml_sp
(
    oid VARCHAR2(100) NOT NULL,
    insert_time NUMBER(19) DEFAULT 0,
    insert_user VARCHAR2(100) ,
    update_time NUMBER(19) DEFAULT 0,
    update_user VARCHAR2(100) ,
    use_yn VARCHAR2(1) DEFAULT 'Y',
    entity_id VARCHAR2(250) NOT NULL,
    site VARCHAR2(250) DEFAULT 'normal' NOT NULL,
    valid_until_time NUMBER(19) DEFAULT 0,
    acs VARCHAR2(250),
    acs_binding VARCHAR2(250),
    name_id_format VARCHAR2(250),
    name_id VARCHAR2(250),
    relay_state VARCHAR2(250),
    logout_binding VARCHAR2(250),
    logout_url VARCHAR2(250),
    logout_res_url VARCHAR2(250),
    org_lang VARCHAR2(20),
    org_name VARCHAR2(250),
    org_display_name VARCHAR2(250),
    org_url VARCHAR2(250),
    cont_sur_name VARCHAR2(100),
    cont_given_name VARCHAR2(100),
    cont_email VARCHAR2(250),
    sign_cert VARCHAR2(4000),
    sign_yn VARCHAR2(1) DEFAULT 'Y',
    enc_cert VARCHAR2(4000),
    encrypt_yn VARCHAR2(1) DEFAULT 'N',
    input_xml_yn VARCHAR2(1) DEFAULT 'N',
    metadata_url VARCHAR2(250),
    metadata_xml CLOB,
    deleted VARCHAR2(1) NOT NULL
);

ALTER TABLE bds_saml_sp ADD (CONSTRAINT pk_bds_saml_sp PRIMARY KEY (oid));
ALTER TABLE bds_saml_sp ADD (CONSTRAINT uk_bds_saml_sp_entity_id UNIQUE (entity_id));

COMMENT ON TABLE bds_saml_sp IS 'SAML 정보관리';

COMMENT ON COLUMN bds_saml_sp.oid IS '객체 ID';
COMMENT ON COLUMN bds_saml_sp.insert_time IS '생성일';
COMMENT ON COLUMN bds_saml_sp.insert_user IS '생성자';
COMMENT ON COLUMN bds_saml_sp.update_time IS '수정일';
COMMENT ON COLUMN bds_saml_sp.update_user IS '수정자';
COMMENT ON COLUMN bds_saml_sp.use_yn IS '사용여부';
COMMENT ON COLUMN bds_saml_sp.entity_id IS '엔티티 ID';
COMMENT ON COLUMN bds_saml_sp.site IS '사이트 명';
COMMENT ON COLUMN bds_saml_sp.valid_until_time IS '인증유지시간';
COMMENT ON COLUMN bds_saml_sp.acs IS 'ACS';
COMMENT ON COLUMN bds_saml_sp.acs_binding IS 'ACS BINDING';
COMMENT ON COLUMN bds_saml_sp.name_id_format IS 'NAME ID 형식';
COMMENT ON COLUMN bds_saml_sp.name_id IS 'NAME ID';
COMMENT ON COLUMN bds_saml_sp.relay_state IS 'RELAY STATE';
COMMENT ON COLUMN bds_saml_sp.logout_binding IS '로그아웃 BINDING';
COMMENT ON COLUMN bds_saml_sp.logout_url IS '로그아웃 URL';
COMMENT ON COLUMN bds_saml_sp.logout_res_url IS '로그아웃 응답 URL';
COMMENT ON COLUMN bds_saml_sp.org_lang IS '조직 사용언어';
COMMENT ON COLUMN bds_saml_sp.org_name IS '조직 이름';
COMMENT ON COLUMN bds_saml_sp.org_display_name IS '조직 별칭';
COMMENT ON COLUMN bds_saml_sp.org_url IS '조직 URL';
COMMENT ON COLUMN bds_saml_sp.cont_sur_name IS '연락자 성';
COMMENT ON COLUMN bds_saml_sp.cont_given_name IS '연락자 이름';
COMMENT ON COLUMN bds_saml_sp.cont_email IS '연락자 이메일';
COMMENT ON COLUMN bds_saml_sp.sign_cert IS '서명 인증서';
COMMENT ON COLUMN bds_saml_sp.sign_yn IS '서명 인증서 사용여부';
COMMENT ON COLUMN bds_saml_sp.enc_cert IS '암호 인증서';
COMMENT ON COLUMN bds_saml_sp.encrypt_yn IS '암호여부';
COMMENT ON COLUMN bds_saml_sp.input_xml_yn IS 'XML 파일여부';
COMMENT ON COLUMN bds_saml_sp.metadata_url IS '메타데이터 URL';
COMMENT ON COLUMN bds_saml_sp.metadata_xml IS '메타데이터 XML';
COMMENT ON COLUMN bds_saml_sp.deleted IS '삭제여부';

--
CREATE TABLE bds_saml_token_pub 
(
	oid VARCHAR2(100) NOT NULL,
	insert_time NUMBER(19) DEFAULT 0,
	insert_user VARCHAR2(100),
	update_time NUMBER(19) DEFAULT 0,
	update_user VARCHAR2(100) ,
	use_yn VARCHAR2(1) ,
	sid VARCHAR2(100) NOT NULL,
	entity_id VARCHAR2(250) NOT NULL,
	name_id_format VARCHAR2(250),
	name_id VARCHAR2(250),
	request_id VARCHAR2(2000),
	logout_start_yn VARCHAR2(1) DEFAULT 'N',
	logout_exist_yn VARCHAR2(1) DEFAULT 'N',
	logout_call_yn VARCHAR2(1) DEFAULT 'N',
	logout_yn VARCHAR2(1) DEFAULT 'N',
	logout_call_time NUMBER(19) DEFAULT 0,
	custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
);

ALTER TABLE bds_saml_token_pub ADD (CONSTRAINT pk_bds_saml_token_pub PRIMARY KEY (oid));

COMMENT ON TABLE bds_saml_token_pub IS 'SAML 토큰 발행정보';

COMMENT ON COLUMN bds_saml_token_pub.oid IS '객체 ID';
COMMENT ON COLUMN bds_saml_token_pub.insert_time IS '생성일';
COMMENT ON COLUMN bds_saml_token_pub.insert_user IS '생성자';
COMMENT ON COLUMN bds_saml_token_pub.update_time IS '수정일';
COMMENT ON COLUMN bds_saml_token_pub.update_user IS '수정자';
COMMENT ON COLUMN bds_saml_token_pub.use_yn IS '사용여부';
COMMENT ON COLUMN bds_saml_token_pub.sid IS 'SID';
COMMENT ON COLUMN bds_saml_token_pub.entity_id IS '엔티티 ID';
COMMENT ON COLUMN bds_saml_token_pub.name_id_format IS 'NAME ID 형식';
COMMENT ON COLUMN bds_saml_token_pub.name_id IS 'NAME ID';
COMMENT ON COLUMN bds_saml_token_pub.request_id IS '요청 ID';
COMMENT ON COLUMN bds_saml_token_pub.logout_start_yn IS '로그아웃 시작여부';
COMMENT ON COLUMN bds_saml_token_pub.logout_exist_yn IS '로그아웃 전재여부';
COMMENT ON COLUMN bds_saml_token_pub.logout_call_yn IS '로그아웃 요청여부';
COMMENT ON COLUMN bds_saml_token_pub.logout_yn IS '로그아웃 여부';
COMMENT ON COLUMN bds_saml_token_pub.logout_call_time IS '로그아웃 요청시간';
COMMENT ON COLUMN bds_saml_token_pub.custom_info IS '커스텀슬롯';
-- END CREATE TABLE --------------------------

-- saml token pub
CREATE INDEX idx_saml_token_pub_insert_time ON bds_saml_token_pub (insert_time);
-- END CREATE INDEX --------------------------

-- saml example
INSERT INTO bds_cm_client (oid, client_id, comp_oid, start_time, end_time, api_valid_time, insert_time, insert_user, update_time, update_user, two_factor, use_yn, deleted, name, app, secret, grant_types) VALUES
('samlNCyTBJDkT1IIPFmM1B', 'worksmobile.com', 'default', 0, 0, 0, 1566277486595, 'admin', 1566277486595, 'admin', 'N', 'Y', 'N', '네이버 Saml entityId', 'SSO', '0Uz-UJX0kUOdGqBECq9WgFcUbIh-RKTgDkIHO0vI-58deIE35X8y_yYD4WCj6INCGL_tdJc8mhRPUr1Gx6k_JGCC8g49glg1qqRvVrtwDXM', 'sso_sid');
INSERT INTO bds_cm_client (oid, client_id, comp_oid, start_time, end_time, api_valid_time, insert_time, insert_user, update_time, update_user, two_factor, use_yn, deleted, name, app, secret, grant_types) VALUES
('sp1NCyTBJDkT1IIPFmM1B', 'http://sp1.bandisnc.com/saml/metadata', 'default', 0, 0, 0, 1566277486595, 'admin', 1566277486595, 'admin', 'N', 'Y', 'N', 'test saml sp1', 'SSO', '0Uz-UJX0kUOdGqBECq9WgFcUbIh-RKTgDkIHO0vI-58deIE35X8y_yYD4WCj6INCGL_tdJc8mhRPUr1Gx6k_JGCC8g49glg1qqRvVrtwDXM', 'sso_sid');
INSERT INTO bds_cm_client (oid, client_id, comp_oid, start_time, end_time, api_valid_time, insert_time, insert_user, update_time, update_user, two_factor, use_yn, deleted, name, app, secret, grant_types) VALUES
('sp2NCyTBJDkT1IIPFmM1B', 'http://sp2.bandisnc.com/saml/metadata', 'default', 0, 0, 0, 1566277486595, 'admin', 1566277486595, 'admin', 'N', 'Y', 'N', 'test saml sp1', 'SSO', '0Uz-UJX0kUOdGqBECq9WgFcUbIh-RKTgDkIHO0vI-58deIE35X8y_yYD4WCj6INCGL_tdJc8mhRPUr1Gx6k_JGCC8g49glg1qqRvVrtwDXM', 'sso_sid');

INSERT INTO bds_saml_sp (oid, entity_id, site, sign_yn, valid_until_time, insert_time, insert_user, update_time, update_user, use_yn, deleted, org_lang, org_name, org_display_Name, org_url, name_id_format, name_id, logout_url, logout_binding, input_xml_yn, encrypt_yn, sign_cert,enc_cert) VALUES
('sp1NCyTBJDkT1IIPFmM1B', 'http://sp1.bandisnc.com/saml/metadata', 'noraml', 'Y', 0, 1566277486595, 'admin', 1566277486595, 'admin', 'Y', 'N', 'en', 'test saml sp1', 'naver', 'http://sp1.bandisnc.com', 'UNSPECIFIED', 'email', 'http://sp1.bandisnc.com:9555/saml/SingleLogout','HTTP_REDIRECT', 'N','N','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');
INSERT INTO bds_saml_sp (oid, entity_id, site, sign_yn, valid_until_time, insert_time, insert_user, update_time, update_user, use_yn, deleted, org_lang, org_name, org_display_Name, org_url, name_id_format, name_id, logout_url, logout_binding, input_xml_yn, encrypt_yn, sign_cert,enc_cert) VALUES
('sp2NCyTBJDkT1IIPFmM1B', 'http://sp2.bandisnc.com/saml/metadata', 'noraml', 'Y', 0, 1566277486595, 'admin', 1566277486595, 'admin', 'Y', 'N', 'en', 'second saml sp1', 'naver', 'http://sp2.bandisnc.com', 'UNSPECIFIED', 'email', 'http://sp2.bandisnc.com:9556/saml/SingleLogout','HTTP_REDIRECT', 'N','N','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');

commit;


-- OAUTH
-------------------------- START CREATE TABLE --------------------------
CREATE TABLE bds_oauth_token_info
(
    oid             VARCHAR2(100)   NOT NULL,
    insert_time     NUMBER(19),
    insert_user     VARCHAR2(100),
    update_time     NUMBER(19),
    update_user     VARCHAR2(100),
    use_yn          VARCHAR2(1),
    auth_code       VARCHAR2(255) ,
    client_ip       VARCHAR2(50) NOT NULL,
    client_oid      VARCHAR2(100) NOT NULL,
    expired         VARCHAR2(1),
    expired_time    NUMBER(19),
    sso_token_id    VARCHAR2(100),
    user_oid        VARCHAR2(100),
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
);

ALTER TABLE  bds_oauth_token_info
    ADD (
        CONSTRAINT PK_bds_oauth_token_info PRIMARY KEY (oid)
        );

COMMENT ON TABLE bds_oauth_token_info IS 'OAUTH 토큰정보' ;

COMMENT ON COLUMN bds_oauth_token_info.oid IS '객체 OID';
COMMENT ON COLUMN bds_oauth_token_info.insert_time IS '생성일';
COMMENT ON COLUMN bds_oauth_token_info.insert_user IS '생성자';
COMMENT ON COLUMN bds_oauth_token_info.update_time IS '수정일';
COMMENT ON COLUMN bds_oauth_token_info.update_user IS '수정자';
COMMENT ON COLUMN bds_oauth_token_info.use_yn IS '사용여부';
COMMENT ON COLUMN bds_oauth_token_info.auth_code IS '인증코드';
COMMENT ON COLUMN bds_oauth_token_info.client_ip IS '클라이언트 IP';
COMMENT ON COLUMN bds_oauth_token_info.client_oid IS '클라이언트 OID';
COMMENT ON COLUMN bds_oauth_token_info.expired IS '만료 여부';
COMMENT ON COLUMN bds_oauth_token_info.expired_time IS '만료시간';
COMMENT ON COLUMN bds_oauth_token_info.sso_token_id IS 'SSO 토큰 ID';
COMMENT ON COLUMN bds_oauth_token_info.user_oid IS '사용자 OID';

CREATE TABLE bds_oauth_scope
(
    id              VARCHAR2(100)  NOT NULL,
    insert_time     NUMBER(19),
    insert_user     VARCHAR2(100),
    update_time     NUMBER(19),
    update_user     VARCHAR2(100),
    use_yn          VARCHAR2(1),
    group_oid       VARCHAR2(100),
    alias           VARCHAR2(200) NULL,
    name            VARCHAR2(200 CHAR) NOT NULL
);

ALTER TABLE  bds_oauth_scope
    ADD (
        CONSTRAINT PK_bds_oauth_scope PRIMARY KEY (id)
        );

COMMENT ON TABLE bds_oauth_scope IS 'OAUTH 범위';

COMMENT ON COLUMN bds_oauth_scope.id IS 'SCOPE ID';
COMMENT ON COLUMN bds_oauth_scope.insert_time IS '생성일';
COMMENT ON COLUMN bds_oauth_scope.insert_user IS '생성자';
COMMENT ON COLUMN bds_oauth_scope.update_time IS '수정일';
COMMENT ON COLUMN bds_oauth_scope.update_user IS '수정자';
COMMENT ON COLUMN bds_oauth_scope.use_yn IS '사용여부';
COMMENT ON COLUMN bds_oauth_scope.group_oid IS '그룹 OID';
COMMENT ON COLUMN bds_oauth_scope.alias IS '별칭';
COMMENT ON COLUMN bds_oauth_scope.name IS 'SCOPE 명';


CREATE TABLE bds_oauth_client_scope
(
    client_oid      VARCHAR(100) NOT NULL,
    scope_id        VARCHAR(100) NOT NULL,
    insert_time     NUMBER(19),
    insert_user     VARCHAR2(100),
    update_time     NUMBER(19),
    update_user     VARCHAR2(100),
    use_yn          VARCHAR2(1),
    custom_info VARCHAR2(2000),
    first_str VARCHAR2(250),
    second_str VARCHAR2(250)
);


ALTER TABLE  bds_oauth_client_scope
    ADD (
        CONSTRAINT PK_bds_oauth_client_scope PRIMARY KEY (client_oid, scope_id)
        );

COMMENT ON TABLE bds_oauth_client_scope IS '클라이언트 OAUTH 범위';

COMMENT ON COLUMN bds_oauth_client_scope.client_oid IS '클라이언트 OID';
COMMENT ON COLUMN bds_oauth_client_scope.scope_id IS 'SCOPE ID';
COMMENT ON COLUMN bds_oauth_client_scope.insert_time IS '생성일';
COMMENT ON COLUMN bds_oauth_client_scope.insert_user IS '생성자';
COMMENT ON COLUMN bds_oauth_client_scope.update_time IS '수정일';
COMMENT ON COLUMN bds_oauth_client_scope.update_user IS '수정자';
COMMENT ON COLUMN bds_oauth_client_scope.use_yn IS '사용여부';

-- 변경사항 ( 제약조건 명 길이 문제로 인해 변경 )
ALTER TABLE bds_oauth_token_info ADD CONSTRAINT FK_oauth_tk_if_ct_oid_ct_oid FOREIGN KEY (client_oid) REFERENCES bds_cm_client (oid);
-- 변경사항 ( 제약조건 명 길이 문제로 인해 변경 )
ALTER TABLE bds_oauth_token_info ADD CONSTRAINT FK_oauth_tk_if_usr_oid_usr_oid FOREIGN KEY (user_oid) REFERENCES bds_cm_user (oid);

CREATE INDEX IDX_OAUTH_TOKEN_INSERT_TIME ON BDS_OAUTH_TOKEN_INFO(INSERT_TIME);

INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('oauth.access.token.expires.in', '24', 'Y', 'access token 유효 시간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('oauth.refresh.token.expires.in', '30', 'Y', 'refresh token 유효 시간(일)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('oauth.token.info.remove.period', '12', 'Y', 'OAUTH Token Info 유지 기간(월)', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
INSERT INTO bds_cm_config (oid, conf_value, use_yn, title, insert_time, insert_user, update_time, update_user) VALUES
('cache.use.oauth.client.scope', 'false', 'Y', 'client scope cache 사용 여부', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');

INSERT INTO bds_cm_schedule (oid, expression, use_yn, title, success_yn, execute_time, insert_time, insert_user, update_time, update_user) VALUES
('oauthTokenInfoRemoveScheduleTask', '0 0 4 * * *', 'Y', 'OAUTH token info 스케쥴러 설정', 'Y', 1576573317531, 1576573317531, 'BKO7M7XqOtqoszsfS19VDH', 1576573317531, 'BKO7M7XqOtqoszsfS19VDH');
 
commit;