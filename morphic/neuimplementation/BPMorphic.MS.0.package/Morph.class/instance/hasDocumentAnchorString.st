text-anchor
hasDocumentAnchorString
	^ (self textAnchorType == #document
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'Document' translated