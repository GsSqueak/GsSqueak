what to show
showByteCodes: aBoolean
	"Get into or out of bytecode-showoing mode"

	self okToChange ifFalse: [^ self changed: #flash].
	aBoolean
		ifTrue:
			[contentsSymbol := #byteCodes]
		ifFalse:
			[contentsSymbol == #byteCodes ifTrue: [contentsSymbol := #source]].
	self contentsChanged