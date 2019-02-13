select *, sum(UnitPrice) as TotalUnit
from customer 
left join invoice on invoice.CustomerId=customer.CustomerId
left join invoiceline on invoiceline.InvoiceId=invoice.InvoiceId
where customer.CustomerId=1;