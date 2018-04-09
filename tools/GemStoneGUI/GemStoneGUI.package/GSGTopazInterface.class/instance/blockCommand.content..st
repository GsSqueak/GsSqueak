process communication
blockCommand: command content: content

	| rawOutput output errorOutput |
	self topazProcess inPipe 
		nextPutAll: command; lf;
		nextPutAll: content; lf;
		nextPut: $%; lf; lf; flush.
	rawOutput := self topazProcess outPipe reader upToLastLineMatching: '*topaz*> '.
	output := (rawOutput lines allButFirstAndLast allAfter: '%') joinSeparatedBy: Character lf.
	errorOutput := self topazProcess errPipe reader upToEndOfAvailableData.
	^ Array with: output with: errorOutput