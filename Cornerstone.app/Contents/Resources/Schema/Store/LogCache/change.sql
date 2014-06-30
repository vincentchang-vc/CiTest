CREATE TABLE change 
(
	revision int not null,
	date datetime not null,
	action char (1) not null,
	path_id integer not null,
	copy_revision integer null,
	copy_path_id integer null
);

CREATE INDEX change_path_id_index on change (path_id);
CREATE INDEX change_revision_index on change (revision);
CREATE INDEX change_date_index on change (date);
