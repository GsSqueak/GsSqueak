instance creation
fromString: aString
	"for HTML color spec: #FFCCAA or white/black/red/other name, or an r,g,b triplet string"
	"Color fromString: '#FFCCAA'.
	 Color fromString: 'white'.
	 Color fromString: 'orange'
	 Color fromString: '126,42,33' "
	
	| aColorHex rgb|
	aString isEmptyOrNil ifTrue: [ ^self white ].
	aString first = $#
		ifTrue: [ aColorHex := aString allButFirst ]
		ifFalse: [ aColorHex := aString ].
	
	"is the string a 6 digit hex number?"
	((aColorHex size = 6 or: [aColorHex size = 8]) and: [ 
		aColorHex allSatisfy: [ :each | '0123456789ABCDEFabcdef' includes: each ] ])
			ifTrue: [^ self fromHTMLString: aColorHex ].
	
	"is the string in the form a,b,c ?"
	rgb := aColorHex findTokens: $, .
	rgb size = 3 ifTrue: [^ self fromRGBString: rgb].
	
	"try to match aColorHex with known named colors, case insensitive"
	^self perform: (ColorNames detect: [:colorSymbol | aColorHex sameAs: colorSymbol] ifNone: [ #white ])