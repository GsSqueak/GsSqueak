text-anchor
hasParagraphAnchorString
	^ (self textAnchorType == #paragraph
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'Paragraph' translated