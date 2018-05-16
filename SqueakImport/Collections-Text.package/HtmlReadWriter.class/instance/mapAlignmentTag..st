mapping
mapAlignmentTag: aTag

	| attributeStart |
	" special html case ".
	aTag = '<center>' ifTrue: [^ {TextAlignment centered}].
	
	"<div align=justify> or <div align=""right"">"
	attributeStart := aTag findString: 'align='.
	attributeStart > 0 ifTrue: [
		| attributeRest |
		attributeRest := aTag copyAfter: $=.
		attributeRest first = $" ifTrue: [attributeRest := attributeRest allButFirst].  " quoted case "
		^ self mapAlignmentValue: (attributeRest findTokens: ' ">') first].
	^ #()