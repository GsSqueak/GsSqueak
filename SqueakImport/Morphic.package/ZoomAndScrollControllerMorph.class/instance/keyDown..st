event handling
keyDown: anEvent

	changeKeysState ifNotNil: [
		upDownCodes at: anEvent keyValue put: changeKeysState first.
		changeKeysState := changeKeysState allButFirst.
		changeKeysState isEmpty ifTrue: [changeKeysState := nil].
		currentKeyDown := Set new.
		^self changed
	].
	currentKeyDown add: anEvent keyValue.
