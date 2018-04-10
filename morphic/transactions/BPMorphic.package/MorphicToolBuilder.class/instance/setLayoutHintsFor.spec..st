private
setLayoutHintsFor: widget spec: aSpec 
	aSpec minimumWidth >= 0
		ifTrue: [widget minimumWidth: aSpec minimumWidth].
	aSpec minimumHeight >= 0
		ifTrue: [widget minimumHeight: aSpec minimumHeight].
	aSpec padding
		ifNotNil: [:p | widget layoutInset: p].
	"aSpec margin
	ifNotNil: [:m | widget layoutOutset: m]."
	widget
		hResizing: (aSpec horizontalResizing
				ifNil: [#spaceFill]).
	widget
		vResizing: (aSpec verticalResizing
				ifNil: [#spaceFill])