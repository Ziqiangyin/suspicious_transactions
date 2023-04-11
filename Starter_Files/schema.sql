
CREATE TABLE card_holder (
    id int   NOT NULL,
    name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE credit_card (
    card  VARCHAR(20)   NOT NULL,
    cardholder_id int   NOT NULL,
    PRIMARY KEY (card),
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

CREATE TABLE merchant (
    id int   NOT NULL,
    name VARCHAR(30)   NOT NULL,
    id_merchant_category int   NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category (id)
);

CREATE TABLE merchant_category (
    id int   NOT NULL,
    name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE transaction (
    id int   NOT NULL,
    date timestamp   NOT NULL,
    amount float   NOT NULL,
    card VARCHAR(20)   NOT NULL,
    id_merchant int   NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (card) REFERENCES credit_card (card),
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);


