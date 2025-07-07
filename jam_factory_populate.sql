-- Popola il database jam_factory con dati di esempio
USE jam_factory;

-- 1. Amministratori
INSERT INTO admins (id, email, password, nome, cognome) VALUES
  (1,'admin.giulia@jamfactory.it','jam123','Giulia','Rossi'),
  (2,'admin.matteo@jamfactory.it','jelly456','Matteo','Bianchi'),
  (3,'admin.elena@jamfactory.it','marm789','Elena','Verdi');

-- 2. Clienti
INSERT INTO customers (id, ragione_sociale, p_iva, email, password) VALUES
  (1,'Dolci Srl','01234567890','ordini@dolcisrl.it','cust001'),
  (2,'Sapori Spa','09876543210','info@sapori.it','cust002'),
  (3,'Alimentari Rossi','11122233344','acquisti@rossi.it','cust003'),
  (4,'Gourmet SRL','55566677788','contatti@gourmetsrl.it','cust004'),
  (5,'Pasticceria La Dolcezza','11223344556','ordini@dolcezza.it','cust005'),
  (6,'Ristorante Il Sole','22334455667','acquisti@ilsole.it','cust006'),
  (7,'Market Fresh','33445566778','buyer@marketfresh.it','cust007'),
  (8,'Panificio Bontà','44556677889','ordini@bonta.it','cust008'),
  (9,'BioShop','55667788990','orders@bioshop.it','cust009'),
  (10,'Caffè Centrale','66778899001','acquisti@caffecentrale.it','cust010');

-- 3. Dipendenti (taste‑hunter)
INSERT INTO employees (id, nome, cognome, email, password) VALUES
  (1,'Luca','Ferrari','l.ferrari@jamfactory.it','emp001'),
  (2,'Sara','Gallo','s.gallo@jamfactory.it','emp002'),
  (3,'Marco','Conti','m.conti@jamfactory.it','emp003'),
  (4,'Paola','Marini','p.marini@jamfactory.it','emp004'),
  (5,'Gianni','Bruni','g.bruni@jamfactory.it','emp005');

-- 4. Fornitori
INSERT INTO suppliers (id, ragione_sociale, p_iva, materia_prima) VALUES
  (1,'Frutta Alta Valsugana','90123456780','Fragole'),
  (2,'Agrumi di Sicilia','90234567891','Arance'),
  (3,'Mele Trentine','90345678902','Mele'),
  (4,'Azienda Agricola Ligure','90456789013','Basilico'),
  (5,'Zucchero & Co','90567890124','Zucchero');

-- 5. Prodotti
  INSERT INTO products (id, nome, descrizione, prezzo_unit) VALUES
  (1,'Confettura di Fragole','Fragole 70%, zucchero, limone',4.50),
  (2,'Marmellata di Arance','Arance bionde 65%, zucchero',4.80),
  (3,'Composta di Mele e Cannella','Mele 80%, zucchero, cannella',4.30),
  (4,'Gelatina al Basilico','Basilico fresco, zucchero, pectina',5.20),
  (5,'Confettura Extra Frutti di Bosco','Mix frutti di bosco 75%, zucchero',5.00),
  (6,'Confettura di Pesche','Pesche 70%, zucchero',4.40),
  (7,'Marmellata di Limoni','Limoni 60%, zucchero',4.90),
  (8,'Confettura di Albicocche','Albicocche 70%, zucchero',4.60),
  (9,'Composta di Pere e Zenzero','Pere 78%, zucchero, zenzero',5.30),
  (10,'Crema di Castagne','Castagne 75%, zucchero, vaniglia',6.00),
  (11,'Confettura di Ciliegie','Ciliegie 72%, zucchero',4.70),
  (12,'Composta di Fichi e Noci','Fichi 75%, zucchero, noci',5.80),
  (13,'Gelatina di Melograno','Succo di melograno, zucchero',5.40),
  (14,'Crema di Pistacchio','Pistacchi 60%, zucchero',6.50),
  (15,'Confettura di Rabarbaro','Rabarbaro 68%, zucchero',5.10);

-- 6. Stock
INSERT INTO stock (product_id, qty_pezzi) VALUES
  (1,500),(2,450),(3,400),(4,300),(5,350),
  (6,420),(7,380),(8,410),(9,290),(10,260),
  (11,320),(12,280),(13,260),(14,240),(15,300);

-- 7. Taste list (nuovi prodotti selezionati)
INSERT INTO taste_list (product_id) VALUES
  (11),(12),(13),(14),(15);

-- 8. Ordini materie prime
INSERT INTO raw_material_orders (id, supplier_id, qty_kg, ordered_at) VALUES
  (1,1,120.00,'2025-06-01 08:15:00'),
  (2,2,200.50,'2025-06-02 09:30:00'),
  (3,3,150.75,'2025-06-03 10:20:00'),
  (4,4,50.00,'2025-06-04 11:25:00'),
  (5,5,300.00,'2025-06-05 14:45:00'),
  (6,1,110.00,'2025-07-01 07:50:00'),
  (7,2,180.00,'2025-07-02 09:10:00');

-- 9. Ordini clienti
INSERT INTO customer_orders (id, customer_id, total_eur, ordered_at) VALUES
  (1,1,231.40,'2025-06-05 09:12:00'),
  (2,2,132.60,'2025-06-06 11:23:00'),
  (3,3,121.50,'2025-06-07 14:07:00'),
  (4,4,199.20,'2025-06-08 10:45:00'),
  (5,5,175.60,'2025-06-09 15:18:00'),
  (6,6,147.00,'2025-06-10 13:55:00'),
  (7,7,110.00,'2025-06-11 10:14:00'),
  (8,8,89.30,'2025-06-12 16:27:00'),
  (9,9,245.40,'2025-06-13 12:09:00'),
  (10,10,138.40,'2025-06-14 09:48:00'),
  (11,1,260.10,'2025-06-15 11:52:00'),
  (12,2,180.00,'2025-06-16 14:36:00'),
  (13,3,128.20,'2025-06-17 10:31:00'),
  (14,4,155.20,'2025-06-18 13:43:00'),
  (15,5,206.50,'2025-06-19 15:22:00'),
  (16,6,97.70,'2025-06-20 09:11:00'),
  (17,7,182.60,'2025-06-21 16:40:00'),
  (18,8,140.30,'2025-06-22 10:19:00'),
  (19,9,175.90,'2025-06-23 11:57:00'),
  (20,10,161.30,'2025-06-24 14:05:00'),
  (21,1,217.60,'2025-06-25 09:37:00'),
  (22,2,133.40,'2025-06-26 12:46:00'),
  (23,3,199.80,'2025-06-27 15:12:00'),
  (24,4,126.90,'2025-06-28 10:55:00'),
  (25,5,187.50,'2025-06-29 13:42:00'),
  (26,6,119.20,'2025-06-30 16:20:00'),
  (27,7,142.80,'2025-07-01 10:29:00'),
  (28,8,205.00,'2025-07-02 11:18:00'),
  (29,9,156.40,'2025-07-03 14:07:00'),
  (30,10,178.90,'2025-07-04 12:52:00');

-- 10. Dettagli ordini
INSERT INTO order_items (order_id, product_id, qty, price_eur) VALUES
  (1,6,20,4.40),(1,9,18,5.30),(1,2,10,4.80),
  (2,4,11,5.20),(2,8,7,4.60),(2,2,9,4.80),
  (3,10,8,6.00),(3,1,15,4.50),(3,5,6,5.00),
  (4,3,12,4.30),(4,7,10,4.90),(4
-- 11. Feedback dipendenti (nuovi prodotti 11‑15)
INSERT INTO feedback (employee_id, product_id, rating, note, given_at) VALUES
  (1,11,5,'Dolce e intenso','2025-06-26 10:05:00'),
  (2,11,4,'Leggera acidità','2025-06-26 15:40:00'),
  (3,11,5,'Ottimo colore','2025-06-27 11:10:00'),
  (4,11,3,'Un po’ troppo dolce','2025-06-27 14:25:00'),
  (1,12,5,'Ricco di sapore','2025-06-28 09:55:00'),
  (2,12,4,'Buon mix fichi‑noci','2025-06-28 16:50:00'),
  (3,12,5,'Testura perfetta','2025-06-29 10:35:00'),
  (4,12,4,'Potrebbe essere meno dolce','2025-06-29 17:15:00'),
  (5,13,5,'Aroma fresco','2025-06-30 11:25:00'),
  (1,13,4,'Colore brillante','2025-06-30 15:45:00'),
  (2,13,3,'Un po’ liquida','2025-07-01 09:20:00'),
  (3,13,5,'Equilibrata','2025-07-01 14:30:00'),
  (4,14,5,'Cremosa e intensa','2025-07-02 10:10:00'),
  (5,14,4,'Pistacchio autentico','2025-07-02 16:05:00'),
  (1,14,5,'Ottima spalmabilità','2025-07-03 11:40:00'),
  (2,15,4,'Rabarbaro originale','2025-07-03 14:50:00'),
  (3,15,3,'Troppo aspro','2025-07-03 17:15:00'),
  (4,15,4,'Buon bilanciamento','2025-07-04 09:05:00'),
  (5,15,5,'Fresco e estivo','2025-07-04 12:30:00'),
  (1,15,4,'Consistenza piacevole','2025-07-04 16:40:00');

