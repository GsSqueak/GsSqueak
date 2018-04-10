menu support
globalFlapWithIDEnabledString: aFlapID 
	"Answer the string to be shown in a menu to represent the status of
	the givne flap regarding whether it it should be shown in this project."
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_wording |
	_gsSqueakTemp_aFlapTab := self globalFlapTabWithID: aFlapID.
	_gsSqueakTemp_wording := _gsSqueakTemp_aFlapTab
				ifNil: ['(' , aFlapID , ')']
				ifNotNil: [_gsSqueakTemp_aFlapTab wording].
	^ (Project current isFlapIDEnabled: aFlapID)
		ifTrue: ['<on>' , _gsSqueakTemp_wording]
		ifFalse: ['<off>' , _gsSqueakTemp_wording]