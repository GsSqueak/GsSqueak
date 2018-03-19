initialization
initializeLabelArea
	"Initialize the label area (titlebar) for the window."
	labelString
		ifNil: [labelString := 'Untitled Window'].
	label := StringMorph new contents: labelString.
	"Add collapse box so #labelHeight will work"
	collapseBox := self createCollapseBox.
	stripes := Array
				with: (RectangleMorph newBounds: bounds)
				with: (RectangleMorph newBounds: bounds).
	"see extent:"
	self addLabelArea.
	self setLabelWidgetAllowance.
	self addCloseBox.
	self class moveMenuButtonRight
		ifTrue: [self addLabel.
			self addMenuControl]
		ifFalse: [self addMenuControl.
			self addLabel].
	self addExpandBox.
	labelArea addMorphBack: collapseBox.
	self setFramesForLabelArea.
	Preferences noviceMode
		ifTrue: [closeBox
				ifNotNil: [closeBox setBalloonText: 'close window'].
			menuBox
				ifNotNil: [menuBox setBalloonText: 'window menu'].
			collapseBox
				ifNotNil: [collapseBox setBalloonText: 'collapse/expand window']]