menu support
enableEToyFlaps
	"Start using global flaps, plug-in version, given that they were not
	present. "
	Cursor wait
		showWhile: [self addAndEnableEToyFlaps.
			self enableGlobalFlaps]