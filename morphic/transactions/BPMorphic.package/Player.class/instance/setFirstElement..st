slot getters/setters
setFirstElement: aPlayer 
	"Caution - this is a replacement operation! Replace the receiver's
	costume's first element with the morph represented by aPlayer"
	| _gsSqueakTemp_aCostume |
	(aPlayer == self
			or: [(_gsSqueakTemp_aCostume := self costume) submorphs isEmpty])
		ifTrue: [^ self].
	costume replaceSubmorph: _gsSqueakTemp_aCostume submorphs first by: aPlayer costume