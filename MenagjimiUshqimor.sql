create database Menagjimi_UshqimorProve15
go
use  Menagjimi_UshqimorProve15
go


create table Anëtari
(
ID varchar(50) primary key,
Emri varchar(50) not null,
Mbiemri varchar(50) not null,
Adresa varchar(50) not null,
Qyteti varchar(50) not null,
Shteti varchar(50) not null,
ZIP varchar(20) not null,
Tel varchar(12) not null,
Email varchar(50) not null,
Ditëlindja date,
)

insert into Anëtari values('1A','Altin', 'Morina', 'Velani, Rr. Shaip Kamberi', 'Prishtinë', 'Kosovë', '10000','+38344949897','Altin.Morina@hotmail.com','1999-12-05')
insert into Anëtari values('2A','Zana', 'Gashi', 'Dardania 1, Rr. Fatos Limani', 'Gjilan', 'Kosovë', '60000','+38345149237','Zana.Gashi@gmail.com','1987-09-24')
insert into Anëtari values('3A','Bardha', 'Zogiani', 'Ulpianë, Rr. Henry Dinant', 'Prishtinë', 'Kosovë', '10000','+38345176295','Bardha.Zogiani@hotmail.com','1994-02-15')
insert into Anëtari values('4A','Jeton', 'Brestovci', ' Rr. Marie Shllaku', 'Gjilan', 'Kosovë', '60000','+38345674387','Jeton.B@outlook.com','1980-04-24')
insert into Anëtari values('5A','Shqipe', 'Haxhikadrija', 'Haxhi Ymeri', 'Gjakove', 'Kosovë', '50000','+37745236487','Haxhikadrija_Shqipe@msn.com','1973-06-25')
insert into Anëtari values('6A','Festim', 'Hoda', 'Bazhdarhane, Rr. Enver Haradinaj', 'Prizren', 'Kosovë', '20000','+37744367981','Festim95@hotmail.com','1985-08-05')
insert into Anëtari values('7A','Qëndresa', 'Arifaj', 'Rrokaqielli, Rr. Ramiz Sadiku', 'Pejë', 'Kosovë', '30000','+37744367981','Qendresaarifaj@hotmail.com','1998-07-17')
insert into Anëtari values('8A','Suzana', 'Begolli', 'Tavnik', 'Mitrovicë', 'Kosovë', '40000','+38344168351','BegolliSuzana@gmail.com','1974-02-02')
insert into Anëtari values('9A','Bekim', 'Shala', 'Bregu i Diellit, Rr. Hilmi Rakovica', 'Prishtinë', 'Kosovë', '10000','+38649247654','B.shala@hotmail.com','1957-09-27')
insert into Anëtari values('10A','Kastriot', 'Ramadani', 'Iliria', 'Ferizaj', 'Kosovë', '70000','+37745327923','Kastriotramadai@hotmail.com','1990-06-13')
insert into Anëtari values('11A','Jeta', 'Elezaj', 'Laxhja e Re', 'Lipjan', 'Kosovë', '14000','+38345149237','Jetaelezaj@gmail.com','2001-04-19')
insert into Anëtari values('12A','Redon', 'Kasumi', 'Velani', 'Prishtinë', 'Kosovë', '14000','+38344843720','redon@gmail.com','2001-04-19')
insert into Anëtari values('13A','Trina', 'Hyseni', 'Laxhja e Re', 'Lipjan', 'Kosovë', '14000','+38345149637','trina@gmail.com','2001-04-19')
insert into Anëtari values('14A','Genita', 'Selmani', 'Laxhja e Re', 'Lipjan', 'Kosovë', '14000','+38345189237','genita@gmail.com','2001-04-19')
insert into Anëtari values('15A','Odesa', 'Topojani', 'Laxhja e Re', 'Lipjan', 'Kosovë', '14000','+38345159237','odesaj@gmail.com','2001-04-19')

UPDATE Anëtari
SET Emri = 'Leonora', Qyteti= 'Prishtinë'
WHERE ID = '8A';

DELETE FROM Anëtari WHERE ID='15A';


 create table Personale
(
ID varchar(50) foreign key references Anëtari,
Mosha int,
Gjinia varchar(1),
Gjatësia numeric(3,2),
Pesha int,
constraint Age check (Mosha>=16),
constraint PCons check(Gjatësia>0 and Pesha>0),
constraint gjiniaCons check(Gjinia='M' or Gjinia='F'),
primary key(ID)
)

insert into Personale values('1A',19,'M', 1.73, 60)
insert into Personale values('3A',24,'F', 1.59, 53)
insert into Personale values('4A',38,'M', 1.87, 95)
insert into Personale values('5A',45,'F', 1.68, 72)
insert into Personale values('6A',33,'M', 1.84, 85)
insert into Personale values('7A',25,'F', 1.62, 75)
insert into Personale values('8A',44,'F', 1.70, 75)
insert into Personale values('9A',61,'M', 1.79, 94)
insert into Personale values('10A',28,'M', 1.69, 68)
insert into Personale values('11A',17,'F', 1.60, 51)
insert into Personale values('12A',17,'M', 1.80, 70)
insert into Personale values('13A',17,'F', 1.55,55 )
insert into Personale values('14A',17,'F', 1.70, 60)
insert into Personale values('15A',17,'F', 1.65, 65)

DELETE FROM Personale WHERE ID='15A';

create table KonfidencialeA
(
ID varchar(50) foreign key references Anëtari,
Username varchar(20) not null,
Pass varchar(20) not null,
primary key(ID)
)


insert into KonfidencialeA values('1A', 'Altin.Morina', 'AM9912')
insert into KonfidencialeA values('3A', 'Bardha.Zogiani', 'BZ9402')
insert into KonfidencialeA values('4A', 'Jeton.Brestovci', 'JB8004')
insert into KonfidencialeA values('5A', 'Shqipe.Haxhikadrija', 'SH7306')
insert into KonfidencialeA values('6A', 'Festim.Hoda', 'FH9508')
insert into KonfidencialeA values('7A', 'Qëndresa.Arifaj', 'QA9807')
insert into KonfidencialeA values('8A', 'Suzana.Begolli', 'SB7402')
insert into KonfidencialeA values('9A', 'Bekim.Shala', 'BS5709')
insert into KonfidencialeA values('10A', 'Kastriot.Ramadani', 'KR9006')
insert into KonfidencialeA values('11A', 'Jeta.Elezaj', 'JE0404')
insert into KonfidencialeA values('12A', 'Redon.Kasumi', 'RE0405')
insert into KonfidencialeA values('13A', 'Trina.Hyseni', 'TE0406')
insert into KonfidencialeA values('14A', 'Genita.Selmani', 'GE0407')
insert into KonfidencialeA values('15A', 'Odesa.Topojani', 'OE0408')

DELETE FROM KonfidencialeA WHERE ID='15A';

create table Nutricionisti
(
ID_Nutri varchar(50) primary key,
Emri varchar(50) not null,
Mbiemri varchar(50) not null,
Adresa varchar(50) not null,
Tel varchar(12) not null,
Email varchar(50) not null,
Kualifikimi varchar(50) not null
)

insert into Nutricionisti values ('1N', 'Robert', 'Berisha','Bregu i Diellit, Prishtine', '+38344354623', 'robert.berisha@gmail.com', 'Master')
insert into Nutricionisti values ('2N', 'Gentiana', 'Kastrati','Bezhdarhane, Prizren', '+37744534784', 'gentianakastrati@gmail.com', 'Doktoraturë')
insert into Nutricionisti values ('3N', 'Donikë', 'Ismaili','Dheu i Bardhë, Gjilan', '+38345669403', 'donikeismaili@outlook.com', 'Master')
insert into Nutricionisti values ('4N', 'Ahmet', 'Halili','Nënë Tereza, Gjakovë', '+38649768395', 'ahmet.halili@hotmail.com', 'Master')
insert into Nutricionisti values ('5N', 'Luljeta', 'Demi','Laxhjja e Re, Ferizaj', '+37745986734', 'luljeta.demi@hotmail.com', 'Bacchelor')
insert into Nutricionisti values ('6N', 'Naser', 'Kelmendi','Ulpianë, Prishtinë', '+37744657839', 'naser_kelmendi@gmail.com', 'Doktoraturë')


create table KonfidencialeN
(
ID_Nutri varchar(50) foreign key references Nutricionisti,
Username varchar(20),
Pass varchar(20),
primary key (ID_Nutri)
)

insert into KonfidencialeN values('1N', 'Robert.Berisha', 'N0001')
insert into KonfidencialeN values('2N', 'Gentiana.Kastrati', 'N0002')
insert into KonfidencialeN values('3N', 'Donikë.Ismaili', 'N0003')
insert into KonfidencialeN values('4N', 'Ahmet.Halili', 'N0004')
insert into KonfidencialeN values('5N', 'Luljeta.Demi', 'N0005')
insert into KonfidencialeN values('6N', 'Naser.Kelmendi', 'N0006')


create table Përbërësi
(
Përbërësi varchar (50) primary key,
Prodhuesi varchar(50),
Pesha int,
constraint peshaCons check (Pesha>0),
)


insert into Përbërësi values ('Kafe', 'Nesscafe', 5)
insert into Përbërësi values ('Qumësht', 'Nesscafe', 20)
insert into Përbërësi values ('Lëng frutash', 'Frutti', 100)
insert into Përbërësi values ('Biskota ', 'Sempre', 50)
insert into Përbërësi values ('Erëza', NULL, 3)
insert into Përbërësi values ('Drithëra', NULL, 50)
insert into Përbërësi values ('Bukë thekre', NULL, 50)
insert into Përbërësi values ('Reçel', NULL, 20)
insert into Përbërësi values ('Mjaltë', NULL, 10)
insert into Përbërësi values ('Djath ', NULL, 20)
insert into Përbërësi values ('Ve', NULL, 20)
insert into Përbërësi values ('Domate', NULL, 80)
insert into Përbërësi values ('Patate', NULL, 200)
insert into Përbërësi values ('Makarona', NULL, 150)
insert into Përbërësi values ('Oriz ', 'Ducato di mantova', 100)
insert into Përbërësi values ('Karrota', NULL, 50)
insert into Përbërësi values ('Bizele', NULL, 50)
insert into Përbërësi values ('Brokoli', NULL, 50)
insert into Përbërësi values ('Sallatë e gjelber', NULL, 40)
insert into Përbërësi values ('Tranguj', NULL, 50)
insert into Përbërësi values ('Mish peshku', NULL, 100)
insert into Përbërësi values ('Mish pule ', NULL, 100)
insert into Përbërësi values ('Mollë', 'Nesscafe', 100)
insert into Përbërësi values ('Kivi', 'Nesscafe', 100)
insert into Përbërësi values ('Manaferra', 'Nesscafe', 100)
insert into Përbërësi values ('Banane', 'Nesscafe', 80)
insert into Përbërësi values ('Portokall', 'Nesscafe', 100)
insert into Përbërësi values ('Fruta te thata(arra,lajthi,bajame)', NULL, 80)
insert into Përbërësi values ('Cokollate', Null, 50)


create table Problemi_Shëndetsor
(
Lloji varchar(50) primary key
)


insert into Problemi_Shëndetsor values ('Obezitet')
insert into Problemi_Shëndetsor values ('Diabet')
insert into Problemi_Shëndetsor values ('Hipertension')
insert into Problemi_Shëndetsor values ('Semundje te zemres')
insert into Problemi_Shëndetsor values ('Laktoze intoleranca')
insert into Problemi_Shëndetsor values ('Demtim i veshkave')
insert into Problemi_Shëndetsor values ('Kolesteroli ne gjak')

create table Kartela_Mjeksore
(
ID varchar(50) foreign key references Anëtari,
Alergjitë varchar(50) foreign key references Përbërësi,
Problemi_Shëndetësor varchar(50) foreign key references  Problemi_Shëndetsor
primary key (ID)
)




insert into Kartela_Mjeksore values ('1A', 'Domate', 'Obezitet')
insert into Kartela_Mjeksore values ('2A', null, 'Obezitet')  
insert into Kartela_Mjeksore values ('3A', null, 'Demtim i veshkave') 
insert into Kartela_Mjeksore values ('4A', 'Fruta te thata(arra,lajthi,bajame)', 'Diabet') 
insert into Kartela_Mjeksore values ('5A', null, 'Hipertension') 
insert into Kartela_Mjeksore values ('6A', 'VE', 'Hipertension') 
insert into Kartela_Mjeksore values ('7A', null, 'Obezitet') 
insert into Kartela_Mjeksore values ('8A', null, 'Kolesteroli ne gjak') 
insert into Kartela_Mjeksore values ('9A', null, 'Semundje te zemres') 
insert into Kartela_Mjeksore values ('10A', null, 'Diabet') 
insert into Kartela_Mjeksore values ('11A', 'Qumësht', 'Laktoze intoleranca') 
insert into Kartela_Mjeksore values ('12A', 'VE', null) 
insert into Kartela_Mjeksore values ('13A', 'Mjaltë', null) 
insert into Kartela_Mjeksore values ('14A', 'Domate', null) 
insert into Kartela_Mjeksore values ('15A', 'Mjaltë', null)


DELETE FROM  Kartela_Mjeksore WHERE ID='15A';


create table Lëndët_UshqyeseP
(
Përbërësi varchar(50) foreign key references Përbërësi,
Kalori int not null,
Proteina int not null,
Karbohidrate int not null,
primary key (Përbërësi),
constraint pozitive check (Kalori>=0 and Proteina>=0 and Karbohidrate>=0)
)

Alter table  Lëndët_UshqyeseP
drop constraint pozitive

Alter table  Lëndët_UshqyeseP
drop column Kalori

Alter table  Lëndët_UshqyeseP
add Kalori int not null

Alter table  Lëndët_UshqyeseP
add constraint pozitive check (Kalori>=0 and Proteina>=0 and Karbohidrate>=0)


insert into Lëndët_UshqyeseP values ('Kafe', 100, 0 , 10)
insert into Lëndët_UshqyeseP values ('Qumësht', 100, 0 , 15)
insert into Lëndët_UshqyeseP values ('Lëng frutash', 50, 50 , 25)
insert into Lëndët_UshqyeseP values ('Djath', 350, 70 , 10)
insert into Lëndët_UshqyeseP values ('Oriz', 50, 30 , 25)
insert into Lëndët_UshqyeseP values ('Domate', 50, 35 , 5)
insert into Lëndët_UshqyeseP values ('Patate', 110, 35 , 5)
insert into Lëndët_UshqyeseP values ('Karrota', 40, 40 , 5)
insert into Lëndët_UshqyeseP values ('Tranguj', 40, 40 , 5)
insert into Lëndët_UshqyeseP values ('Brokoli', 40, 40 , 5)
insert into Lëndët_UshqyeseP values ('Ve', 230, 90 , 2)
insert into Lëndët_UshqyeseP values ('Biskota', 250, 10 , 10)
insert into Lëndët_UshqyeseP values ('Mish pule', 230, 35 , 5)
insert into Lëndët_UshqyeseP values ('Mish peshku', 200, 32 , 5)
insert into Lëndët_UshqyeseP values ('Drithëra', 230, 40 , 60)
insert into Lëndët_UshqyeseP values ('Bukë thekre', 230, 35 , 50)
insert into Lëndët_UshqyeseP values ('Sallatë e gjelber', 120, 50 , 10)
insert into Lëndët_UshqyeseP values ('Mollë', 60, 20 , 10)
insert into Lëndët_UshqyeseP values ('Portokall', 40, 25 , 8)
insert into Lëndët_UshqyeseP values ('Fruta te thata(arra,lajthi,bajame)', 65, 40 , 15)
insert into Lëndët_UshqyeseP values ('Banane', 50, 25 , 10)
insert into Lëndët_UshqyeseP values ('Erëza', 10, 1 , 0)
insert into Lëndët_UshqyeseP values ('Reçel', 80, 10 , 80)
insert into Lëndët_UshqyeseP values ('Cokollate', 80, 25 , 70)
insert into Lëndët_UshqyeseP values ('Bizele', 10,60,80)
insert into Lëndët_UshqyeseP values ('Kivi', 20,50,80)
insert into Lëndët_UshqyeseP values ('Makarona', 50,10,100)
insert into Lëndët_UshqyeseP values ('Manaferra', 10,50,90)
insert into Lëndët_UshqyeseP values ('Mjaltë', 50,10,100)



create table Pjata(
ID_Pjata varchar(50) primary key,
EmriP varchar(50) not null,
Nr_Persona int not null,
Koha_Pergaditjes varchar(20) not null,
constraint pozitive2 check (Nr_Persona>0 )
)

insert into Pjata values ('1P', 'Makiato', 1,5 )
insert into Pjata values ('2P', 'Leng Portokalli', 1,5)
insert into Pjata values ('3P', 'Patate te ziera', 1,20)
insert into Pjata values ('4P', 'Patate te skuqura', 1,30)
insert into Pjata values ('5P', 'Oriz me perime', 1,20)
insert into Pjata values ('6P', 'Perime te ferguara', 1,20)
insert into Pjata values ('7P', 'Mish pule', 1,30)
insert into Pjata values ('8P', 'Mish peshku', 1,20)
insert into Pjata values ('9P', 'Makarona me salce domatesh ', 1,30)
insert into Pjata values ('10P', 'Veze te ziera', 1,10)
insert into Pjata values ('11P', 'Veze te ferguara', 1,10)
insert into Pjata values ('12P', 'Corn Flakes', 1,10)
insert into Pjata values ('13P', 'Rriske buke me recel', 1,5)
insert into Pjata values ('14P', 'Sallate e perimeve', 1,15)
insert into Pjata values ('15P', 'Sallate frutash', 1,15)
insert into Pjata values ('16P', 'Fruta te thata', 1,5)


create table Instruksione 
(
ID_Pjata varchar(50) foreign key references Pjata,
Instruksione varchar(1000)
primary key (ID_Pjata)
) 


insert into Instruksione values ('1P','Merr kafen dhe shtoni qumështin, merr biskotat')
insert into Instruksione values ('2P','Vendos portokallin ne shtrydhesen e frutave')
insert into Instruksione values ('3P','Pastohen patatet, ua shtojme erezat dhe i vendosim ne enen per zierje')
insert into Instruksione values ('4P','Pastrojini patatet dhe prejini në copa të vogla. Nxehni vajin e ullirit në një tigan mesatar dhe skuqni patatet për rreth 20 minuta')
insert into Instruksione values ('5P','Pastrojeni orizin, shtoni erezat dhe perimet, vendosini ne enen per zierje')
insert into Instruksione values ('6P','Merr perimet, pastroni dhe preni ato,shtoni erezat dhe vendosini ne tiganin per fergim')
insert into Instruksione values ('7P','Merrni mishin e bardhe, coptojeni ne pjese te vogla, shtoni kripe dhe ereza tjera dhe vendoseni ne tepsi.Pjeket ne temp 200 grade.')
insert into Instruksione values ('8P','Copezat e mishit te peshkut i lyejme me mustarde,ereza dhe prezle dhe i vendosim ne tigan per fergim')
insert into Instruksione values ('9P','Ne nje tengjere me uje te vluar,shtojme makaronat dhe pasi te jene zier ua shtojme salcen e domateve')
insert into Instruksione values ('10P','1-2 veze i vedosini ne ene me uje dhe i zieni per 5-8 minuta')
insert into Instruksione values ('11P','1-2 vezeve u shtoni kripe dhe vendosini ne tiganin per fergim')
insert into Instruksione values ('12P','Merr qumeshtin e ngrohte dhe shojeni ne drithera')
insert into Instruksione values ('13P','Merr rriskat e bukes dhe lyej me recel')
insert into Instruksione values ('14P','Sallaten e gjelber,tragujt,karrotat,domatet preni ne copeza te vogla, perzieni dhe u shtoni kripe,uthull')
insert into Instruksione values ('15P','Frutat(Molle,Portokall...) priti ne copeza te vogla dhe perziej')
insert into Instruksione values ('16P','Merri frutat e thata: arra, lajthi, bajame dhe perziej,( Sasia totale 80gr )')


create table Receta (
ID_Produkti varchar(50) foreign key references Përbërësi,
ID_Pjata varchar(50) foreign key references Pjata,
primary key (ID_Produkti,ID_Pjata)
)

insert into Receta values ('Kafe', '1P')
insert into Receta values ('Biskota', '1P')
insert into Receta values ('Qumësht', '1P')
insert into Receta values ('Portokall', '2P')
insert into Receta values ('Patate', '3P')
insert into Receta values ('Erëza', '3P')
insert into Receta values ('Patate', '4P')
insert into Receta values ('Oriz', '5P')
insert into Receta values ('Erëza', '5P')
insert into Receta values ('Karrota', '5P')
insert into Receta values ('Bizele', '5P')
insert into Receta values ('Brokoli', '6P')
insert into Receta values ('Domate', '6P')
insert into Receta values ('Patate', '6P')
insert into Receta values ('Bizele', '6P')
insert into Receta values ('Mish pule', '7P')
insert into Receta values ('Erëza', '7P')
insert into Receta values ('Mish peshku', '8P')
insert into Receta values ('Erëza', '8P')
insert into Receta values ('Makarona', '9P')
insert into Receta values ('Domate', '9P')
insert into Receta values ('Erëza', '9P')
insert into Receta values ('Ve', '10P')
insert into Receta values ('Ve', '11P')
insert into Receta values ('Drithëra', '12P')
insert into Receta values ('Qumësht', '12P')
insert into Receta values ('Bukë thekre', '13P')
insert into Receta values ('Sallatë e gjelber', '14P')
insert into Receta values ('Tranguj', '14P')
insert into Receta values ('Domate', '14P')
insert into Receta values ('Karrota', '14P')
insert into Receta values ('Mollë', '15P')
insert into Receta values ('Kivi', '15P')
insert into Receta values ('Manaferra', '15P')
insert into Receta values ('Portokall', '15P')
insert into Receta values ('Banane', '15P')
insert into Receta values ('Fruta te thata(arra,lajthi,bajame)', '16P')


create table Dita (
ID_Dita varchar(50) primary key,
Mëngjesi varchar(50) foreign key references Pjata,
Dreka varchar(50) foreign key references Pjata,
Darka varchar(50) foreign key references Pjata,
)



insert into Dita values ('1D', '1P', '4P', '15P' )
insert into Dita values ('2D', '2P', '7P', '14P' )
insert into Dita values ('3D', '10P', '5P', '3P' )
insert into Dita values ('4D', '12P', '8P', '16P' )
insert into Dita values ('5D', '11P', '7P', '6P' )
insert into Dita values ('6D', '13P', '9P', '15P' )
insert into Dita values ('7D', '2P', '5P', '16P' )
insert into Dita values ('8D', '12P', '9P', '14P' )
insert into Dita values ('9D', '12P', '9P', '14P' )
insert into Dita values ('10D', '1P', '4P', '14P' )
insert into Dita values ('11D', '1P', '9P', '14P' )


create table Dieta(
ID_Dieta varchar(50) primary key,
Dita1 varchar(50) foreign key references Dita,
Dita2 varchar(50) foreign key references Dita,
Dita3 varchar(50) foreign key references Dita,
Dita4 varchar(50) foreign key references Dita,
Dita5 varchar(50) foreign key references Dita,
Dita6 varchar(50) foreign key references Dita,
Dita7 varchar(50) foreign key references Dita
)


insert into Dieta values ('1DI', '1D', '3D', '7D', '4D', '7D','5D','3D' )
insert into Dieta values ('2DI', '2D', '6D', '7D', '1D', '4D','2D','5D' )
insert into Dieta values ('3DI', '2D', '3D', '6D', '2D', '5D','1D','8D' )
insert into Dieta values ('4DI', '2D', '3D', '4D', '7D', '3D','1D','7D' )
insert into Dieta values ('5DI', '7D', '6D', '4D', '7D', '8D','1D','2D' )
insert into Dieta values ('6DI', '1D', '3D', '2D', '6D', '1D','4D','7D' )
insert into Dieta values ('7DI', '2D', '3D', '7D', '6D', '2D','4D','1D' )
insert into Dieta values ('8DI', '7D', '3D', '4D', '7D', '2D','5D','1D' )
insert into Dieta values ('9DI', '2D', '5D', '4D', '7D', '2D','6D','1D' )
insert into Dieta values ('10DI', '2D', '3D', '5D', '7D', '6D','2D','5D' )


create table Takimi(
Klienti varchar(50) foreign key references Anëtari,
Nutricionisti varchar(50) foreign key references Nutricionisti,
Data_Ora datetime,
primary key(Klienti,Nutricionisti)
)

insert into Takimi values ('1A', '1N', '2019-01-05 10:30:00')
insert into Takimi values ('3A', '6N', '2019-02-15 09:00:00')
insert into Takimi values ('4A', '3N', '2019-02-03 13:30:00')
insert into Takimi values ('5A', '4N', '2019-02-27 11:30:00')
insert into Takimi values ('6A', '2N', '2019-04-11 10:00:00')
insert into Takimi values ('7A', '2N', '2019-02-08 09:30:00')
insert into Takimi values ('8A', '1N', '2019-01-09 12:15:00')
insert into Takimi values ('9A', '6N', '2019-03-1 15:30:00')
insert into Takimi values ('10A','3N', '2019-02-04 09:15:00')
insert into Takimi values ('11A','1N', '2019-02-01 10:30:00')



create table Zgjidhja(
Problemi_Shëndetsor varchar(50) foreign key references Problemi_Shëndetsor,
ID_Dieta varchar(50) foreign key references Dieta,
primary key (Problemi_Shëndetsor,ID_Dieta)
)

insert into Zgjidhja VALUES('Obezitet', '1DI')
insert into Zgjidhja VALUES('Obezitet', '6DI')
insert into Zgjidhja VALUES('Diabet', '3DI')
insert into Zgjidhja VALUES('Diabet', '9DI')
insert into Zgjidhja VALUES('Hipertension', '4DI')
insert into Zgjidhja VALUES('Hipertension', '5DI')
insert into Zgjidhja VALUES('Semundje te zemres', '8DI')
insert into Zgjidhja VALUES('Laktoze intoleranca', '10DI')
insert into Zgjidhja VALUES('Demtim i veshkave', '2DI')
insert into Zgjidhja VALUES('Kolesteroli ne gjak', '7DI')

delete from Zgjidhja

create table Receta_Nutri(
Klienti varchar(50) foreign key references Anëtari,
Nutricionisti varchar(50) foreign key references Nutricionisti,
ID_Dieta varchar(50) foreign key references Dieta,
unique (Klienti, Nutricionisti,ID_Dieta)
)

insert into Receta_Nutri values ('1A', '1N', '1DI')
insert into Receta_Nutri values ('3A', '6N', '2DI')
insert into Receta_Nutri values ('4A', '3N', '3DI')
insert into Receta_Nutri values ('5A', '4N', '4DI')
insert into Receta_Nutri values ('6A', '2N', '5DI')
insert into Receta_Nutri values ('7A', '2N', '6DI')
insert into Receta_Nutri values ('8A', '1N', '7DI')
insert into Receta_Nutri values ('9A', '6N', '8DI')
insert into Receta_Nutri values ('10A', '3N', '9DI')
insert into Receta_Nutri values ('11A', '1N', '10DI')


create view Dita1
as(
select distinct Di.ID_Dita, Di.Mëngjesi,Di.Dreka, Di.Darka
from Dieta D, Dita Di
where D.Dita1=Di.ID_Dita 
)
select *
from Dita1















