*SqClasses-scripting
methodInterfacesForCategory: aCategorySymbol inVocabulary: aVocabulary limitClass: aLimitClass
	"Return a list of methodInterfaces for the receiver in the given category, given a vocabulary.  aCategorySymbol is the inherent category symbol, not necessarily the wording as expressed in the vocabulary."

	| categorySymbol |
	categorySymbol := aCategorySymbol asSymbol.

	(categorySymbol == ScriptingSystem nameForInstanceVariablesCategory) ifTrue: [
		"user-defined instance variables"
		^ self methodInterfacesForInstanceVariablesCategoryIn: aVocabulary].
	(categorySymbol == ScriptingSystem nameForScriptsCategory) ifTrue: [
		"user-defined scripts"
		^ self methodInterfacesForScriptsCategoryIn: aVocabulary].
	"all others"
	^ self usableMethodInterfacesIn: (aVocabulary methodInterfacesInCategory: categorySymbol
		forInstance: self
		ofClass: self class
		limitClass: aLimitClass)
