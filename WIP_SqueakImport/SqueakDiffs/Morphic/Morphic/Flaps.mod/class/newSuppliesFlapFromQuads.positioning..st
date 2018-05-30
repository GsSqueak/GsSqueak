predefined flaps
newSuppliesFlapFromQuads: quads positioning: positionSymbol
	"Answer a fully-instantiated flap named 'Supplies' to be placed at the bottom of the screen.  Use #center as the positionSymbol to have it centered at the bottom of the screen, or #right to have it placed off near the right edge."

	|  aFlapTab aStrip hPosition |
	(Smalltalk classNamed: 'SugarNavigatorBar') ifNotNil: [:c |
		c showSugarNavigator ifTrue: [
			^ self newSuppliesFlapFromQuads: quads positioning: positionSymbol withPreviousEntries: nil]].
	aStrip := PartsBin newPartsBinWithOrientation: #leftToRight andColor: Color red muchLighter from:	 quads.
	"self twiddleSuppliesButtonsIn: aStrip."
	aFlapTab := FlapTab new referent: aStrip beSticky.
	aFlapTab setName: 'Supplies' translated edge: #bottom color: Color red lighter.
	hPosition := positionSymbol == #center
		ifTrue:
			[(Display width // 2) - (aFlapTab width // 2)]
		ifFalse:
			[Display width - (aFlapTab width + 22)].
	aFlapTab position: (hPosition @ (self currentWorld height - aFlapTab height)).
	aFlapTab setBalloonText: aFlapTab balloonTextForFlapsMenu.

	aStrip extent: self currentWorld width @ 136.
	aStrip beFlap: true.
	aStrip autoLineLayout: true.
	
	^ aFlapTab

"Flaps replaceGlobalFlapwithID: 'Supplies' translated"