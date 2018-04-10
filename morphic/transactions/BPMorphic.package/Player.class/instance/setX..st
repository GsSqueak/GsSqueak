slot getters/setters
setX: val 
	"Set the x coordinate as indicated"
	| _gsSqueakTemp_aCostume |
	(_gsSqueakTemp_aCostume := self costume) isInWorld
		ifFalse: [^ self].
	_gsSqueakTemp_aCostume isWorldOrHandMorph
		ifTrue: [^ self].
	_gsSqueakTemp_aCostume owner isHandMorph
		ifTrue: [^ self].
	^ _gsSqueakTemp_aCostume x: val