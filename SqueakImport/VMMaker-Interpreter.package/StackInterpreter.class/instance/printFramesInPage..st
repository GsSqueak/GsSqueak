debug printing
printFramesInPage: thePage
	<inline: false>
	<var: #thePage type: #'StackPage *'>
	self printFrameAndCallers: thePage headFP SP: thePage headSP