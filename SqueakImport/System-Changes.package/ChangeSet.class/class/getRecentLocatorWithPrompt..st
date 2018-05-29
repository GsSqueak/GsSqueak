scanning
getRecentLocatorWithPrompt: aPrompt
	"Prompt with a menu of how far back to go.  Return nil if user backs out.  Otherwise return the number of characters back from the end of the .changes file the user wishes to include"
	 "ChangeList getRecentPosition"
	| end changesFile banners positions pos chunk i |
	changesFile := (SourceFiles at: 2) readOnlyCopy.
	banners := OrderedCollection new.
	positions := OrderedCollection new.
	end := changesFile size.
	pos := Smalltalk lastQuitLogPosition.
	[pos = 0 or: [banners size > 20]] whileFalse:
		[changesFile position: pos.
		chunk := changesFile nextChunk.
		i := chunk indexOfSubCollection: 'priorSource: ' startingAt: 1.
		i > 0 ifTrue: [positions addLast: pos.
					banners addLast: (chunk copyFrom: 5 to: i-2).
					pos := Number readFrom: (chunk copyFrom: i+13 to: chunk size)]
			ifFalse: [pos := 0]].
	changesFile close.
	pos := UIManager default chooseFrom: banners values: positions title: aPrompt.
	pos == nil ifTrue: [^ nil].
	^ end - pos