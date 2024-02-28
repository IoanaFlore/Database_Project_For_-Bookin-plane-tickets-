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
       
   2. Database Queries
      
      i. DDL (Data Definition Language)
      
         The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)
      
      * create database rezervare_bilete_avion;
      * create table oras(
       id_oras int not null auto_increment primary key,
       nume_oras varchar(50),
       tară varchar(50)
);
      * create table aeroport(
	id_aeroport int not null auto_increment primary key,
    id_oras int not null,
    nume_aeroport_plecare varchar(80),
    adresa_aeroport_plecare varchar(100),
    foreign key (id_oras) references oras(id_oras)
);
      * create table companie(
     id_companie int not null auto_increment primary key,
     nume_companie varchar(30) not null,
     descriere_companie varchar(100)
);
      * create table zbor(
      id_zbor int not null auto_increment primary key,
      data_de_plecare date,
      date_de_sosire date,
      pret_zbor float,
      id_aeroport int not null,
      id_companie int not null	
);
      * create table clienti(
        id_client int not null auto_increment primary key,
        nume varchar(30) not null,
        prenume varchar(30) not null,
        adresa varchar(100),
        numar_telefon varchar(15) not null,
        email varchar(50) not null
);

      After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:
        
       * alter table zbor add foreign key(id_aeroport) references aeroport(id_aeroport);
       * alter table zbor add foreign key(id_companie) references companie(id_companie);
       * alter table bilet add foreign key(id_zbor) references zbor(id_zbor);
       * alter table bilet add foreign key(id_client) references clienti(id_client);
        
      


