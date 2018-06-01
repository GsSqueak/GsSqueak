volume list and pattern
listForPatterns: anArray
	"Make the list be those file names which match the patterns."

	| sizePad newList |
	directory ifNil: [^#()].
	(fileSelectionBlock isKindOf: MessageSend) ifTrue: [
		fileSelectionBlock arguments: {directory entries}.
		newList := fileSelectionBlock value.
		fileSelectionBlock arguments: #().
	] ifFalse: [
		newList := Set new.
		anArray do: [ :pat |
			newList addAll: (directory entries select: [:entry | fileSelectionBlock value: entry value: pat]) ].
	].
	newList := newList asArray sort: self sortBlock.
	sizePad := (newList inject: 0 into: [:mx :entry | mx max: entry fileSize])
					asStringWithCommas size.
	^newList collect: [ :e | self fileNameFormattedFrom: e sizePad: sizePad ]