--1)film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama 
-- film uzunluğundan fazla kaç tane film vardır?

Select * From film 
where length> (Select AVG(length) From film);

--2)film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

Select * From film 
where rental_rate=(Select MAX(rental_rate) From film);

--3)film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri 
-- sıralayınız.

Select * From film 
where rental_rate=(Select MIN(rental_rate) From film)
and replacement_cost=(Select MIN(replacement_cost) From film);


--4)payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

Select first_name,last_name,SUM(amount) from customer
JOIN payment on payment.customer_id=customer.customer_id
Group By first_name,last_name
ORDER BY SUM(amount) DESC;
