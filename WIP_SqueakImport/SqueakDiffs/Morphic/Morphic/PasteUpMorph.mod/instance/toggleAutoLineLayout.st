options
toggleAutoLineLayout
	"Toggle the auto-line-layout setting"

	self autoLineLayout: self autoLineLayout not.
	self autoLineLayout ifFalse: [self restoreBoundsOfSubmorphs].