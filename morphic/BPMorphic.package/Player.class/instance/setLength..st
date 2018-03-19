slot getters/setters
setLength: aLength 
	"Set the length of the receiver."
	| _gsSqueakTemp_cost _gsSqueakTemp_lengthToUse |
	self hasCostumeThatIsAWorld
		ifTrue: [^ self].
	(_gsSqueakTemp_cost := self costume) isLineMorph
		ifTrue: [^ _gsSqueakTemp_cost unrotatedLength: aLength].
	_gsSqueakTemp_lengthToUse := _gsSqueakTemp_cost isRenderer
				ifTrue: [aLength / _gsSqueakTemp_cost scaleFactor]
				ifFalse: [aLength].
	_gsSqueakTemp_cost renderedMorph height: _gsSqueakTemp_lengthToUse