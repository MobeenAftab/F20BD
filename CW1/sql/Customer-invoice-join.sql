-- This script will join customer, invoice and invoiceline into one table
SELECT
    `customer`.`CustomerId`,
	`customer`.`FirstName`,
    `customer`.`LastName`,
    `customer`.`Company`,
    `customer`.`Address`,
    `customer`.`City`,
    `customer`.`State`,
    `customer`.`Country`,
    `customer`.`PostalCode`,
    `customer`.`Phone`,
    `customer`.`Fax`,
    `customer`.`Email`,
    `customer`.`SupportRepId`,
	#`invoice`.`CustomerId`,
    `invoice`.`InvoiceDate`,
    `invoice`.`BillingAddress`,
    `invoice`.`BillingCity`,
    `invoice`.`BillingState`,
    `invoice`.`BillingCountry`,
    `invoice`.`BillingPostalCode`,
    `invoice`.`Total`,
    #`invoiceline`.`InvoiceLineId`,
    #`invoiceline`.`InvoiceId`,
    `invoiceline`.`TrackId`,
    `invoiceline`.`UnitPrice`,
    `invoiceline`.`Quantity`
from customer
left join invoice on invoice.CustomerId=customer.CustomerId
left join invoiceline on invoiceline.InvoiceId=invoice.InvoiceId
where customer.CustomerId=1
order by customer.CustomerId;