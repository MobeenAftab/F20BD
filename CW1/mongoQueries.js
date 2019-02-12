// Get the employee associated with a customer using left outer join
/*
db.getCollection("customers").aggregate({
	$lookup: {
		from: 'employees',
		localField: 'SupportRepId',
		foreignField: 'EmployeeId',
		as: 'SupportEmployee'
	}
})
*/

// Get the total ammount each CustomerId has spent on the web application
db.getCollection("customers").aggregate(
	{
		$group: {
			_id: '$CustomerId',
			TotalBill: { $sum: '$Total'}
		}
	},
	{ $sort: { TotalBill: 1 } }
)

