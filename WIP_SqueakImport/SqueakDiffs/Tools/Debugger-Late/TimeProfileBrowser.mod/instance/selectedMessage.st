message list
selectedMessage
	"Answer the source method for the currently selected message."

	self setClassAndSelectorIn: [ :class :selector |
		| source | 
		source := (class == UndefinedObject and: [ selector == #DoIt ])
			ifTrue: [ 'DoIt', String cr, String cr, block arguments first decompile decompileString ]
			ifFalse: [ class sourceMethodAt: selector ifAbsent: [ ^'Missing' ] ].
		SystemBrowser browseWithPrettyPrint ifTrue: [
			source := class prettyPrinterClass 
				format: source
				in: class
				notifying: nil
				decorated: false ].
		^source asText makeSelectorBoldIn: class ].
	^''