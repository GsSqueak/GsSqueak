C code generator
emitCCodeOn: aStream doAssertions: assertionFlag
	"Emit C code for all methods in the code base onto the given stream. All inlined method calls should already have been expanded."

	self emitCHeaderOn: aStream.
	self emitCTypesOn: aStream.
	self emitCConstantsOn: aStream.
	self emitCFunctionPrototypes: preparedMethodList on: aStream.
	self emitCVariablesOn: aStream.
'Writing Translated Code...'
displayProgressAt: Sensor cursorPoint
from: 0 to: methods size
during: [:bar |
	preparedMethodList doWithIndex: [ :m :i | bar value: i.
		m emitCCodeOn: aStream generator: self.
]].
	self emitExportsOn: aStream.
