menus
changeBorderColor: evt
	| aHand |
	aHand := evt ifNotNil: [evt hand] ifNil: [self primaryHand].
	self changeColorTarget: self selector: #borderColor: originalColor: self borderColor hand: aHand.