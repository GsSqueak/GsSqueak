converting
subStrings: separators 
	"Answer an array containing the substrings in the receiver separated 
	by the elements of separators."
	| char result sourceStream subString |
	#Collectn.
	"Changed 2000/04/08 For ANSI <readableString> protocol."
	(separators isString or:[separators allSatisfy: [:element | element isCharacter]]) ifFalse:
		[^ self error: 'separators must be Characters.'].
	sourceStream := ReadStream on: self.
	result := OrderedCollection new.
	subString := String new.
	[sourceStream atEnd]
		whileFalse: 
			[char := sourceStream next.
			(separators includes: char)
				ifTrue: [subString notEmpty
						ifTrue: 
							[result add: subString copy.
							subString := String new]]
				ifFalse: [subString := subString , (String with: char)]].
	subString notEmpty ifTrue: [result add: subString copy].
	^ result asArray
