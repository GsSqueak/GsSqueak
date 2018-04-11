slots-user
defaultValueOfType: aSymbol 
	"Answer a default value for the given type -- invoked in compiled user
	scripts when a parameter tile of the wrong type is present"
	^ self initialValueForSlotOfType: aSymbol"Not really intended for that purpose but seemingly serves adequately"