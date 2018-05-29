accessing
dirListUrl
	| listURL |
	listURL := self altUrl
				ifNil: [^ nil].
	^ listURL last ~= $/
		ifTrue: [listURL , '/']
		ifFalse: [listURL]