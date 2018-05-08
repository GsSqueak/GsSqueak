paragraph support
indentationIfBlank: aBlock
	"Answer the number of leading tabs in the receiver.  If there are
	 no visible characters, pass the number of tabs to aBlock and return its value."

	| leadingTabs nonTab nonTabIndex nonSepIndex lineEndIndex |
	nonTab := (CharacterSet with: Character tab) complement.
	nonTabIndex := self indexOfAnyOf: nonTab startingAt: 1.
	nonTabIndex = 0 ifTrue: [
		"Only made of tabs or empty"
		^aBlock value: self size].
	leadingTabs := nonTabIndex - 1.
	nonSepIndex := self indexOfAnyOf: CharacterSet nonSeparators startingAt: 1.
	nonSepIndex = 0 ifTrue: [
		"Only made of separators"
		^aBlock value: leadingTabs].
	lineEndIndex := self indexOfAnyOf: CharacterSet crlf startingAt: 1.
	(lineEndIndex between: 1 and: nonSepIndex) ifTrue: [
		"Only made of separators up to a line end"
		^aBlock value: leadingTabs].
	^leadingTabs
