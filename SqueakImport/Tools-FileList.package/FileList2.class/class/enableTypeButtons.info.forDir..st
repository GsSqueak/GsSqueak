blue ui
enableTypeButtons: typeButtons info: fileTypeInfo forDir: aDirectory

	| foundSuffixes firstEnabled |

	firstEnabled := nil.
	foundSuffixes := (aDirectory ifNil: [ #()] ifNotNil: [ aDirectory fileNames]) collect: [ :each | (each findTokens: '.') last asLowercase].
	foundSuffixes := foundSuffixes asSet.
	fileTypeInfo with: typeButtons do: [ :info :button | | enableIt fileSuffixes |
		fileSuffixes := info second.
		enableIt := fileSuffixes anySatisfy: [ :patt | foundSuffixes includes: patt].
		button 
			setProperty: #enabled 
			toValue: enableIt.
		enableIt ifTrue: [firstEnabled ifNil: [firstEnabled := button]].
	].
	firstEnabled ifNotNil: [^firstEnabled mouseUp: nil].
	typeButtons do: [ :each | each color: Color gray].

