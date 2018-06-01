scripts-standard
append: aPlayer 
	"Add aPlayer to the list of objects logically 'within' me. This is visually
	represented by its morph becoming my costume's last submorph.
	Also allow text to be appended."
	| _gsSqueakTemp_aCostume |
	(aPlayer isNil
			or: [aPlayer == self])
		ifTrue: [^ self].
	(aPlayer isText
			or: [aPlayer isString])
		ifTrue: [self costume class == TextFieldMorph
				ifTrue: [^ self costume append: aPlayer]
				ifFalse: [^ self]].
	(_gsSqueakTemp_aCostume := self costume topRendererOrSelf) addMorphNearBack: aPlayer costume.
	aPlayer costume goHome.
	"assure it's in view"
	(_gsSqueakTemp_aCostume isKindOf: PasteUpMorph)
		ifTrue: [self
				setCursor: (_gsSqueakTemp_aCostume submorphs indexOf: aPlayer costume)]