mapping
mapTagToAttribute: aTag

	aTag = '<b>' ifTrue: [^ {TextEmphasis bold}].
	aTag = '<i>' ifTrue: [^ {TextEmphasis italic}].
	aTag = '<u>' ifTrue: [^ {TextEmphasis underlined}].
	aTag = '<s>' ifTrue: [^ {TextEmphasis struckOut}].
	aTag = '<code>' ifTrue: [^ self mapCodeTag].
	aTag = '<pre>' ifTrue: [self breakLines: false. ^ {}].
	(#('<div' '<span' '<center>' ) anySatisfy: [:ea | aTag beginsWith: ea])
		ifTrue: [^(self mapAlignmentTag: aTag) union: (self mapContainerTag: aTag)].
	(aTag beginsWith: '<font') ifTrue: [^ self mapFontTag: aTag].
	(aTag beginsWith: '<a') ifTrue: [^ self mapATag: aTag].

	"h1, h2, h3, ..."
	(aTag second = $h and: [aTag third isDigit])
		ifTrue: [^ {TextEmphasis bold}].

	^ {}