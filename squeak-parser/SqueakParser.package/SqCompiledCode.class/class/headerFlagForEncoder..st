method encoding
headerFlagForEncoder: anEncoder 
	"This allows subclasses for compiler variants such as the ScriptEncoder
	in EToys
	to continue to function."
	(anEncoder isKindOf: PrimaryBytecodeSetEncoderClass)
		ifTrue: [^ 0].
	(anEncoder isKindOf: SecondaryBytecodeSetEncoderClass)
		ifTrue: [^ SmallInteger minVal].
	self error: 'The encoder is not one of the two installed bytecode sets'