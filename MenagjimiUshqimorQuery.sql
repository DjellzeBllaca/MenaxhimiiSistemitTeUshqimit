use  Menagjimi_UshqimorProve15
go


/*$Dita1 Mengjesi$ 4 tabela*/
select P.EmriP, R.ID_Produkti
from Dita1 D, Pjata P, Receta R
where P.ID_Pjata=D.Mëngjesi and P.ID_Pjata=R.ID_Pjata
group by  P.EmriP, D.ID_Dita, R.ID_Produkti

/*Dita1 Dreka*/
select P.EmriP, R.ID_Produkti
from Dita1 D, Pjata P, Receta R
where P.ID_Pjata=D.Dreka and P.ID_Pjata=R.ID_Pjata
group by  P.EmriP, D.ID_Dita, R.ID_Produkti

/*Dita1 Darka*/
select P.EmriP, R.ID_Produkti
from Dita1 D, Pjata P, Receta R
where P.ID_Pjata=D.Darka and P.ID_Pjata=R.ID_Pjata
group by  P.EmriP, D.ID_Dita, R.ID_Produkti

/*Të dhënat për nutricionistët që përdoruesi të ketë mundësinë të zgjedh nutricionistin e dëshiruar*/
select N.Emri,N.Mbiemri, N.Adresa, N.Email, N.Tel, N.Kualifikimi
from Nutricionisti N

/*Të dhënat për anëtarët që anetari i caktuar të ketë çasje në të dhënat e tij*/
select *
from Anëtari A

/*Të dhënat personale të antarëve*/
select A.Emri, P.Mosha,P.Gjinia,P.Gjatësia,P.Pesha
from Anëtari A, Personale P
where A.ID=P.ID

/*Te gjithe antaret e gjinise mashkullore*/
select A.Emri
from Anëtari A join Personale P
on A.ID=P.ID and P.Gjinia='M'

/*Te gjith antaret e gjinise femerore*/
select A.Emri
from Anëtari A join Personale P
on A.ID=P.ID and P.Gjinia='F'

/*$Kalorite ideale per gjinine mashkullore$ 2 tabela*/
select A.Emri, (P.Pesha*10+6.25*P.Gjatësia-5*P.Mosha+5) as [Kalorite ideale]
from Anëtari A join Personale P
on A.ID=P.ID and P.Gjinia='M'

/*Kalorite ideale per gjinine femerore*/
select A.Emri, (P.Pesha*10+6.25*P.Gjatësia-5*P.Mosha-161) as [Kalorite ideale]
from Anëtari A join Personale P
on A.ID=P.ID and P.Gjinia='F'

/*Mesatarja e gjatesise se meshkujve*/
select avg(P.Gjatësia) as [Mesatarja e gjatesise M]
from Anëtari A join Personale P
on A.ID=P.ID and P.Gjinia='M'

/*Mesatarja e gjatesise se femrave*/
select avg(P.Gjatësia) as [Mesatarja e gjatesise M]
from Anëtari A join Personale P
on A.ID=P.ID and P.Gjinia='F'

/*Numri i antareve ne cdo qytet me i madh se 1*/
select A.Qyteti, count(A.ID) as [Numri i antareve]
from Anëtari A
group by A.Qyteti
having count(A.ID)>1

/*Mosha mesatare e antareve*/
select avg(P.Mosha) as [Mosha mesatare]
from Anëtari A join Personale P
on A.ID=P.ID


/*Të gjitha pjatat e ofruara nga sistemi*/
select P.EmriP,P.Koha_Pergaditjes,P.Nr_Persona
from Pjata P
order by P.EmriP

/*Receta për pjatën Makarona me salce domatesh*/
select R.ID_Produkti as Receta
from Pjata P join Receta R
on P.ID_Pjata=R.ID_Pjata and P.EmriP='Makarona me salce domatesh'

/*$Instruksionet per receten e pjates Makarona me salce domatesh$  3 tabela*/

select distinct I.Instruksione
from (Pjata P join Instruksione I
on P.ID_Pjata=I.ID_Pjata)
where P.EmriP='Makarona me salce domatesh'

/*$Pjatat qe pergaditen me se shpejti$ 2 tabela*/
select L.EmriP,K.[Koha e pergaditjes(ne minuta)]
from (select min (P.Koha_Pergaditjes) as [Koha e pergaditjes(ne minuta)]
from Pjata P) as K, Pjata L
where K.[Koha e pergaditjes(ne minuta)] =L.Koha_Pergaditjes

create view PjataInst 
as
(
select P.ID_Pjata,P.EmriP,P.Koha_Pergaditjes,P.Nr_Persona,I.Instruksione
from Pjata P join Instruksione I
on P.ID_Pjata=I.ID_Pjata
)

create view PjataReceta
as
(
select P.ID_Pjata,P.EmriP,P.Koha_Pergaditjes,P.Nr_Persona,R.ID_Produkti,P.Instruksione
from PjataInst P  join Receta R
on P.ID_Pjata=R.ID_Pjata
)

/*$Pjatat qe permbajn patate ose ereza$ query me sets*/
select P.EmriP
from PjataReceta P
where P.ID_Produkti='patate'
union
select K.EmriP
from PjataReceta K
where K.ID_Produkti='erëza'


/*Pjata qe permban patate dhe ereza*/

select P.EmriP
from PjataReceta P
where P.ID_Produkti='patate'
intersect
select K.EmriP
from PjataReceta K
where K.ID_Produkti='erëza'

/*Pjata qe permban patate por jo ereza*/
select P.EmriP
from PjataReceta P
where P.ID_Produkti='patate'
except
select K.EmriP
from PjataReceta K
where K.ID_Produkti='erëza'

/*$Gjej kalorite per secilen pjate$ 3 tabela*/

create view Kalori
as
(select D.ID_Pjata, sum( L.Kalori) as [Kalori]
from (select R.ID_Pjata,P.Përbërësi
from Receta R, Përbërësi P
where R.ID_Produkti=P.Përbërësi) as D join Lëndët_UshqyeseP L
on D.Përbërësi=L.Përbërësi
group by D.ID_Pjata)


select P.EmriP,K.Kalori
from Kalori K join Pjata P
on K.ID_Pjata=P.ID_Pjata

/*Gjej mesataren e proteinave*/

select D.ID_Pjata, avg( L.Proteina) as [Proteina]
from (select R.ID_Pjata,P.Përbërësi
from Receta R, Përbërësi P
where R.ID_Produkti=P.Përbërësi) as D join Lëndët_UshqyeseP L
on D.Përbërësi=L.Përbërësi
group by D.ID_Pjata


/*Gjej numrin e antareve te Prishtines qe kane takimi me nutricionistin */

select count (A.ID) as [Numri i antareve]
from Anëtari A join Takimi T
on A.ID=T.Klienti
where A.Qyteti='Prishtinë'
group by A.Qyteti

/* $Gjej numrin e antareve te Prishtines qe kane takim me te njejtin nutricionist$ */

create view NutriTakim
as
(select A.ID, T.Nutricionisti
from Anëtari A join Takimi T
on A.ID=T.Klienti
where A.Qyteti='Prishtinë') 

create view NutriPacient
as
(select *
from NutriTakim N
where N.Nutricionisti in( 
select K.Nutricionisti 
from NutriTakim K
group by K.Nutricionisti
having count(K.ID)>=2)
)
select count(N.ID) as [Numri i antareve]
from NutriPacient N

/* $Gjej emrin e nutricionistit i cili i ka dy pacient te Prishtines$ */

select distinct Nu.Emri, Nu.Mbiemri
from NutriPacient N join Nutricionisti Nu
on N.Nutricionisti=Nu.ID_Nutri

/* Gjej numrin total te pacienteve qe kane pasur takim me nutricistin Robert */

select count (T.Klienti) as [Numri i klienteve] 
from Takimi T join Nutricionisti N
on T.Nutricionisti=N.ID_Nutri
where N.Emri='Robert'

/*$Gjeje antaret qe kane alergji dhe semundje$*/

select A.Emri, K.Alergjitë, K.Problemi_Shëndetësor
from Anëtari A join Kartela_Mjeksore K
on A.ID=K.ID
where K.Alergjitë is not null
intersect
select A.Emri, K.Alergjitë, K.Problemi_Shëndetësor
from Anëtari A join Kartela_Mjeksore K
on A.ID=K.ID
where K.Problemi_Shëndetësor is not null

/*Gjej dietat e antareve*/

select R.ID_Dieta, A.Emri
from Receta_Nutri R join Anëtari A
on R.Klienti=A.ID

select distinct R.ID_Dieta, A.Emri
from Receta_Nutri R, Anëtari A, Kartela_Mjeksore K
where R.Klienti=A.ID and A.ID=K.ID and K.Problemi_Shëndetësor='Hipertension'


/*Gjej dietat e preferueshme per semundje te caktuara*/

select Z.ID_Dieta, Z.Problemi_Shëndetsor
from Zgjidhja Z
where Z.Problemi_Shëndetsor='Hipertension'