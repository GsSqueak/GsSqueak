initialization
initialize

	super initialize.
	
	self setDefaultParameters.
	
	textMorph := TextMorph new
		wrapFlag: false;
		lock;
		yourself.
	
	self addMorph: textMorph.