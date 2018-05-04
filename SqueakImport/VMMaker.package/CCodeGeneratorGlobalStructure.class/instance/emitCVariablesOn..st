C code generator
emitCVariablesOn: aStream
	"Store the global variable declarations on the given stream.
	break logic into vars for structure and vars for non-structure"
	| varString structure nonstruct target |

	structure := WriteStream on: (String new: 32768).
	nonstruct := WriteStream on: (String new: 32768).
	aStream nextPutAll: '/*** Variables ***/'; cr.
	structure nextPutAll: 'static struct foo {'; cr.
	self buildSortedVariablesCollection do: [ :var |
		varString := var asString.
		target := (self placeInStructure: var) 
			ifTrue: [structure]
			ifFalse: [nonstruct].
		(self isGeneratingPluginCode) ifTrue:[
			varString = 'interpreterProxy' ifTrue:[
				"quite special..."
				aStream cr; nextPutAll: '#ifdef SQUEAK_BUILTIN_PLUGIN'.
				aStream cr; nextPutAll: 'extern'.
				aStream cr; nextPutAll: '#endif'; cr.
			] ifFalse:[aStream nextPutAll:'static '].
		].
		(variableDeclarations includesKey: varString) ifTrue: [
			target nextPutAll: (variableDeclarations at: varString), ';'; cr.
		] ifFalse: [
			"default variable declaration"
			target nextPutAll: 'sqInt ', varString, ';'; cr.
		].
	].
	structure nextPutAll: ' } fum;';cr.

	"if the machine needs the fum structure defining locally, do it now"
	localStructDef ifTrue:[structure nextPutAll: 'struct foo * foo = &fum;';cr;cr].

	aStream nextPutAll: structure contents.
	aStream nextPutAll: nonstruct contents.
	aStream cr.