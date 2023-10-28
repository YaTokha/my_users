CREATE TABLE Users
(
    UserID      INT PRIMARY KEY,
    LastName    VARCHAR(255) NOT NULL,
    FirstName   VARCHAR(255) NOT NULL,
    MiddleName  VARCHAR(255),
    DateOfBirth DATE         NOT NULL,
    Profession  VARCHAR(255),
    Nationality VARCHAR(255),
    PhoneNumber VARCHAR(20) UNIQUE,
    Email       VARCHAR(255) UNIQUE
);
