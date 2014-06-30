CREATE TABLE revision 
(
	number int primary key not null,
	author varchar(100) null,
	date datetime not null,
	message text null
);
