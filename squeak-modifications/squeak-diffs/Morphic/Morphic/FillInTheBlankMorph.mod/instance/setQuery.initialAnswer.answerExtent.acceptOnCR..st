initialization
setQuery: queryString initialAnswer: initialAnswer answerExtent: answerExtent acceptOnCR: acceptBoolean 
	
	| text |
	
	result := initialAnswer.
	done := false.

	self paneMorph removeAllMorphs.

	self title: 'Input Requested' translated.
	self message: queryString.
	
	text := self createTextPaneAcceptOnCR: acceptBoolean.
	self paneMorph addMorphBack: text.

	self paneMorph
		wantsPaneSplitters: true;
		addCornerGrips.
	self paneMorph grips do: [:ea | ea drawCornerResizeHandles: true].
		
	self paneMorph extent: ((initialAnswer asText asMorph extent + (20@10) max: answerExtent) min: 500@500).	
	self setDefaultParameters.