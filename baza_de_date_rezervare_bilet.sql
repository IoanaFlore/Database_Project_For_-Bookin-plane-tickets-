# Crearea unei baze de date pentru rezervarea biletelor de avion
CREATE DATABASE rezervare_bilete_avion;

# Instructiunii DDL
# CREATE
/* Crearearea unei tabele entitate 'ORAS' care să stocheze
 toate informațiile despre orasul unde se afla aeroportul */
create table oras(
       id_oras int not null auto_increment primary key,
       nume_oras varchar(50),
       tară varchar(50)
);

#Se afiseaza structura tabelei
desc oras;

# Crearearea unei tabele entitate 'AEROPORT' care să stocheze toate informațiile despre aeroportul de plecare
/* Legatura 'oras-aeroport' este de one to many (un oras poate avea mai multe aeroporturi,
iar un aeroport trebuie sa apartina unui singur oras), 
avand cheia primara 'id_aeroport' si cheia secundara 'id_oras' */
create table aeroport(
	id_aeroport int not null auto_increment primary key,
    id_oras int not null,
    nume_aeroport_plecare varchar(80),
    adresa_aeroport_plecare varchar(100),
    foreign key (id_oras) references oras(id_oras)
);

#Se afiseaza structura tabelei
desc aeroport;

/* Crearearea unei tabele entitate 'companie' care să stocheze toate
 informațiile despre compania cu care ckientul alege sa zboare */
create table companie(
     id_companie int not null auto_increment primary key,
     nume_companie varchar(30) not null,
     descriere_companie varchar(100)
);

# Se afiseaza structura tabelei
desc companie;

/* Crearearea unei tabele entitate 'zbor' care să 
stocheze toate informațiile despre zbor */
create table zbor(
      id_zbor int not null auto_increment primary key,
      data_de_plecare date,
      date_de_sosire date,
      pret_zbor float,
      id_aeroport int not null,
      id_companie int not null	
);

/* Legatura 'aeroport-zbor' este de one to many (un aeroport poate avea mai multe zboruri, iar un zbor trebuie sa apartina unui singur aeroport), 
avand cheia primara 'id_zbor' si cheia secundara 'id_aeroport' */
alter table zbor add foreign key(id_aeroport) references aeroport(id_aeroport);

/* Legatura 'companie-zbor' este de one to many (o companie poate avea mai multe zboruri, iar un zbor trebuie sa apartina de o companie), 
avand cheia primara 'id_zbor' si cheia secundara 'id_companie' */
alter table zbor add foreign key(id_companie) references companie(id_companie);

/* Crearearea unei tabele entitate 'clienti' care să stocheze toate
 informațiile despre clientii care vor cumpaar un bilet de avion */
create table clienti(
        id_client int not null auto_increment primary key,
        nume varchar(30) not null,
        prenume varchar(30) not null,
        adresa varchar(100),
        numar_telefon varchar(15) not null,
        email varchar(50) not null
);

# Se afiseaza structura tabelei
desc clienti;

/* Crearearea unei tabele entitate 'bilet' care să stocheze toate
 informațiile despre biletul de avion pe care clientul il va achiziona. */
create table bilet(
      id_bilet int not null auto_increment primary key,
      denumire_bilet varchar(30),
      id_zbor int not null,
      id_client int not null     
);

/* Legatura 'zbor-bilet' este de one to many (un zbor poate avea spre vanzare mai multe bilete, iar un bilet trebuie sa apartina unui singur zbor), 
avand cheia primara 'id_bilet' si cheia secundara 'id_zbor' */
alter table bilet add foreign key(id_zbor) references zbor(id_zbor);
/* Legatura 'clienti-bilet' este de one to many (un client poate sa detina mai multe bilete, iar un bilet trebuie sa apartina unui singur client), 
avand cheia primara 'id_bilet' si cheia secundara 'id_client' */
alter table bilet add foreign key(id_client) references clienti(id_client);
desc bilet;
# Instructiunii DML (insert, update, delete)

# Comanda pt a ne da voie sa adaugam valori in tabele
set sql_safe_updates=0;

/* Adaugarea a 5 inregistrari in tabelul oras
 care reprezinta datele despre fiecare oras. */
insert into oras (nume_oras, tară)
values 
   ("Constanta", "Romania"),
   ("Tulcea", "Romania"),
   ("Cluj-Napoca", "Romania"),
   ("Oradea", "Romania"),
   ("Barsov", "Romania");

   
/* Adaugarea a 5 inregistrari in tabelul aeroport
 care reprezinta datele despre fiecare aeroport. */
insert into aeroport (id_oras, nume_aeroport_plecare, adresa_aeroport_plecare)
values
    (1, "Aeroport Mihail Kogalniceanu", "Str. Aeroportului nr.9"),
    (2, "Aeroport Tulcea", "Str. Aeroportului nr.2"),
    (3, "Aeroport Avram Iancu", "Str. Traian Vuia nr.3"),
    (4, "Aeroport Oradea ","Str. Calea Aradului nr.9"),
    (5, "Aeroport Barsov", "Str. Aeroportului nr.10");

/* Adaugarea a 5 inregistrari in tabelul companie
 care reprezinta datele despre fiecare companie. */
insert into companie (nume_companie, descriere_companie)
values 
	("Blue Air","Aceasta companie are sediu in Bucuresti."),
	("Ryanair","Aceasta companie eset fondata in 1994."),
	("HiSky","Aceasta companie are sediu in Chisinau."),
	("EL AL","Aceasta companie este fonadat in 1948."),
	("Wizz Air","Este o companie foarte buna.");

/* Adaugarea a 5 inregistrari in tabelul zbor care
 reprezinta datele despre fiecare zbor pe care il va alege clientul.*/     
insert into zbor(data_de_plecare, date_de_sosire, pret_zbor, id_aeroport, id_companie)
values
    ("2024-04-04", "2023-04-04", 345.33, 2, 4),
    ("2024-05-02", "2023-05-02", 453.84, 1, 3),
    ("2024-07-12", "2023-07-12", 234.99, 3, 1),
    ("2024-04-14", "2023-04-14", 322.87, 4, 5),
    ("2024-05-15", "2023-05-15", 157.86, 5, 2);
    

/* Adaugarea a 5 inregistrari in tabelul clienti care
 reprezinta datele despre fiecare client care isi va cumpara un bilet de avion. */   
insert into clienti (nume, prenume, adresa, numar_telefon, email)
values 
     ("Marincas","Ioana","Str. Roamana","0756578345","marincasioana@gmail.com"),
     ("Mare","Ion","Str. Teiului","0753558325","mareion@gmail.com"),
     ("Puie","Elena","Str. Margaretei","0754578241","puieelena@gmail.com"),
     ("Rotar","Izabela","Str. Florilor","0756345679","rotarizabela@gmail.com"),
     ("Crecan","Maria","Str. Marin Preda","0756789432","crecanmaria@gmail.com");

/* Adaugarea a 5 inregistrari in tabelul bilet care reprezinta 
datele despre fiecare bilet pe care clientul il va achizitiona. */
insert into bilet(denumire_bilet, id_zbor, id_client)
values 
     ("AS458GMJDJJKF", 2, 4),
     ("FS57838GFNJHJ", 1, 5),
     ("AS23GFJGBJD34", 3, 2),
     ("CVJKFJJ36474B", 4, 1),
     ("AWHRFUE4693JF", 5, 3);

# UPDATE
# Actualizarea orasului pentru inregistrarea 5 din tabelul oras.
update oras set nume_oras="Brasov" where id_oras=5;
# Actualizarea adresei aeroportlui pentru inregistrarea 2 din tabelul aeroport.
update oras set nume_oras="Brasov" where id_oras=5;
/* Actualizarea descrieii companiei pentru inregistrarea cu
 numele companiei "Ryanair" din tabelul companiei.*/
update companie set descriere_companie = "Aceasta companie are un mare renume" 
where nume_companie="Ryanair";
# Actualizarea pretului pentru zbor pentru inregistrarea 1 din tabelul zbor.
update zbor set pret_zbor = 123.66 where id_zbor=1;
# Actualizarea prenumelui clientului pentru inregistrarea cu numele "Mare".
update clienti set prenume = "Ionela" where nume="Mare";
# Actualizarea adresei de email pentru inregistrarea cu numele "Mare".
update clienti set email = "mareionela@gmail.com" where nume="Mare";
# Actualizarea denumirii biletului pentru inregistrarea 3 din tabelul bilet.
update bilet set denumire_bilet = "AWHRF345393JF" where id_bilet=3;
# Actualizarea detei de sosire pentru zborul cu inregsitrarea 1.
update zbor set date_de_sosire = "2024-04-04" where id_zbor = 1;
# Actualizarea detei de sosire pentru zborul cu inregsitrarea 2.
update zbor set date_de_sosire = "2024-05-02" where id_zbor = 2;
# Actualizarea detei de sosire pentru zborul cu inregsitrarea 3.
update zbor set date_de_sosire = "2024-07-12" where id_zbor = 3;
# Actualizarea detei de sosire pentru zborul cu inregsitrarea 4.
update zbor set date_de_sosire = "2024-04-14" where id_zbor = 4;
# Actualizarea detei de sosire pentru zborul cu inregsitrarea 5.
update zbor set date_de_sosire = "2024-05-15" where id_zbor = 5;
# DELETE
# Stergerea inregistrarii 5 din tabelul bilet.
delete from bilet where id_bilet=5;
# Stergerea inregistrarii 3 din tabelul clienti.
delete from clienti where id_client = 3;

# Instructiunii DQL

# select all
# Returnarea tuturor datelor din tabelul oras.
select * from oras;
# Returnarea tuturor datelor din tabelul aeroport.
select * from aeroport;
# Returnarea tuturor datelor din tabelul companie.
select * from companie;
# Returnarea tuturor datelor din tabelul zbor.
select * from zbor;
# Returnarea tuturor datelor din tabelul clienti.
select * from clienti;
# Returnarea tuturor datelor din tabelul bilet.
select * from bilet;

# select cateva coloane
# Returnarea datelor despre datele de plecare si pretul zborurilor din tabelul zbor.
select data_de_plecare, pret_zbor from zbor;
# Returnarea datelor despre nume, prenume si numar de telefom din tabelul cleinti.
select nume, prenume, numar_telefon from clienti;

# Filtrari cu where
/* Returnarea datelor despre zbor pentru
 zborurile cu un pret mai mare de 350. */
select * from zbor where pret_zbor < 350;
/* Returnarea datelor despre zbor pentru 
zborurile unde data de plecare este dupa 2024-05-15.*/
select * from zbor where data_de_plecare > "2024-05-15";

# Filtrari cu like
# Rerurnarea tuturor clientiilor al caror nume inceepe cu litera 'M'.
select * from clienti where nume like "M%";
# Returnarea tuturor oraselor al carui nume se termina cu litera 'a'.
select * from oras where nume_oras like "%a";

# Filtari cu 'and' si 'or'
/* Returnarae tuturor zborurilor care au un pret mai
 mare de 300 si in acelasi timp data de plecare este dupa 2024-04-04. */
select * from zbor where pret_zbor > 300 and data_de_plecare > "2024-04-04";
/* Returnarea tuturor zborurilor care au data de sosire
 inainte de 2024-04-14 sau pretul zborului e mai mic de 200. */
select * from zbor where date_de_sosire < "2024-04-14" or pret_zbor > 400;

# Functii agregate
# Returnarea mediei aritmetice pentru pretul zborurilor.
select avg(pret_zbor) from zbor;
# Returnarea sumei pentru pretul zborurilor.
select sum(pret_zbor) from zbor;
# Returnarea celui mai mic pret de zbor.
select min(pret_zbor) from zbor;
# Returnarea celui mai mare pret de zbor.
select max(pret_zbor) from zbor;
# REturnarea numarului tottal de inregistrari din tabela clienti.
select count(*) from clienti;

# Filtare pe functii agregate
/* Returnarea idurilor aeroporturilor impreuna cu media preturilor de 
zbor doar pentru aeroporturile pentru care media preturilor e mai mare de 300 */
select id_aeroport, avg(pret_zbor) as pret from zbor 
group by id_aeroport having pret>300;

# Joinuri
# Returnarea tuturor clientilor care au cumparat bilete
select *  from  clienti c inner join bilet b on c.id_client= b.id_client;

/* Returneaza toti clientii impreuna cu informatii despre achizitia biletelor (atat clientii care au cumparat bilete cat si cei care nu au cumparat bilete).*/
select *  from  clienti c left join bilet b on c.id_client= b.id_client;

/* Returnarea tuturor informatiilor din tabela bilet si din tabela clienti populeaza restu de informatii doar pentru inregistrariile comune.*/
select *  from  clienti c right join bilet b on c.id_client= b.id_client;

# Rerurnarea tuturor combinatiilor posibile de inregistrarii dintre tabelele clienti si bilet
select * from clienti cross join bilet;

#limit
# Returnarea primilor 2 clienti .
select * from clienti limit 2;
# Returnarea primului zbor.
select * from zbor limit 1;

# order by
# Returnarea tuturor zborurilor ordonate crescator dupa pretul zborului.
select * from zbor order by pret_zbor;
# Returnarea tuturor zborurilor ordonate descrescator dupa pretul zborului.
select * from zbor order by pret_zbor desc;

# Subquery-uri
# Returnarea numarului maxim de zboruri pentru fiecare aeroport in parte
select a.nume_aeroport_plecare, max(numar_zboruri) from aeroport a 
		inner join 
		(select a.id_aeroport, a.nume_aeroport_plecare, count(id_zbor) numar_zboruri 
		from aeroport a 
             inner join zbor z on a.id_aeroport = z.id_aeroport
		group by a.id_aeroport, a.nume_aeroport_plecare) numar_zboruri on a.id_aeroport = numar_zboruri.id_aeroport
		group by a.nume_aeroport_plecare;
