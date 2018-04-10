initialization
replaceBoxes
	"Rebuild the various boxes."
	self setLabelWidgetAllowance.
	label
		ifNotNil: [label delete].
	labelArea
		ifNotNil: [labelArea delete].
	self initializeLabelArea.
	self setFramesForLabelArea.
	self setWindowColor: self paneColor.
	self isActive
		ifTrue: [self passivate; activate]
		ifFalse: [self activate; passivate]