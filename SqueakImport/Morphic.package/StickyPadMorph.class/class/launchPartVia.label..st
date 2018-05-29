parts bin
launchPartVia: aSelector label: aString
	"Obtain a morph by sending aSelector to self, and attach it to the morphic hand.  This provides a general protocol for parts bins.  Overridden here so that all instances will be given the name, unlike the prevailing convention for other object types"

	| aMorph |
	aMorph := self perform: aSelector.
	aMorph setNameTo: self defaultNameStemForInstances.  "i.e., circumvent uniqueness in this case"
	aMorph setProperty: #beFullyVisibleAfterDrop toValue: true.
	aMorph openInHand.
	^ aMorph