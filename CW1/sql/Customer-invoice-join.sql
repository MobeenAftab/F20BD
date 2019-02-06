select * 
from customer
left join invoice on invoice.CustomerId=customer.CustomerId
left join invoiceline on invoiceline.InvoiceLineId = invoice.InvoiceId
order by customer.CustomerId;
# Can combine list of employees in here
