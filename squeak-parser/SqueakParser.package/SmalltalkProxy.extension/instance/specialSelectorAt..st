*SqueakParser-Dependencies
specialSelectorAt: anInteger 
	"Answer the special message selector from the interleaved specialSelectors array."

	^ self specialSelectors at: anInteger * 2 - 1