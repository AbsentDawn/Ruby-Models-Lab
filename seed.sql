DROP TABLE IF EXISTS weapons;

CREATE TABLE weapons (

	id SERIAL PRIMARY KEY, 
	name VARCHAR(255), 
	attack INTEGER, 
	speed INTEGER,
	owner VARCHAR(255),
	game VARCHAR(255)
);

INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('Caladbolg', 198, 255, 'Tidus', 'Final Fantasy X');
INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('Buster Sword', 255, 64, 'Cloud', 'Final Fantasy VII');
INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('Sword of the Father', 157, 173, 'Noctis', 'Final Fantasy XV');
INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('Kingdom Key', 60, 80, 'Sora', 'Kingdom Hearts');
INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('Sabers Edge', 55, 110, 'Lightning', 'Final Fantasy XIII');
INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('Apocalypse', 219, 150, 'Terra', 'Final Fantasy VI');
INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('Genji Sword', 255, 255, 'Zack', 'Crisis Core: Final Fantasy VII');