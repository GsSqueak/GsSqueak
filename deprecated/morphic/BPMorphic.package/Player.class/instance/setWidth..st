slot getters/setters
setWidth: aWidth 
	"Set the width"
	| _gsSqueakTemp_cost _gsSqueakTemp_widthToUse |
	self hasCostumeThatIsAWorld
		ifTrue: [^ self].
	(_gsSqueakTemp_cost := self costume) isLineMorph
		ifTrue: [^ _gsSqueakTemp_cost unrotatedWidth: aWidth].
	_gsSqueakTemp_widthToUse := _gsSqueakTemp_cost isRenderer
				ifTrue: [aWidth / _gsSqueakTemp_cost scaleFactor]
				ifFalse: [aWidth].
	_gsSqueakTemp_cost renderedMorph width: _gsSqueakTemp_widthToUse