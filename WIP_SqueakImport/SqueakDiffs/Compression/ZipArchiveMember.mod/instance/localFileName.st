accessing
localFileName
	"Answer my fileName in terms of the local directory naming convention"
	| localName |
	localName := fileName copyReplaceAll: '/' with: FileDirectory slash.
	^(fileName first = $/)
		ifTrue: [ FileDirectory default class makeAbsolute: localName ]
		ifFalse: [ FileDirectory default class makeRelative: localName ]