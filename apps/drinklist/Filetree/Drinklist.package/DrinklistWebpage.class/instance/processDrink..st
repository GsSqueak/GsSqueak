communication
processDrink: drinkID

	self core buy: drinkID by: self user.

	self inform: 'Thank you for your purchase of ', drinkID asString , '!'.