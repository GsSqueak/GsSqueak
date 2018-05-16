tools
allThemeProperties
	"Answer an Array of 3-element Array's.  Each inner Array are the information needed to present a Theme editor tool; the property name, category, and description.
	
	self allThemeProperties"
	
	^ Array streamContents:
		[ : stream | self allThemePropertiesDo: [ : cls : prop | stream nextPut: {cls}, prop ]]