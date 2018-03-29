debug printing
printFramesInPage: thePage 
	"use export: not api, so it won't be written to cointerp.h. cogit.c is
	unaware of StackPage"
	self
		printFrameAndCallers: thePage headFP
		SP: thePage headSP
		short: false