other
orderedCrayonColors
	"self orderedCrayonColors explore."
	
	^ OrderedDictionary newFrom: (self orderedCrayonColorNames collect: [:ea | ea -> (self perform: ea)])