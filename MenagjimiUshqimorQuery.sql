use  Menagjimi_UshqimorProve15
go


/*$Dita1 Mengjesi$ 4 tabela*/
select P.EmriP, R.ID_Produkti
from Dita1 D, Pjata P, Receta R
where P.ID_Pjata=D.M�ngjesi and P.ID_Pjata=R.ID_Pjata
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

/*T� dh�nat p�r nutricionist�t q� p�rdoruesi t� ket� mund�sin� t� zgjedh nutricionistin e d�shiruar*/
select N.Emri,N.Mbiemri, N.Adresa, N.Email, N.Tel, N.Kualifikimi
from Nutricionisti N

/*T� dh�nat p�r an�tar�t q� anetari i caktuar t� ket� �asje n� t� dh�nat e tij*/
select *
from An�tari A

/*T� dh�nat personale t� antar�ve*/
select A.Emri, P.Mosha,P.Gjinia,P.Gjat�sia,P.Pesha
from An�tari A, Personale P
where A.ID=P.ID

/*Te gjithe antaret e gjinise mashkullore*/
select A.Emri
from An�tari A join Personale P
on A.ID=P.ID and P.Gjinia='M'

/*Te gjith antaret e gjinise femerore*/
select A.Emri
from An�tari A join Personale P
on A.ID=P.ID and P.Gjinia='F'

/*$Kalorite ideale per gjinine mashkullore$ 2 tabela*/
select A.Emri, (P.Pesha*10+6.25*P.Gjat�sia-5*P.Mosha+5) as [Kalorite ideale]
from An�tari A join Personale P
on A.ID=P.ID and P.Gjinia='M'

/*Kalorite ideale per gjinine femerore*/
select A.Emri, (P.Pesha*10+6.25*P.Gjat�sia-5*P.Mosha-161) as [Kalorite ideale]
from An�tari A join Personale P
on A.ID=P.ID and P.Gjinia='F'

/*Mesatarja e gjatesise se meshkujve*/
select avg(P.Gjat�sia) as [Mesatarja e gjatesise M]
from An�tari A join Personale P
on A.ID=P.ID and P.Gjinia='M'

/*Mesatarja e gjatesise se femrave*/
select avg(P.Gjat�sia) as [Mesatarja e gjatesise M]
from An�tari A join Personale P
on A.ID=P.ID and P.Gjinia='F'

/*Numri i antareve ne cdo qytet me i madh se 1*/
select A.Qyteti, count(A.ID) as [Numri i antareve]
from An�tari A
group by A.Qyteti
having count(A.ID)>1

/*Mosha mesatare e antareve*/
select avg(P.Mosha) as [Mosha mesatare]
from An�tari A join Personale P
on A.ID=P.ID


/*T� gjitha pjatat e ofruara nga sistemi*/
select P.EmriP,P.Koha_Pergaditjes,P.Nr_Persona
from Pjata P
order by P.EmriP

/*Receta p�r pjat�n Makarona me salce domatesh*/
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
where K.ID_Produkti='er�za'


/*Pjata qe permban patate dhe ereza*/

select P.EmriP
from PjataReceta P
where P.ID_Produkti='patate'
intersect
select K.EmriP
from PjataReceta K
where K.ID_Produkti='er�za'

/*Pjata qe permban patate por jo ereza*/
select P.EmriP
from PjataReceta P
where P.ID_Produkti='patate'
except
select K.EmriP
from PjataReceta K
where K.ID_Produkti='er�za'

/*$Gjej kalorite per secilen pjate$ 3 tabela*/

create view Kalori
as
(select D.ID_Pjata, sum( L.Kalori) as [Kalori]
from (select R.ID_Pjata,P.P�rb�r�si
from Receta R, P�rb�r�si P
where R.ID_Produkti=P.P�rb�r�si) as D join L�nd�t_UshqyeseP L
on D.P�rb�r�si=L.P�rb�r�si
group by D.ID_Pjata)


select P.EmriP,K.Kalori
from Kalori K join Pjata P
on K.ID_Pjata=P.ID_Pjata

/*Gjej mesataren e proteinave*/

select D.ID_Pjata, avg( L.Proteina) as [Proteina]
from (select R.ID_Pjata,P.P�rb�r�si
from Receta R, P�rb�r�si P
where R.ID_Produkti=P.P�rb�r�si) as D join L�nd�t_UshqyeseP L
on D.P�rb�r�si=L.P�rb�r�si
group by D.ID_Pjata


/*Gjej numrin e antareve te Prishtines qe kane takimi me nutricionistin */

select count (A.ID) as [Numri i antareve]
from An�tari A join Takimi T
on A.ID=T.Klienti
where A.Qyteti='Prishtin�'
group by A.Qyteti

/* $Gjej numrin e antareve te Prishtines qe kane takim me te njejtin nutricionist$ */

create view NutriTakim
as
(select A.ID, T.Nutricionisti
from An�tari A join Takimi T
on A.ID=T.Klienti
where A.Qyteti='Prishtin�') 

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

select A.Emri, K.Alergjit�, K.Problemi_Sh�ndet�sor
from An�tari A join Kartela_Mjeksore K
on A.ID=K.ID
where K.Alergjit� is not null
intersect
select A.Emri, K.Alergjit�, K.Problemi_Sh�ndet�sor
from An�tari A join Kartela_Mjeksore K
on A.ID=K.ID
where K.Problemi_Sh�ndet�sor is not null

/*Gjej dietat e antareve*/

select R.ID_Dieta, A.Emri
from Receta_Nutri R join An�tari A
on R.Klienti=A.ID

select distinct R.ID_Dieta, A.Emri
from Receta_Nutri R, An�tari A, Kartela_Mjeksore K
where R.Klienti=A.ID and A.ID=K.ID and K.Problemi_Sh�ndet�sor='Hipertension'


/*Gjej dietat e preferueshme per semundje te caktuara*/

select Z.ID_Dieta, Z.Problemi_Sh�ndetsor
from Zgjidhja Z
where Z.Problemi_Sh�ndetsor='Hipertension'