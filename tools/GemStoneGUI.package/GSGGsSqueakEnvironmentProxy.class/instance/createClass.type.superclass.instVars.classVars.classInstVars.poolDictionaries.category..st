interface
createClass: className type: typeSymbol superclass: superclassName instVars: instVarArray classVars: classVarArray classInstVars: classInstVarArray poolDictionaries: poolDictionaryArray category: categorySymbol

	| query isBytes |
	isBytes := self byteTypes includes: typeSymbol.
	query := '
	| superclass poolArray newClass environment superclassName |
	superclassName := {1}.
	environment := {2}.
      poolArray := {8} collect: [ :each | (environment at: each asSymbol) _classVars ].
	superclass := superclassName = #nil
					ifTrue: [nil]
					ifFalse: [(environment classNamed: superclassName) ifNil: [^ self error]].
	newClass := superclass
		{3} {4}
		', (isBytes ifTrue: [''] ifFalse: ['instVarNames: {5}']) ,
		'classVars: {6}
		classInstVars: {7}
		poolDictionaries: poolArray
		inDictionary: SymbolDictionary new
		newVersionOf: nil
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
	^ self fetchClass: query