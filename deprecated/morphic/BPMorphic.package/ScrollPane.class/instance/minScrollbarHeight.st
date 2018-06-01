layout
minScrollbarHeight
	"Answer the minimum extent occupied by the receiver..
	It is assumed the if the receiver is sized to its minimum both
	scrollbars will be used (and visible) unless they have been turned off
	explicitly. This makes the behaviour also more predictable."
	^ (self vScrollBarPolicy == #never
		ifTrue: [0]
		ifFalse: [scrollBar minHeight])
		+ (((self hScrollBarPolicy == #never
						or: [retractableScrollBar])
					or: [self isAutoFit])
				ifTrue: [0]
				ifFalse: [self scrollBarThickness])