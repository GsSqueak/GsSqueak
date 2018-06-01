private
directoryNamesFor: item
	"item may be file directory or server directory"
	| entries |
	entries := item directoryNames.
	dirSelectionBlock ifNotNil:[entries := entries select: dirSelectionBlock].
	^entries