editing
doneWithEdits
	"If in a SyntaxMorph, shrink min width after editing"
	| _gsSqueakTemp_editor |
	super doneWithEdits.
	(owner respondsTo: #parseNode)
		ifTrue: [minimumWidth := 8].
	_gsSqueakTemp_editor := submorphs
				detect: [:sm | sm isKindOf: StringMorphEditor]
				ifNone: [^ self].
	_gsSqueakTemp_editor delete