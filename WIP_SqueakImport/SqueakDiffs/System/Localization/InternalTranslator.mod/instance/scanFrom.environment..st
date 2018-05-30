fileIn/fileOut
scanFrom: aStream environment: anEnvironment
	"Read a definition of dictionary.  
	Make sure current locale corresponds my locale id"
	| aString newTranslations assoc currentPlatform |
	newTranslations := Dictionary new.
	currentPlatform := Locale currentPlatform.
	[Locale
		currentPlatform: (Locale localeID: id).
	[aString := aStream nextChunk withSqueakLineEndings.
	aString size > 0] whileTrue: 
		[assoc := Compiler evaluate: aString environment: anEnvironment.
		assoc value = ''
			ifTrue: [self class registerPhrase: assoc key]
			ifFalse: [newTranslations add: assoc]]]
		ensure: [Locale currentPlatform: currentPlatform].
	self mergeTranslations: newTranslations