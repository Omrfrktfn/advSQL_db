--$$ fazladan tirnak isretlerinden bizi kurtariri.

-- ********************degisken tanimlama*******************

do $$ --anonim block -> dolar: ozel karakterler oncesinde tirnak icin
declare 
	counter integer := 1;  --counter adinda bir degisken olusturuldu ve default degeri 1 olarak atandi.
	first_name varchar(50) := 'Bahadir';
	last_name varchar(50) := 'Gunuvar';
	payment numeric(4,2) := 20.50; ----parantez icindeki 4 sayinin 4 karakter olmasi gerektigini 2 ise virgulden sonraki karakter sayisini verir
begin
	--raise notice 'Isim: % Soyisim: %' , first_name, last_name;
	raise notice 'Isim: % Soyisim: % odeme %' , first_name, last_name, payment;

end $$; 


/*
	Task 1 : değişkenler oluşturarak ekrana " Ahmet ve Mehmet beyler 120 tl ye bilet aldılar. "
	cümlesini ekrana yazdırınız.
*/

do $$
declare 
	
	first_person varchar(50) := 'Ahmet';
	second_person varchar(50) := 'Mehmet';
	payment numeric(3) := 120;
begin
	
	raise notice '% ve % beyler % TL ye bilet aldilar.' , first_person, second_person, payment;
end $$;



-- *********bekletme komutu*************

do $$
declare
	created_at time := now(); --time--> data type, now() --> olusturuldugu zaman
begin
	raise notice '%', created_at;
	perform pg_sleep(5); --5 saniye bekle
	raise notice '%', created_at;
end $$;

-- ***********tablodan data tipini kopyalama*****************
do $$
declare
	f_title film.tittle%type; --text'i al demek
	
	filmsuresi film.length%type;
	
begin
	--1 id li film ismini getirin
	select tittle from film into f_title where id=1;
	
	raise notice '%', f_title;
	
	select length from film into filmsuresi where id=1;
	
	raise notice '%', filmsuresi;
	
end $$;







