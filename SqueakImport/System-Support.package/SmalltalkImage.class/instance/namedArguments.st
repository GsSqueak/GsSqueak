command line
namedArguments
	"Assume arguments passed to the image are key->value pairs, answer a Dictionary of the argument names and their values."
	| argName value index paramNameValueDictionary |
	paramNameValueDictionary := Dictionary new.
	index := 1.
	[ argName := self argumentAt: index.
	argName isEmptyOrNil ] whileFalse:
		[ index := index + 1.
		value := (self argumentAt: index) ifNil: [ String empty ].
		paramNameValueDictionary
			at: argName asUppercase
			put: value.
		index := index + 1 ].
	^ paramNameValueDictionary