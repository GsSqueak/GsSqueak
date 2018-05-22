serialization
compositeStructureForSpec: spec

	self flag: #gsg. "class proxy class should not be hard-coded here"
	^ {#GSGGemStoneClassProxy.
		#Symbol.
		#Number.
		#Symbol}