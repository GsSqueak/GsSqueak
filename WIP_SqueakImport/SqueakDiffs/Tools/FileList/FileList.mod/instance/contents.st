private
contents
	"Answer the contents of the file, reading it first if needed."
	"Possible brevityState values:
		FileList,
		fullFile, briefFile, needToGetFull, needToGetBrief,
		fullHex, briefHex, needToGetFullHex, needToGetBriefHex"

	(listIndex = 0) | (brevityState == #FileList) ifTrue: [^ self defaultContents].  "no file selected"
	brevityState == #fullFile ifTrue: [^ contents].
	brevityState == #fullHex ifTrue: [^ contents].
	brevityState == #briefFile ifTrue: [^ contents].
	brevityState == #briefHex ifTrue: [^ contents].
	brevityState == #graphic ifTrue: [^ contents].

	brevityState == #needToGetGraphic ifTrue: [^self readGraphicContents].
	
	brevityState == #needToGetFullHex ifTrue: [^ self readContentsHex: false].
	brevityState == #needToGetBriefHex ifTrue: [^ self readContentsHex: true].

	brevityState == #needToGetFull ifTrue: [^ self readContentsBrief: false].
	brevityState == #needToGetBrief ifTrue: [^ self readContentsBrief: true].  "default"

	(TextConverter allEncodingNames includes: brevityState) 
		ifTrue: [ ^self readContentsAsEncoding: brevityState].

	self halt: 'unknown state ' , brevityState printString