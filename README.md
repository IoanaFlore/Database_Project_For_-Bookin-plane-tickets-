## Database Project for **Booking plane tickets**
 The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: Booking plane tickets

Tools used: MySQL Workbench

Database description: Air transportation is a vital option for fast and efficient travel between different destinations. On the basis of a ticket, people can use air transport. The application aims to provide information to the user with reference to everything he needs for a plane flight, thus the user will avoid crowding and wasted time purchasing a ticket at the counter. The database will provide details about both the companies and the flights available for purchasing tickets, as well as information about the prices offered.

  1. Database Schema

     You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
     ![1-data](https://github.com/IoanaFlore/Database_Project_For_-Bookin-plane-tickets-/assets/111995212/7ec99b1e-a983-4d8a-a8dd-91b325cbc9dd)

      The tables are connected in the following way:

     * **oras** is connected with **aeroport** through a **one to many** relationship which was implemented through **aeroport.id_aeroport** as a primary key and 
      **oras.id_oras** as a foreign key
     * **aeroport** is connected with **zbor** through a **one to many** relationship which was implemented through **zbor.id_zbor** as a primary key and 
      **aeroport.id_aeroport** as a foreign key
     * **companie** is connected with **zbor** through a **one to many** relationship which was implemented through **zbor.id_zbor** as a primary key and 
      **companie.id_companie** as a foreign key
     * **zbor** is connected with **bilet** through a **one to many** relationship which was implemented through **bilet.id_bilet** as a primary key and 
      **zbor.id_zbor** as a foreign key
     * **clienti** is connected with **bilet** through a **one to many** relationship which was implemented through **bilet.id_bilet** as a primary key and 
      **clienti.id_client** as a foreign key
       
   3. Database Queries
      
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
      * create table bilet(
      id_bilet int not null auto_increment primary key,
      denumire_bilet varchar(30),
      id_zbor int not null,
      id_client int not null     
);

      After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:
        
       * alter table zbor add foreign key(id_aeroport) references aeroport(id_aeroport);
       * alter table zbor add foreign key(id_companie) references companie(id_companie);
       * alter table bilet add foreign key(id_zbor) references zbor(id_zbor);
       * alter table bilet add foreign key(id_client) references clienti(id_client);
         
      ii. DML (Data Manipulation Language)
       In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in 
the Test Design phase and created in the Test Implementation phase.

       Below you can find all the insert instructions that were created in the scope of this project:
       * insert into oras (nume_oras, tară)
values 
   ("Constanta", "Romania"),
   ("Tulcea", "Romania"),
   ("Cluj-Napoca", "Romania"),
   ("Oradea", "Romania"),
   ("Barsov", "Romania");
       * insert into aeroport (id_oras, nume_aeroport_plecare, adresa_aeroport_plecare)
values
    (1, "Aeroport Mihail Kogalniceanu", "Str. Aeroportului nr.9"),
    (2, "Aeroport Tulcea", "Str. Aeroportului nr.2"),
    (3, "Aeroport Avram Iancu", "Str. Traian Vuia nr.3"),
    (4, "Aeroport Oradea ","Str. Calea Aradului nr.9"),
    (5, "Aeroport Barsov", "Str. Aeroportului nr.10");
      * insert into companie (nume_companie, descriere_companie)
values 
	("Blue Air","Aceasta companie are sediu in Bucuresti."),
	("Ryanair","Aceasta companie eset fondata in 1994."),
	("HiSky","Aceasta companie are sediu in Chisinau."),
	("EL AL","Aceasta companie este fonadat in 1948."),
	("Wizz Air","Este o companie foarte buna.");
       * insert into zbor(data_de_plecare, date_de_sosire, pret_zbor, id_aeroport, id_companie)
values
    ("2024-04-04", "2023-04-04", 345.33, 2, 4),
    ("2024-05-02", "2023-05-02", 453.84, 1, 3),
    ("2024-07-12", "2023-07-12", 234.99, 3, 1),
    ("2024-04-14", "2023-04-14", 322.87, 4, 5),
    ("2024-05-15", "2023-05-15", 157.86, 5, 2);
        * insert into clienti (nume, prenume, adresa, numar_telefon, email)
values 
     ("Marincas","Ioana","Str. Roamana","0756578345","marincasioana@gmail.com"),
     ("Mare","Ion","Str. Teiului","0753558325","mareion@gmail.com"),
     ("Puie","Elena","Str. Margaretei","0754578241","puieelena@gmail.com"),
     ("Rotar","Izabela","Str. Florilor","0756345679","rotarizabela@gmail.com"),
     ("Crecan","Maria","Str. Marin Preda","0756789432","crecanmaria@gmail.com");
        * insert into bilet(denumire_bilet, id_zbor, id_client)
values 
     ("AS458GMJDJJKF", 2, 4),
     ("FS57838GFNJHJ", 1, 5),
     ("AS23GFJGBJD34", 3, 2),
     ("CVJKFJJ36474B", 4, 1),
     ("AWHRFUE4693JF", 5, 3);

         After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:
       * update oras set nume_oras="Brasov" where id_oras=5;
       * update oras set nume_oras="Brasov" where id_oras=5;
       * update companie set descriere_companie = "Aceasta companie are un mare renume" 
where nume_companie="Ryanair";
       * update zbor set pret_zbor = 123.66 where id_zbor=1;
       * update clienti set prenume = "Ionela" where nume="Mare";
       * update clienti set email = "mareionela@gmail.com" where nume="Mare";
       * update bilet set denumire_bilet = "AWHRF345393JF" where id_bilet=3;
       * update zbor set date_de_sosire = "2024-04-04" where id_zbor = 1;

      After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:
       * delete from bilet where id_bilet=5;
       * delete from clienti where id_client = 3;

	  iii. DQL (Data Query Language)
               In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:
         * Return all data from the city table:
           
           ```sql
           select * from oras;
           ```
         * Return all data from the airport table:
           ```sql
           select * from aeroport;
           ```
         * Return all data from the company table:
           ```sql
           select * from companie;
           ```
         * Return all data from the flight table:
           ```sql
            *select * from zbor;
           ```
         * Return all data from the customers table:
           ```sql
           select * from clienti;
           ```
         * Return all data from the ticket table:
           ```sql
           select * from bilet;
           ```
         * Return data about departure dates and flight prices from the flight table:
            ```sql
             select data_de_plecare, pret_zbor from zbor;
            ```
         * Return data about name, surname and phone number from the client table:
           ```sql
           select nume, prenume, numer_telefon from clienti;
           ```
         * Return flight data for flights with a price higher than 350:
           ```sql
           select * from zbor where pret_zbor < 350;
           ```
         * Return flight data for flights where the departure date is after 2024-05-15:
           ```sql
           select * from zbor where data_de_plecare > "2024-05-15";
           ```
         * Rerun all clients whose names start with the letter 'M':
        ```sql
          select * from clienti where nume like "M%";
        ```
         * Return all cities whose name ends with the letter 'a':
         ```sql
          select * from oras where nume_oras like "%a";
         ```
         * Returns all flights that have a higher price greater than 300 and at the same time the departure date is after 2024-04-04:  
         ```sql
          select * from zbor where pret_zbor > 300 and data_de_plecare > "2024-04-04";
         ```
         * Return all flights that have an arrival date before 2024-04-14 or the flight price is less than 200:
         ```sql
         select * from flight where data_de_sosire < "2024-04-14" or pret_zbor > 400;
         ```
         * Return the arithmetic mean for the price of the flights:
         ```sql
         select avg(pret_zbor) from zbor;
         ```
         * Return of the amount for the price of the flights:
         ```sql
         select sum(pret_zbor) from zbor;
         ```
         * Returning the lowest flight price:
         ```sql
         select min(pret_zbor) from zbor;
         ```
         * Return of the highest flight price:
         ```sql
         select max(pret_zbor) from zbor;
         ```
         * Return the total number of records from the customer table:
        ```sql
        select count(*) from clienti;
        ```
         * Returning the ids of the airports together with the average prices of flight only for airports for which the average price is higher than 300: 
         ```sql
         select id_aeroport, avg(pret_zbor) as pret from zbor group by id_aeroport having pret>300;
         ```
         * Returning all customers who bought tickets:
         ```sql
         select * from clienti c inner join bilet b on c.id_client= b.id_client;
         ```
         * Returns all customers together with information about the purchase of tickets (both customers who bought tickets and those who did not buy tickets):
         ```sql
         select * from clienti c left join bilet b on c.id_client= b.id_client;
         ```
         * Returning all the information from the ticket table and from the customer table populates the rest of the information only for common records:
         ```sql
         select * from clienti c right join bilet b on c.id_client= b.id_client;
         ```
         * Rerun all possible combinations of records between the customer and ticket tables
        ```sql
          select * from clienti cross join bilet;
        ```
         * Return of the first 2 customers:
         ```sql
         select * from clienti limit 2;
         ```
         * First flight return:
         ```sql
         select * from zbor limit 1;*
         ```
         * Return of all flights ordered in ascending order by flight price:
         ```sql
         select * from zbor order by pret_zbor;*
        ```
         * Return of all flights ordered in descending order by flight price: *
         ```sql
         select * from zbor order by pret_zbor desc;
         ```
         * Returning the maximum number of flights for each individual airport:
      ```sql
           select a.nume_aeroport_plecare, max(numar_zboruri) from aeroport a 
	   inner join 
	   (select a.id_aeroport, a.nume_aeroport_plecare, count(id_zbor) numar_zboruri 
	   from aeroport a 
           inner join zbor z on a.id_aeroport = z.id_aeroport
	   group by a.id_aeroport, a.nume_aeroport_plecare) numar_zboruri on a.id_aeroport = numar_zboruri.id_aeroport
	   group by a.nume_aeroport_plecare;
        ```
           
  4. Conclusions
     
     I created a database for booking plane tickets, from where I learned to create tables, populate them with data, make connections between tables, update some information, delete some data, and return the data both at once and with various filters.

