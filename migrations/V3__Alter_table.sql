-- Таблица авторов книг
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    UNIQUE (author_name) -- Уникальное имя автора
);

-- Таблица книг
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    year_of_release INT,
    genre VARCHAR(100),
    author_id INT,
    description TEXT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Таблица издательств
CREATE TABLE Publishers (
    publisher_id SERIAL PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    year_of_foundation INT,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),
    UNIQUE (email) -- Уникальный email издательства
);

-- Таблица клиентов
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255) NOT NULL,
    UNIQUE (email) -- Уникальный email клиента
);

-- Таблица заказов
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Таблица "Детали заказа"
CREATE TABLE OrderDetails (
    details_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    amount INT,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Таблица "Рейтинги книг"
CREATE TABLE BookRatings (
    rating_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    rating INT,
    comment TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Таблица "Акции и скидки"
CREATE TABLE Promotions (
    promotion_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    discount DECIMAL(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
