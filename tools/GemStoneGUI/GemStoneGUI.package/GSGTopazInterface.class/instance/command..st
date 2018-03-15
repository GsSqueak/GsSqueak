process communication
command: aString

	| rawOutput output errorOutput |
	self topazProcess inPipe nextPutAll: aString; lf; lf; flush.
	rawOutput := self topazProcess outPipe reader upToLastLineMatching: '*topaz*> '.
	output := rawOutput lines allButFirstAndLast joinSeparatedBy: Character lf.
	errorOutput := self topazProcess errPipe reader upToEndOfAvailableData.
	^ Array with: output with: errorOutput