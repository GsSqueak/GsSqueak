as yet unclassified
showPageBreaksString
	^ (showPageBreaks
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'show page breaks' translated