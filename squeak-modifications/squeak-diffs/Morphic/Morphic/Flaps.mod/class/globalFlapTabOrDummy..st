shared flaps
globalFlapTabOrDummy: aName
	"Answer a global flap tab in the current image with the given name.  If none is found, answer a dummy StringMorph for some reason (check with tk about the use of this)"

	| gg |
	(gg := self globalFlapTab: aName) ifNil:
		[^ StringMorph contents: aName, ' can''t be found'].
	^ gg