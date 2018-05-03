accessing
translateInDirectory: directory doInlining: inlineFlag
"handle a special case code string rather than generated code. 
NB sqOldSoundsPrims IS NOT FULLY INTEGRATED - it still isn't included in the exports list"
	| cg aClass |
	self initialize.

	cg := self buildCodeGenerator.

	aClass := Smalltalk at: #AbstractSound ifAbsent:[nil].
	aClass ifNil:[
		Transcript cr; show: 'AbstractSound not present in image. Skipping plugin.'.
		^self].

	cg addMethodsForPrimitives: aClass translatedPrimitives.
	self storeString: cg generateCodeStringForPrimitives onFileNamed: (directory fullNameFor: self moduleFileName).
	"What we need here is some way to derive the prim names from sqOldSoundPrims - or dump it entirely. Perhaps add this class (without then generating the file again) using fake entry points like SurfacePlugin does"

	^cg exportedPrimitiveNames asArray
