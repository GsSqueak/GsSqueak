construction support
deleteMorphsSatisfying: deleteBlock fromGlobalFlapSatisfying: flapBlock 
	"If any global flap satisfies flapBlock, then delete objects satisfying from
	deleteBlock from it. Occasionally called from do-its in updates or other
	fileouts. "
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_flapPasteUp |
	_gsSqueakTemp_aFlapTab := self globalFlapTabsIfAny
				detect: flapBlock
				ifNone: [^ self].
	_gsSqueakTemp_flapPasteUp := _gsSqueakTemp_aFlapTab referent.
	_gsSqueakTemp_flapPasteUp submorphs
		do: [:aMorph | (deleteBlock value: aMorph)
				ifTrue: [aMorph delete]]