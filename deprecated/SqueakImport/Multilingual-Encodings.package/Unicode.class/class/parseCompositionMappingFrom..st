composing
parseCompositionMappingFrom: unicodeData
	"Parse the Unicode composition mappings from the given stream"
	"
		Unicode initializeCompositionMappings.
	"
	| newCompositions newDecompositions newToUpper newToLower toNumber |

	toNumber := [:quad | quad inject: 0 into:[:sum :ch| sum * 16 + ch digitValue]].

	newCompositions := PluggableDictionary integerDictionary.
	newDecompositions := PluggableDictionary integerDictionary.
	newToUpper := PluggableDictionary integerDictionary.
	newToLower := PluggableDictionary integerDictionary.

	unicodeData linesDo: [ :line |
		| fields |
		(fields := line splitBy: ';') size > 13 ifTrue: [
			| codePoint lowercaseCodePoint uppercaseCodePoint decomposed baseChar compChar |
			codePoint := toNumber value: (fields at: 1).
			uppercaseCodePoint := (fields at: 13) ifEmpty: [ codePoint ] ifNotEmpty: toNumber.
			codePoint = uppercaseCodePoint ifFalse: [ newToUpper at: codePoint put: uppercaseCodePoint ].
			lowercaseCodePoint := (fields at: 14) ifEmpty: [ codePoint ] ifNotEmpty: toNumber.
			codePoint = lowercaseCodePoint ifFalse: [ newToLower at: codePoint put: lowercaseCodePoint ].
			decomposed := (fields at: 6) findTokens: ' '.
			(decomposed size = 2 and:[decomposed first first ~= $<]) ifTrue:[
				decomposed replace: toNumber.
				baseChar := decomposed first.		"base character"
				compChar := decomposed second.	"composition character"
				newDecompositions at: codePoint put: { baseChar. compChar }.
				(newCompositions at: baseChar ifAbsentPut: [  PluggableDictionary integerDictionary ])
					at: compChar put: codePoint ] ] ].

	"Compact the new dictionaries."
	newCompositions compact.
	newCompositions valuesDo: [ :each | each compact ].
	newDecompositions compact.
	newToUpper compact.
	newToLower compact.
	"Save atomically."
	Compositions := newCompositions.
	Decompositions := newDecompositions.
	ToUpper := newToUpper.
	ToLower := newToLower.
