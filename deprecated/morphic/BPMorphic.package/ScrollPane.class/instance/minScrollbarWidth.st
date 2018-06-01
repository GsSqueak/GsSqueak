layout
minScrollbarWidth
	"Answer the minimum extent occupied by the receiver..
	It is assumed the if the receiver is sized to its minimum both
	scrollbars will be used (and visible) unless they have been turned off
	explicitly. This makes the behaviour also more predictable."
	^ ((self hScrollBarPolicy == #never
			or: [self isAutoFit])
		ifTrue: [0]
		ifFalse: [hScrollBar minWidth])
		+ ((retractableScrollBar
					or: [self vScrollBarPolicy == #never])
				ifTrue: [0]
				ifFalse: [self scrollBarThickness])