private
selectPath: anArray
	| child |
	anArray isEmpty ifTrue: [^ self select].
	child := self children detect: [:ea | ea matches: anArray first] ifNone: [^ self select].
	child selectPath: anArray allButFirst.