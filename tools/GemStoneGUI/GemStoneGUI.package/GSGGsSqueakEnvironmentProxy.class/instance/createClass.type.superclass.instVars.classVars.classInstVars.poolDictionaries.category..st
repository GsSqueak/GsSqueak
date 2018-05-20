interface
createClass: className type: typeSymbol superclass: superclassName instVars: instVarArray classVars: classVarArray classInstVars: classInstVarArray poolDictionaries: poolDictionaryArray category: categorySymbol

	| query isBytes |
	isBytes := self byteTypes includes: typeSymbol.
	query := '
	| superclass newClass environment superclassName |
	superclassName := {1}.
	environment := {2}.
	superclass := superclassName = #nil
					ifTrue: [nil]
					ifFalse: [(environment classNamed: superclassName) ifNil: [^ self error]].
	newClass := superclass
		{3} {4}
		', (isBytes ifTrue: [''] ifFalse: ['instVarNames: {5}']) ,
		'classVars: {6}
		classInstVars: {7}
		poolDictionaries: {8}
		inDictionary: SymbolDictionary new
		newVersionOf: (environment classNamed: {4})
		description: nil
		options: {9}.
	environment at: newClass name put: newClass.
	newClass category: {10}'.
	query := query format: {
		superclassName asSymbol printString. "1. superclass"
		self codeReferencingMe. "2. environment"
		self subclassMessageForType: typeSymbol. "3. subclass message"
		className asSymbol printString. "4. class name"
		self convertToSymbolArrayString: instVarArray.
		self convertToSymbolArrayString: classVarArray.
		self convertToSymbolArrayString: classInstVarArray.
		self convertToSymbolArrayString: poolDictionaryArray.
		(self optionsForType: typeSymbol). "9. options"
		categorySymbol asSymbol printString "10. system category"
		}.
	^ self repository fetchClass: query forEnvironment: self