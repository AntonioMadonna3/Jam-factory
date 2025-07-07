-- ============================================================
--  DATABASE  : jam_factory
--  VERSIONE  : 1.1  (01-lug-2025)
--  DESCRIZIONE: schema conforme alla traccia d’esame
-- ============================================================

/* ------------------------------------------------------------------
   0. Creazione (o ricreazione) del database
   ------------------------------------------------------------------ */
DROP DATABASE IF EXISTS jam_factory;
CREATE DATABASE jam_factory
  DEFAULT CHARSET = utf8mb4
  COLLATE       = utf8mb4_unicode_ci;
USE jam_factory;

/* ------------------------------------------------------------------
   1. UTENTI
   ------------------------------------------------------------------ */
-- --------- 1.1 Amministratori ---------
CREATE TABLE admins (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  email       VARCHAR(120) NOT NULL UNIQUE,
  password    VARCHAR(255) NOT NULL,      -- password in chiaro (richiesto dall’esercizio)
  nome        VARCHAR(40),
  cognome     VARCHAR(40),
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- --------- 1.2 Clienti ---------
CREATE TABLE customers (
  id              INT AUTO_INCREMENT PRIMARY KEY,
  ragione_sociale VARCHAR(80) NOT NULL,
  p_iva           CHAR(11)    NOT NULL UNIQUE,
  email           VARCHAR(120) NOT NULL UNIQUE,
  password        VARCHAR(255) NOT NULL,
  created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- --------- 1.3 Dipendenti (taste-hunter) ---------
CREATE TABLE employees (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  nome        VARCHAR(40) NOT NULL,
  cognome     VARCHAR(40) NOT NULL,
  email       VARCHAR(120) NOT NULL UNIQUE,
  password    VARCHAR(255) NOT NULL,
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* ------------------------------------------------------------------
   2. FORNITORI e ORDINI di materie prime
   ------------------------------------------------------------------ */
CREATE TABLE suppliers (
  id              INT AUTO_INCREMENT PRIMARY KEY,
  ragione_sociale VARCHAR(80) NOT NULL,
  p_iva           CHAR(11)    NOT NULL UNIQUE,
  materia_prima   VARCHAR(60) NOT NULL
);

CREATE TABLE raw_material_orders (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  supplier_id   INT NOT NULL,
  qty_kg        DECIMAL(8,2) NOT NULL,
  -- (facoltativo) prezzo_kg DECIMAL(6,2),
  ordered_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
    ON UPDATE CASCADE
);

/* ------------------------------------------------------------------
   3. PRODOTTI, STOCK e LISTA DEGUSTAZIONE
   ------------------------------------------------------------------ */
CREATE TABLE products (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  nome          VARCHAR(80) NOT NULL,
  descrizione   TEXT,
  prezzo_unit   DECIMAL(6,2) NOT NULL,
  UNIQUE (nome)                     -- evita duplicati di prodotto
);

CREATE TABLE stock (
  product_id INT PRIMARY KEY,
  qty_pezzi  INT NOT NULL DEFAULT 0,
  FOREIGN KEY (product_id) REFERENCES products(id)
    ON DELETE CASCADE                 -- se elimino un prodotto sparisce anche lo stock
    ON UPDATE CASCADE
);

-- prodotti scelti dall’admin per il programma taste-hunter
CREATE TABLE taste_list (
  product_id INT PRIMARY KEY,
  FOREIGN KEY (product_id) REFERENCES products(id)
    ON DELETE CASCADE
);

/* ------------------------------------------------------------------
   4. ORDINI CLIENTI
   ------------------------------------------------------------------ */
CREATE TABLE customer_orders (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  customer_id  INT NOT NULL,
  total_eur    DECIMAL(8,2) NOT NULL,
  ordered_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
    ON UPDATE CASCADE
);

CREATE TABLE order_items (
  order_id   INT,
  product_id INT,
  qty        INT NOT NULL,
  price_eur  DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id)  REFERENCES customer_orders(id)
    ON DELETE CASCADE      -- cancella items se l’ordine viene eliminato
    ON UPDATE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

/* ------------------------------------------------------------------
   5. FEEDBACK DIPENDENTI
   ------------------------------------------------------------------ */
CREATE TABLE feedback (
  employee_id INT,
  product_id  INT,
  rating      TINYINT CHECK (rating BETWEEN 1 AND 5),
  note        VARCHAR(400),
  given_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (employee_id, product_id),      -- un feedback per dipendente ↔︎ prodotto
  FOREIGN KEY (employee_id) REFERENCES employees(id)
    ON UPDATE CASCADE,
  FOREIGN KEY (product_id)  REFERENCES products(id)
    ON UPDATE CASCADE
);

/* ------------------------------------------------------------------
   6. INDICI AGGIUNTIVI (performance)
   ------------------------------------------------------------------ */
-- ricerche frequenti per e-mail
CREATE INDEX idx_adm_email ON admins(email);
CREATE INDEX idx_cust_email ON customers(email);
CREATE INDEX idx_emp_email  ON employees(email);

-- join e filtri su FK
CREATE INDEX idx_stock_fk   ON stock(product_id);
CREATE INDEX idx_rm_supplier ON raw_material_orders(supplier_id);
CREATE INDEX idx_order_customer ON customer_orders(customer_id);
