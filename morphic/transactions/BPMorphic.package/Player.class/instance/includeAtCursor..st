scripts-standard
includeAtCursor: aPlayer 
	"Add aPlayer to the list of objects logically 'within' me, at my current
	cursor position. ."
	| _gsSqueakTemp_aCostume |
	(aPlayer isNil
			or: [aPlayer == self])
		ifTrue: [^ self].
	(aPlayer isText
			or: [aPlayer isString])
		ifTrue: [^ self costume class == TextFieldMorph
				ifTrue: [self costume append: aPlayer]
				ifFalse: [self]].
	_gsSqueakTemp_aCostume := self costume topRendererOrSelf.
	aPlayer costume goHome.
	"assure it's in view"
	(_gsSqueakTemp_aCostume isKindOf: PasteUpMorph)
		ifTrue: [_gsSqueakTemp_aCostume addMorph: aPlayer costume asElementNumber: self getCursor.
			_gsSqueakTemp_aCostume invalidRect: _gsSqueakTemp_aCostume bounds]
		ifFalse: [_gsSqueakTemp_aCostume addMorphBack: aPlayer.
			self setCursor: _gsSqueakTemp_aCostume submorphs size]