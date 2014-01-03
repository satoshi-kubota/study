create table usertb (
id varchar(20) primary key,
email varchar(60),
display_name verchar(60),
hashedpassword varchar(120),
temp_token varchar(120),
created_when timestamp,
updated_when timestamp);
