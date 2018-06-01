ui creation
createSystemWindowCaptionPane
	"Create a morph to hold the caption string. The caption is created in setCaption:"

	captionPane := AlignmentMorph new.
	captionPane
		color: Color transparent;
		layoutPolicy: ProportionalLayout new.
	"You can change the caption later by calling setCaption:"
	self setCaption: 'Please select a file' translated.
	^captionPane