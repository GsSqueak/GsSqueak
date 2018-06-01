scripts-execution
stopProgramatically
	"stop running my ticking scripts -- called from running code"
	self
		instantiatedUserScriptsDo: [:aUserScript | aUserScript stopTicking].
	(costume renderedMorph isKindOf: SpeakerMorph)
		ifTrue: [costume renderedMorph stopSound]