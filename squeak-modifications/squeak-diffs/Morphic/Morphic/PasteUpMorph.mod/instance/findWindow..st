world menu
findWindow: evt
	"Present a menu names of windows and naked morphs, and activate the one that gets chosen.  Collapsed windows appear below line, expand if chosen; naked morphs appear below second line; if any of them has been given an explicit name, that is what's shown, else the class-name of the morph shows; if a naked morph is chosen, bring it to front and have it don a halo."
	| menu expanded collapsed nakedMorphs |
	menu := MenuMorph new.
	expanded := SystemWindow windowsIn: self satisfying: [:w | w isCollapsed not].
	collapsed := SystemWindow windowsIn: self satisfying: [:w | w isCollapsed].
	nakedMorphs := self submorphsSatisfying:
		[:m | (m isSystemWindow not and: [(m isStickySketchMorph) not]) and:
			[(m isFlapTab) not]].
	(expanded isEmpty & (collapsed isEmpty & nakedMorphs isEmpty)) ifTrue: [^ Beeper beep].
	(expanded sort: [:w1 :w2 | w1 label caseInsensitiveLessOrEqual: w2 label]) do:
		[:w | menu add: w label target: w action: #beKeyWindow.
			w model canDiscardEdits ifFalse: [menu lastItem color: Color red]].
	(expanded isEmpty | (collapsed isEmpty & nakedMorphs isEmpty)) ifFalse: [menu addLine].
	(collapsed sort: [:w1 :w2 | w1 label caseInsensitiveLessOrEqual: w2 label]) do: 
		[:w | menu add: w label target: w action: #collapseOrExpand.
		w model canDiscardEdits ifFalse: [menu lastItem color: Color red]].
	nakedMorphs isEmpty ifFalse: [menu addLine].
	(nakedMorphs sort: [:w1 :w2 | w1 nameForFindWindowFeature caseInsensitiveLessOrEqual: w2 nameForFindWindowFeature]) do:
		[:w | menu add: w nameForFindWindowFeature target: w action: #comeToFrontAndAddHalo].
	menu addTitle: 'find window' translated.
	
	menu popUpEvent: evt in: self.