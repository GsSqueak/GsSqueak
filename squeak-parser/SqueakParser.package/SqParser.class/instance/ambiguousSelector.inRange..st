error correction
ambiguousSelector: aString inRange: anInterval 
	| correctedSelector userSelection offset intervalWithOffset |
	self interactive
		ifFalse: ["In non interactive mode, compile with backward
			comapatibility: $- is part of literal argument"
			Transcript cr; store: encoder classEncoding; nextPutAll: #>>; store: encoder selector; show: ' would send ' , token , '-'.
			^ super ambiguousSelector: aString inRange: anInterval].
	"handle the text selection"
	userSelection := cue requestor selectionInterval.
	intervalWithOffset := anInterval first + requestorOffset to: anInterval last + requestorOffset.
	cue requestor selectFrom: intervalWithOffset first to: intervalWithOffset last.
	cue requestor select.
	"Build the menu with alternatives"
	correctedSelector := AmbiguousSelector signalName: aString inRange: intervalWithOffset.
	correctedSelector
		ifNil: [^ self fail].
	"Execute the selected action"
	offset := self
				substituteWord: correctedSelector
				wordInterval: intervalWithOffset
				offset: 0.
	cue requestor deselect.
	cue requestor selectInvisiblyFrom: userSelection first to: userSelection last + offset.
	token := (correctedSelector readStream upTo: Character space) asSymbol