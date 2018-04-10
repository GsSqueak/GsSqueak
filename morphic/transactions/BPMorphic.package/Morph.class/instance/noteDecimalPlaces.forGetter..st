e-toy support
noteDecimalPlaces: aNumber forGetter: aGetter 
	"Make a mental note of the user's preference for a particular number of
	decimal places to be associated with the slot with the given getter"
	(self renderedMorph
		valueOfProperty: #decimalPlacePreferences
		ifAbsentPut: [IdentityDictionary new])
		at: aGetter
		put: aNumber