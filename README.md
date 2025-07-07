# Jam-factory
JAM FACTORY – APPLICAZIONE WEB (MAVEN)
===================================================================

Stack Tecnologico
-----------------
- Front‑end: HTML5, CSS3, JavaScript (vanilla).
- Back‑end: Jakarta Servlet 6.0 & JSP.
- Container: Apache Tomcat 11.
- Build: Maven — genera artefatto war con maven‑compiler‑plugin e maven‑war‑plugin.
- Database: MySQL 9 via JDBC.
- IDE: Eclipse IDE 2024‑06.
- JDK: OpenJDK 24.


Prerequisiti
------------
- JDK 24 o superiore
- Apache Maven 3.9+
- Apache Tomcat 11 (estratto localmente)
- MySQL 9 con 
- Accesso a Internet per scaricare le dipendenze Maven.

Setup passo‑passo
-----------------
1. Clona il repository
   git clone https://github.com/AntonioMadonna3/Jam-factory.git
2. Configura il database
   - Importa la struttura e i dati demo da tabelle.sql e jam_factory_populate.sql;
3. Import in Eclipse (facoltativo)
   - File ▸ Import ▸ Existing Maven Projects.
   - Seleziona la cartella del progetto e concludi.
   - Aggiungi un server Tomcat 11 in Servers e trascina sopra il progetto.
4. Build con Maven
   mvn clean package

Avvio
-----
Apri l’indirizzo http://localhost:8080/Jam_factory

- Admin: usa le credenziali definite nel file sql.
- Dipendente/Cliente: registrati dal pulsante Registrati.

