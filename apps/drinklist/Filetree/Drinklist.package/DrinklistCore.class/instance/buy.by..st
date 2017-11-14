accessing
buy: aDrinkLabel by: anUserName
	
	|anUser aDrink transaction|
	
	anUser := self userNamed: anUserName.
	aDrink := self drinkNamed: aDrinkLabel.
	
	(anUser isNil or: aDrink isNil) ifTrue:[^false].
	
	anUser takeDrink: aDrink.
	
	transaction := DrinklistTransaction createFor: anUserName with: aDrink.
	self addTransaction: transaction.
	
	^true