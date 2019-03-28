DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS tours;

CREATE TABLE tours(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  max_capacity INT NOT NULL,
  duration INT,
  difficulty INT NOT NULL,
  start_date DATE,
  location VARCHAR(255),
  description TEXT,
  photo VARCHAR(255),
  tour_leader VARCHAR(255)
);

CREATE TABLE members(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  age INT NOT NULL,
  ability INT NOT NULL,
  avalanche_trained BOOLEAN
);

CREATE TABLE bookings(
  id SERIAL4 PRIMARY KEY,
  member_id INT4 REFERENCES members(id) ON DELETE CASCADE,
  tour_id INT4 REFERENCES tours(id) ON DELETE CASCADE
);
