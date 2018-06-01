accessing
scratchPad
	^ scratchPad ifNil:
		[ scratchPad := TextMorphForEditView new. "we should be able to use TextMorph here; fix later"
		scratchPad
"			on: #keyboardFocusChange send: #removeScratchPad to: self ;"
			on: #mouseLeave send: #removeScratchPad to: self ;
			on: #keyStroke send: #handleScratchPadKey: to: self ;
			margins: (5@0 corner: 5@0);
			backgroundColor: ((UserInterfaceTheme current get: #color for: #NewBalloonMorph) ifNil: [ BalloonMorph balloonColor ]) ;
			setEditView: PluggableTextMorph new ; "dummy"
			autoFit: true ;
			wrapFlag: true ;
			newContents: '--scratch area--' ;
			font: ((UserInterfaceTheme current get: #font for: #PluggableTextMorph) ifNil: [TextStyle defaultFont]);
			textColor: ((UserInterfaceTheme current get: #textColor for: #PluggableTextMorph) ifNil: [Color black]);
			caretColor: ((UserInterfaceTheme current get: #caretColor for: #PluggableTextMorph) ifNil: [Color red]);
			selectionColor: ((UserInterfaceTheme current get: #selectionColor for: #PluggableTextMorph) ifNil: [Color blue muchDarker] ifNotNil: [ : col | col twiceLighter ]); 
			yourself.
		self layoutScratchPad.
		Preferences menuAppearance3d ifTrue: [ scratchPad addDropShadow ].
		scratchPad ]