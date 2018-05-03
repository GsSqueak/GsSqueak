debug printing
shortPrintFramesInPage: thePage
	<inline: false>
	<var: #thePage type: #'StackPage *'>
	self shortPrintFrameAndCallers: thePage headFP