e-toy support
decimalPlacesForGetter: aGetter
	"Answer the decimal places I prefer for showing a slot with the given getter, or nil if none"

	| decimalPrefs |
	decimalPrefs := self renderedMorph valueOfProperty: #decimalPlacePreferences ifAbsent: [^ nil].
	^ decimalPrefs at: aGetter ifAbsent: [nil]