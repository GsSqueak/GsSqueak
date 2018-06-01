basic control sequence
startUpSegmented: segmentHeight withCaption: captionOrNil at: location allowKeyboard: aBoolean
	"This menu is too big to fit comfortably on the screen.
	Break it up into smaller chunks, and manage the relative indices.
	Inspired by a special-case solution by Reinier van Loon.  The boolean parameter indicates whether the menu should be given keyboard focus (if in morphic)"

"
(PopUpMenu labels: (String streamContents: [:s | 1 to: 100 do: [:i | s print: i; cr]. s skip: -1])
		lines: (5 to: 100 by: 5)) startUpWithCaption: 'Give it a whirl...'.
"
	| nLines nLinesPer allLabels from to subset subLines index |
	frame ifNil: [self computeForm].
	allLabels := labelString lines.
	nLines := allLabels size.
	lineArray ifNil: [lineArray := Array new].
	nLinesPer := segmentHeight // marker height - 3.
	from := 1.
	[to := (from + nLinesPer) min: nLines.
	subset := (allLabels copyFrom: from to: to) asOrderedCollection.
	subset add: (to = nLines ifTrue: ['start over...' translated] ifFalse: ['more...' translated])
		before: subset first.
	subLines := lineArray select: [:n | n >= from] thenCollect: [:n | n - (from-1) + 1].
	subLines := (Array with: 1) , subLines.
	index := (PopUpMenu labels: subset asStringWithCr lines: subLines)
				startUpWithCaption: captionOrNil at: location allowKeyboard: aBoolean.
	index = 1
		ifTrue: [from := to + 1.
				from > nLines ifTrue: [ from := 1 ]]
		ifFalse: [index = 0 ifTrue: [^ 0].
				^ from + index - 2]] repeat