menu support
globalFlapWithIDEnabledString: aFlapID
	"Answer the string to be shown in a menu to represent the status of the givne flap regarding whether it it should be shown in this project."

	| aFlapTab wording |
	aFlapTab := self globalFlapTabWithID: aFlapID.
	wording := aFlapTab ifNotNil: [aFlapTab wording] ifNil: ['(',  aFlapID, ')'].
	^ (Project current isFlapIDEnabled: aFlapID)
		ifTrue:
			['<on>', wording]
		ifFalse:
			['<off>', wording]