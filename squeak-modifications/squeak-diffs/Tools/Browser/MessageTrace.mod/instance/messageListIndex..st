actions
messageListIndex: anInteger
	autoSelectStrings notEmpty ifTrue: 
		[ autoSelectString :=
			anInteger = 0
				ifTrue: [ '' ]
				ifFalse:
					[ messageListIndex := anInteger.  "setting the window label, below, can't wait for this.."
					self containingWindow setLabel: (self windowLabelAt: anInteger).
					(autoSelectStrings at: anInteger) ifNotNil: [ : fullSelector | fullSelector keywords first ] ] ].
	anInteger > 0 ifTrue:
		[ self
			messageAt: anInteger
			beSelected: true ].
	super messageListIndex: anInteger
