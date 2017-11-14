as yet unclassified
createFor: anUser with: item

	^ DrinklistTransaction new 
							user: anUser;
							item: item;
							yourself 