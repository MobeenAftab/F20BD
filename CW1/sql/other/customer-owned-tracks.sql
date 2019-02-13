select customer.CustomerId, customer.FirstName, track.Name  from customer
left join invoice on invoice.CustomerId=customer.CustomerId
left join invoiceline on invoiceline.InvoiceId=invoice.InvoiceId
left join track on track.TrackId= invoiceline.TrackId
where customer.CustomerId=1 ;
