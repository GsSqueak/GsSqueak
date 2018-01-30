drawing
hasClipSubmorphsString
	"Answer a string that represents the clip-submophs checkbox"
	^ (self clipSubmorphs
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'provide clipping' translated