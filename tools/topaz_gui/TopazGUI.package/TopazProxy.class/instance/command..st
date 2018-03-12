process communication
command: aString

	| rawOutput outputLines errorOutput |
	self topazProcess inPipe nextPutAll: aString; lf; lf; flush.
	rawOutput := self topazProcess outPipe reader upToLastLineMatching: 'topaz*> '.
	outputLines := rawOutput lines allButFirstAndLast.
	errorOutput := self topazProcess errPipe reader upToEndOfAvailableData.
	^ outputLines