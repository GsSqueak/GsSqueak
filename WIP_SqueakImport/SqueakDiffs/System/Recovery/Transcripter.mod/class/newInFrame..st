instance creation
newInFrame: frame
"
(Transcripter newInFrame: (0@0 extent: 100@200))
	nextPutAll: 'Hello there'; endEntry;
	cr; print: 355.0/113; endEntry;
	readEvalPrint.
"
	| transcript |
	transcript := self on: (String new: 100).
	transcript initInFrame: frame.
	^ transcript clear