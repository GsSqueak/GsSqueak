target access
readFromTarget
	"Update my readout from my target"

	| v ret places |
	(target isNil or: [getSelector isNil]) ifTrue: [^contents].
	ret := self checkTarget.
	ret ifFalse: [^ '0'].
	((target isMorph) or:[target isPlayerLike]) ifTrue:[
	places := target decimalPlacesForGetter: getSelector.
	(places ~= nil and: [ places ~= (self valueOfProperty: #decimalPlaces ifAbsent: [0])])  ifTrue: [ self decimalPlaces: places ]].
	v := target perform: getSelector.	"scriptPerformer"
	(v isKindOf: Text) ifTrue: [v := v asString].
	^self acceptValueFromTarget: v