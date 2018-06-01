class initialization
initializeAuthors
	"self initializeAuthors"
	
	| s currentName currentAbbrv |
	Authors := Dictionary new.
	s := self privateAuthorsRaw readStream.
	
	[s atEnd] whileFalse: [
		"Read author name"
		currentName := String streamContents: [:as |
			[s peek ~= $#] whileTrue: [as nextPut: s next]].
		Authors at: currentName put: Set new.
		"Read abbreviations"
		s next. "skip $#"
		currentAbbrv := ''.
		[s atEnd not and: [s peek ~= $!]] whileTrue: [
			s peek = $# ifTrue: [
				(Authors at: currentName) add: currentAbbrv.
				currentAbbrv := ''.
				s next. "skip $#"].
			currentAbbrv := currentAbbrv, s next asString. "slow..."
			].
		currentAbbrv ifNotEmpty: [(Authors at: currentName) add: currentAbbrv].
		s next. "skip $!"
	].

	"Fill inverted index for authors."
	AuthorsInverted := Dictionary new.
	Authors keysAndValuesDo: [:fullName :abbreviations |
		abbreviations do: [:abbrv |
			(AuthorsInverted
				at: abbrv asLowercase
				ifAbsentPut: [Set new]) add: fullName]].