-- @block
CREATE TABLE users
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);

-- @block
INSERT INTO users (email, bio, country)
VALUES
(
    'realabiolafahad@gmail.com',
    'Student of knowledge',
    'Nigeria'
);

-- @block
INSERT INTO users (email, bio, country)
VALUES
    ('user1@mail.com', 'Problem solver', 'NG'),
    ('user2@mail.com', 'Solution provider', 'KS'),
    ('user3@gmail.com', 'Spreading goodness', 'QA');

-- @block
SELECT * FROM users;

-- @block
SELECT email, id FROM users;

-- @block
SELECT email, id FROM users
LIMIT 2;

-- @block
SELECT email, id FROM users
ORDER BY id ASC
LIMIT 2;

-- @block
SELECT email, id, country FROM users
ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id, country FROM users

WHERE country = 'NG'

ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id, country FROM users

WHERE country = 'NG'
AND id > 1

ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id, country FROM users

WHERE country = 'NG'
OR id > 1

ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id, country FROM users

WHERE country = 'NG'
AND email LIKE 'u%'

ORDER BY id DESC;

-- @block
SELECT email, id, country FROM users

WHERE country = 'NG'
AND email LIKE 'real%'

ORDER BY id DESC;

-- @block
-- this block isn't run yet
CREATE INDEX abu_email_index ON users(email);

-- @block
CREATE TABLE Rooms
(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
)

-- @block
INSERT INTO Rooms (owner_id, street)
VALUES
    (1, 'Anuoluwapo street'),
    (1, 'Irepodun street'),
    (1, 'Alafia street'),
    (1, 'Alhaji Bashy street');

-- @block
SELECT * FROM users
INNER JOIN rooms
ON rooms.owner_id = users.id;

-- @block
SELECT * FROM users
LEFT JOIN rooms
ON rooms.owner_id = users.id;

-- @block
-- RIGHT JOIN results is the same as INNER JOIN
SELECT * FROM users
RIGHT JOIN rooms
ON rooms.owner_id = users.id;

-- @block
-- RIGHT JOIN results is the same as INNER JOIN
SELECT
    users.id AS users_id,
    rooms.id AS room_id,
    email,
    street
FROM users
INNER JOIN rooms
ON rooms.owner_id = users.id;

-- @block
CREATE TABLE bookings
(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

-- @block Rooms a user has booked
SELECT
    guest_id,
    street,
    check_in
FROM bookings
INNER JOIN rooms ON rooms.owner_id = guest_id
WHERE guest_id = 1;

-- @block Guests who stayed in a room
SELECT
    room_id,
    guest_id,
    email,
    bio
FROM bookings
INNER JOIN users ON users.id = guest_id
WHERE room_id = 2;

-- @block
DROP TABLE users;
DROP DATABASE airbnb;
