C code generation
inlineMethodsUsing: aDictionary

	arguments := arguments collect: [ :arg |
		arg inlineMethodsUsing: aDictionary.
	].
	"xxx inline this message if it is in the dictionary xxx"