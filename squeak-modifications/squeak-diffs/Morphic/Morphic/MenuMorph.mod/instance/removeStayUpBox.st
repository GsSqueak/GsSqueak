menu
removeStayUpBox
	| box |
	submorphs isEmpty ifTrue: [^self].
	(submorphs first isAlignmentMorph) ifFalse: [^self].
	box := submorphs first submorphs last.
	(box isKindOf: IconicButton) 
		ifTrue: 
			[box
				labelGraphic: (Form extent: box extent depth: 8);
				shedSelvedge;
				borderWidth: 0;
				lock]