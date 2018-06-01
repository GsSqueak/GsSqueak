*Morphic-MorphicExtras-instance creation
supplementaryPartsDescriptions
	"Answer a list of DescriptionForPartsBin objects that characterize objects that this class wishes to contribute to Stationery bins *other* than by the standard default #newStandAlone protocol"

	^ {DescriptionForPartsBin
		formalName: 'Arrow' translatedNoop
		categoryList: {'Graphics' translatedNoop}
		documentation: 'A line with an arrowhead.  Shift-click to get handles and move the ends.' translatedNoop
		globalReceiverSymbol: #PolygonMorph
		nativitySelector: #arrowPrototype.
	DescriptionForPartsBin
		formalName: 'Triangle' translatedNoop
		categoryList: {'Graphics' translatedNoop}
		documentation: 'A three-sided polygon.' translatedNoop
		globalReceiverSymbol: #PolygonMorph
		nativitySelector: #trianglePrototype.

		DescriptionForPartsBin
		formalName: 'Curve' translatedNoop
		categoryList: {'Graphics' translatedNoop.  'Basic' translatedNoop}
		documentation: 'A smooth wiggly curve, or a curved solid.  Shift-click to get handles and move the points.  Using the halo menu, can be coverted into a polygon, and can be made "open" rather than closed.' translatedNoop
		globalReceiverSymbol: #PolygonMorph
		nativitySelector: #curvePrototype.
 }

	
