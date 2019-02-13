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

// https://www.mongodb.com/blog/post/joins-and-other-aggregation-enhancements-coming-in-mongodb-3-2-part-2-of-3-worked-examples
// Need to work on this
/** Trying to find out what tracks each customer owns by joining TrackId which is in both customers and tracks collection */
db.getCollection("customers").aggregate([{
		$lookup: {
			from: 'tracks',
			localField: 'TrackId',
			foreignField: 'TrackId',
			as: 'TracksOwned'
		}
	},
	// {
	// 	$replaceRoot: {
	// 		newRoot: {
	// 			$mergeObjects: [{
	// 				$arrayElemAt: ["$TracksOwned", 0]
	// 			}, "$$ROOT"]
	// 		}
	// 	}
	// },
	// {
	// 	// $project: {
	// 	// 	TracksOwned: 0
	// 	// }
	// }
]).pretty()


db.customers.aggregate([{
	$lookup: {
		from: "tracks",
		pipeline: [{
				$match: {
					CustomerId: 1
				}
			},
			{
				$project: {
					// _id: 0,
					Tracks: {
						name: "$Name",
					}
				}
			},
			{
				$replaceRoot: {
					newRoot: "$Name"
				}
			}
		],
		as: "Tracks"
	}
}])

