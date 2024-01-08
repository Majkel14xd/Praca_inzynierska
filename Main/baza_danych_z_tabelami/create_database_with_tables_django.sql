CREATE TABLE auth_group (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(150) NOT NULL
);

CREATE TABLE auth_group_permissions (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    group_id int(11) NOT NULL,
    permission_id int(11) NOT NULL
);

CREATE TABLE auth_permission (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    content_type_id int(11) NOT NULL,
    codename varchar(100) NOT NULL
);

CREATE TABLE auth_user (
    id int(11) NOT NULL AUTO_INCREMENT,
    password varchar(128) NOT NULL,
    last_login datetime(6) DEFAULT NULL,
    is_superuser tinyint(1) NOT NULL,
    username varchar(150) NOT NULL,
    first_name varchar(150) NOT NULL,
    last_name varchar(150) NOT NULL,
    email varchar(254) NOT NULL,
    is_staff tinyint(1) NOT NULL,
    is_active tinyint(1) NOT NULL,
    date_joined datetime(6) NOT NULL
);

CREATE TABLE auth_user_groups (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    group_id int(11) NOT NULL
);

CREATE TABLE auth_user_user_permissions (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    permission_id int(11) NOT NULL
);

CREATE TABLE device_info (
    ID int(11) NOT NULL AUTO_INCREMENT,
    Device_mac_address varchar(17) NOT NULL,
    Network_ssid varchar(30) NOT NULL,
    Network_ip varchar(30) NOT NULL,
    Database_name varchar(50) NOT NULL,
    Database_ip varchar(30) NOT NULL,
    Database_port int(10) NOT NULL,
    Database_user_name varchar(50) NOT NULL,
    Data_aktualizacji date NOT NULL,
    Czas_aktualizacji time NOT NULL
);

CREATE TABLE django_admin_log (
    id int(11) NOT NULL AUTO_INCREMENT,
    action_time datetime(6) NOT NULL,
    object_id longtext DEFAULT NULL,
    object_repr varchar(200) NOT NULL,
    action_flag smallint(5) unsigned NOT NULL,
    change_message longtext NOT NULL,
    content_type_id int(11) DEFAULT NULL,
    user_id int(11) NOT NULL
);

CREATE TABLE django_content_type (
    id int(11) NOT NULL AUTO_INCREMENT,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL
);

CREATE TABLE django_migrations (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    app varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    applied datetime(6) NOT NULL
);

CREATE TABLE django_session (
    session_key varchar(40) NOT NULL,
    session_data longtext NOT NULL,
    expire_date datetime(6) NOT NULL
);

CREATE TABLE logs (
    ID int(11) NOT NULL AUTO_INCREMENT,
    Data_zdarzenia date NOT NULL,
    Godzina_zdarzenia time NOT NULL,
    Opis_zdarzenia varchar(255) NOT NULL
);

CREATE TABLE rain_gauge (
    ID int(11) NOT NULL AUTO_INCREMENT,
    Data_odczytu date NOT NULL,
    Godzina_odczytu time NOT NULL,
    Wartosc int(11) NOT NULL
);

CREATE TABLE rain_sensor (
    ID int(11) NOT NULL AUTO_INCREMENT,
    Data_odczytu date NOT NULL,
    Godzina_odczytu time NOT NULL,
    Wartosc int(11) NOT NULL,
    Wartosc_tekstowa varchar(255) NOT NULL
);

CREATE TABLE water_sensor (
    ID int(11) NOT NULL AUTO_INCREMENT,
    Data_odczytu date NOT NULL,
    Godzina_odczytu time NOT NULL,
    Wartosc int(11) NOT NULL,
    Wartosc_tekstowa varchar(255) NOT NULL,
    Alert varchar(255) NOT NULL
);
