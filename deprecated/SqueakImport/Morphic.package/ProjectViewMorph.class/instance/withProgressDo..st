events
withProgressDo: aBlock

	ComplexProgressIndicator new 
		targetMorph: self;
		historyCategory: 'project loading';
		withProgressDo: aBlock
