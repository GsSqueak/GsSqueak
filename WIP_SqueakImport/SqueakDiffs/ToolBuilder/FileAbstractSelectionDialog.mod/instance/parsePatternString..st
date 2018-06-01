file list
parsePatternString: aStringOrNil
	"The pattern is a string that may have three simple tokens included along with normal characters; 
	a) a ; or LF or CR splits the string into separate patterns and filenames matching any of them will be included in list
	b) a * matches any number of characters
	c) a # matches one character"

	| patterns |
	aStringOrNil ifNil:[^self defaultPatternList].
	patterns := OrderedCollection new.
	(aStringOrNil findTokens: (String with: Character cr with: Character lf with: $;))
		do: [ :each |
			(each includes: $*) | (each includes: $#)
					ifTrue: [ patterns add: each]
					ifFalse: [each isEmptyOrNil
										ifTrue: [ patterns add: '*']
										ifFalse: [ patterns add: '*' , each , '*']]].

	^patterns