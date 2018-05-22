ui creation
createDialogBoxCaptionPane
	"Create a morph to hold the caption string. The caption is created in setCaption:"

	| icon frame |
	captionPane := AlignmentMorph new.
	captionPane
		color: Color transparent;
		layoutPolicy: ProportionalLayout new.

	"You can change the caption later by calling setCaption:"
	self setCaption: 'Please select a file' translated.
	self setCaptionFont: Preferences windowTitleFont.
	icon := SketchMorph new.
	icon form: MenuIcons openIcon.
	captionPane addMorph: icon.
	frame := LayoutFrame new.
	frame
		leftFraction: 0;
		topFraction: 0.5;
		leftOffset: icon form width // 2;
		topOffset: (icon form width // 2) negated.
	icon layoutFrame: frame.
	^captionPane