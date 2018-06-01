initialization
addButtons
	| r b w |

	caption ifNotNil: ["Special setup for play-only interface"
		(r := self makeARowForButtons)
			addMorphBack: (SimpleButtonMorph new target: self;
	 							label: caption font: Preferences standardButtonFont; actionSelector: #play);
			addMorphBack: self makeASpacer.
		w := r fullBounds height * 0.5.
		r addMorphBack: (self makeStatusLightIn: (w@w));
			addMorphBack: self makeASpacer.
		^ self addMorphBack: r
	].

	(r := self makeARowForButtons)
		addMorphBack: (b := self buttonFor: {#record. nil. 'Begin recording'});
		addMorphBack: self makeASpacer;
		addMorphBack: (self buttonFor: {#stop. b width. 'Stop recording - you can also use the ESC key to stop it'});
		addMorphBack: self makeASpacer;
		addMorphBack: (self buttonFor: {#play. b width. 'Play current recording'}).
	self addMorphBack: r.

	(r := self makeARowForButtons)
		addMorphBack: (b := self buttonFor: {#writeTape. nil. 'Save current recording on disk'});
		addMorphBack: self makeASpacer;
		addMorphBack: (self buttonFor: {#readTape. b width. 'Get a new recording from disk'}).
	self addMorphBack: r.

	(r := self makeARowForButtons)
		addMorphBack: (b := self buttonFor: {#shrink. nil. 'Make recording shorter by removing unneeded events'});
		addMorphBack: self makeASpacer.
	w := r fullBounds height * 0.5.
	r addMorphBack: (self makeStatusLightIn: (w@w));
		addMorphBack: self makeASpacer;
		addMorphBack: (self buttonFor: {#createPlayButton. b width. 'Make a simple button to play this recording'}).
	self addMorph: r.
	self setStatusLight: #ready.