accessing
referredInstVars
	"Answer a Set of the inst var names the receiver accesses."
	| allInstVarNames instVarNames |
	allInstVarNames := self methodClass allInstVarNames.
	self isReturnField ifTrue:
		[^Set with: (allInstVarNames at: self returnField + 1)].
	instVarNames := Set new.
	self abstractBytecodeMessagesDo:
		[:msg|
		(#(#popIntoReceiverVariable:
		    #pushReceiverVariable:
		    #storeIntoReceiverVariable:) includes: msg selector) ifTrue:
			[instVarNames add: (allInstVarNames at: msg argument + 1)]].
	^instVarNames

	"Dictionary newFromPairs: (Point selectors collect: [:s| { s. (Point >> s) referredInstVars}])"