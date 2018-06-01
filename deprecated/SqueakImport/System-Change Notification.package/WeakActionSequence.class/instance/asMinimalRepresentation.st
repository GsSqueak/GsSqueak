converting
asMinimalRepresentation

	| valid |
	valid := self reject: [:e | e isReceiverOrAnyArgumentGarbage ].
	valid size = 0
		ifTrue: [ ^nil ].
	valid size = 1
		ifTrue: [ ^valid first ].
	^valid