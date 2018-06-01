private actions
selectedMessages

	| answer |
	answer := OrderedCollection new.
	messageSelections withIndexDo:
		[ :eachSelection :index |
		eachSelection ifTrue: [ answer add: (messageList at: index) ] ].
	^answer
