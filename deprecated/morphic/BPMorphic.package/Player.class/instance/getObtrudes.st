scripts-standard
getObtrudes
	"Answer whether the receiver's costume obtrudes beyond the bounds
	of its container"
	| _gsSqueakTemp_aCostume |
	(_gsSqueakTemp_aCostume := self costume)
		ifNil: [^ false].
	^ _gsSqueakTemp_aCostume obtrudesBeyondContainer