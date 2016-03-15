DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;


CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
spend_limit DECIMAL(8,2)
);

CREATE TABLE transactions(
id SERIAL4 PRIMARY KEY,
select_date DATE,
merchant_id int4 references merchants(id),
tag_id int4 references tags(id),
amount DECIMAL(8,2),
tag_spend_limit DECIMAL(8,2)
);
