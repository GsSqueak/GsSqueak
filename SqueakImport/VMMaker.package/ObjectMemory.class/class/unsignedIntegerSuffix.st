translation
unsignedIntegerSuffix
	"Answer the suffix that should be appended to unsigned integer literals in generated code."

	^ 'U'

	"The U declaration is sufficient for 64-bit cases - dtl"
	"^BytesPerWord = 4 ifTrue: ['U'] ifFalse: ['ULL']"