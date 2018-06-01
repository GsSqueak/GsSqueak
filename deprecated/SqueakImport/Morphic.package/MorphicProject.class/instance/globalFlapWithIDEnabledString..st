flaps support
globalFlapWithIDEnabledString: aFlapID
	"Answer the string to be shown in a menu to represent the status of the given flap regarding whether it it should be shown in this project."

	| aFlapTab |
	aFlapTab := Flaps globalFlapTabWithID: aFlapID.
	^ (self isFlapEnabled: aFlapTab)
		ifTrue:
			['<on>', aFlapTab wording]
		ifFalse:
			['<off>', aFlapTab wording]