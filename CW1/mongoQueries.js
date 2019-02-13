// Get the employee associated with a customer using left outer join

db.getCollection("customers").aggregate({
	$lookup: {
		from: 'employees',
		localField: 'SupportRepId',
		foreignField: 'EmployeeId',
		as: 'SupportEmployee'
	}
}).pretty()


// Get the total ammount each CustomerId has spent on the web application
db.getCollection("customers").aggregate({
	$group: {
		_id: '$CustomerId',
		TotalBill: {
			$sum: '$Total'
		}
	}
}, {
	$sort: {
		_id: 1
	}
})

db.getCollection("customers").aggregate([{
		$lookup: {
			from: 'tracks',
			localField: 'TrackId',
			foreignField: 'TrackId',
			as: 'NewTrack'
		}
	},
	{
		$replaceRoot: {
			newRoot: {
				$mergeObjects: [{
					$arrayElemAt: ['$NewTrack', 0]
				}, '$$ROOT']
			}
		}
	},
	{
		$project: {
			NewTrack: 0
		}
	}
])