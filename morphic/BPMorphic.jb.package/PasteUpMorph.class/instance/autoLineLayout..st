options
autoLineLayout: aBoolean 
	"Make the receiver be viewed with auto-line-layout, which means that
	its submorphs will be laid out left-to-right and then top-to-bottom in
	the manner of a word processor, or (if aBoolean is false,) cease
	applying auto-line-layout"
	aBoolean
		ifTrue: [self viewingNormally
				ifTrue: [self saveBoundsOfSubmorphs]].
	aBoolean
		ifTrue: [self layoutPolicy: TableLayout new.
			self layoutInset: 8;
				 cellInset: 4.
			self listDirection: #leftToRight;
				 wrapDirection: #topToBottom]
		ifFalse: [self layoutPolicy: nil.
			self layoutInset: 0;
				 cellInset: 0]