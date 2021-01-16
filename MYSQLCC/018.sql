USE SQLCC;

# 18.2.1
CREATE TABLE productnotes
(
	note_id		int 		NOT NULL AUTO_INCREMENT,
    prod_id 	char(10)	NOT NULL,
    note_date	datetime	NOT NULL,
    note_text 	text		NULL,
    PRIMARY KEY(note_id),
    FULLTEXT(note_text)
) ENGINE = MyISAM;

# 18.2.2.1
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('rabbit');

# 18.2.2.2
SELECT note_text
FROM productnotes
WHERE note_text LIKE '%rabbit%';

# 18.2.2.3
SELECT note_text, 
	Match(note_text) Against('rabbit') AS rank
FROM productnotes;

# 18.2.3.1
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('anvils');

# 18.2.3.2
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('anvils' WITH QUERY EXPANSION);

# 18.2.4.1
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('heavy' IN BOOLEAN MODE);

# 18.2.4.2
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('heavy -rope*' IN BOOLEAN MODE);

# 18.2.4.3
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('+rabbit +bait' IN BOOLEAN MODE);

# 18.2.4.4
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('rabbit bait' IN BOOLEAN MODE);

# 18.2.4.5
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('"rabbit bait"' IN BOOLEAN MODE);

# 18.2.4.6
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('>rabbit <carrot' IN BOOLEAN MODE);

# 18.2.4.7
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('+safe +(<combination)' IN BOOLEAN MODE);