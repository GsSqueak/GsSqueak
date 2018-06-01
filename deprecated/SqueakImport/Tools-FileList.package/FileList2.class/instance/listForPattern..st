volume list and pattern
listForPattern: pat
	"Make the list be those file names which match the pattern."

	| sizePad newList entries |
	directory ifNil: [^#()].
	entries := (Preferences eToyLoginEnabled
		and: [Utilities authorNamePerSe notNil])
		ifTrue: [directory matchingEntries: {'submittedBy: ' , Utilities authorName.} ]
		ifFalse: [directory entries].
	(fileSelectionBlock isKindOf: MessageSend) ifTrue: [
		fileSelectionBlock arguments: {entries}.
		newList := fileSelectionBlock value.
		fileSelectionBlock arguments: #().
	] ifFalse: [
		newList := entries select: [:entry | fileSelectionBlock value: entry value: pat].
	].
	newList := newList asArray sort: self sortBlock.
	sizePad := (newList inject: 0 into: [:mx :entry | mx max: entry fileSize])
					asStringWithCommas size - 1.
	^newList collect: [ :e | self fileNameFormattedFrom: e sizePad: sizePad ]