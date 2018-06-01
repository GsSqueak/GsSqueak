construction support
deleteMorphsSatisfying: deleteBlock fromGlobalFlapSatisfying: flapBlock
	"If any global flap satisfies flapBlock, then delete objects satisfying from deleteBlock from it.  Occasionally called from do-its in updates or other fileouts."

	| aFlapTab flapPasteUp |
	aFlapTab := self globalFlapTabsIfAny detect: flapBlock ifNone: [^ self].
	flapPasteUp := aFlapTab referent.
	flapPasteUp submorphs do:
		[:aMorph | (deleteBlock value: aMorph) ifTrue: [aMorph delete]]