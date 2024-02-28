## Database Project for **Booking plane tickets**
 The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: Booking plane tickets

Tools used: MySQL Workbench

Database description: Air transportation is a vital option for fast and efficient travel between different destinations. On the basis of a ticket, people can use air transport. The application aims to provide information to the user with reference to everything he needs for a plane flight, thus the user will avoid crowding and wasted time purchasing a ticket at the counter. The database will provide details about both the companies and the flights available for purchasing tickets, as well as information about the prices offered.

  1. Database Schema

     You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
      The tables are connected in the following way:

     * **oras** is connected with **aeroport** through a **one to many** relationship which was implemented through **aeroport.id_aeroport** as a primary key and 
      **oras.id_oras** as a foreign key
     * **aeroport** is connected with **zbor** through a **one to many** relationship which was implemented through **zbor.id_zbor** as a primary key and 
      **aeroport.id_aeroport** as a foreign key
     * **companie** is connected with **zbor** through a **one to many** relationship which was implemented through **zbor.id_zbor** as a primary key and 
      **companie.id_companie** as a foreign key
     * **zbor** is connected with **client** through a **one to many** relationship which was implemented through **bilet.id_bilet** as a primary key and 
      **zbor.id_zbor** as a foreign key
     * **clienti** is connected with **bilet** through a **one to many** relationship which was implemented through **bilet.id_bilet** as a primary key and 
      **clienti.id_client** as a foreign key


