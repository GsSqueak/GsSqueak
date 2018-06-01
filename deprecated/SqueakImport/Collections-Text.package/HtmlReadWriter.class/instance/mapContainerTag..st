mapping
mapContainerTag: aTag

	| result styleStart styleEnd styleAttributes |
	result := OrderedCollection new.
	styleStart := (aTag findString: 'style="' ) + 7.
	styleStart <= 7 ifTrue: [^#()].
	styleEnd := (aTag findString: '"' startingAt: styleStart) - 1.
	styleAttributes := (aTag copyFrom: styleStart to: styleEnd) subStrings: ';'.
	styleAttributes do: [:ea | |keyValue key value|
		keyValue := (ea subStrings: ':') collect: [:s | s withBlanksTrimmed].
		key := keyValue first asLowercase.
		value := keyValue second.
		keyValue size = 2 ifTrue: [
			key = 'color' ifTrue: [result add: (TextColor color: (Color fromString: value))].
			(key beginsWith: 'font') ifTrue: [
				(value includesSubstring: 'bold')
					ifTrue: [result add: TextEmphasis bold].
				(value includesSubstring: 'italic')
					ifTrue: [result add: TextEmphasis italic]]]].
	^ result