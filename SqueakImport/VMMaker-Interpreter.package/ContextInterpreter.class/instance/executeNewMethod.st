message sending
executeNewMethod
	"execute a method not found in the mCache - which means that 
	primitiveIndex must be manually set. Used by primitiveClosureValue & primitiveExecuteMethod, where no lookup is previously done"
	primitiveIndex > 0
		ifTrue: [self primitiveResponse.
			self successful ifTrue: [^ nil]].
	"if not primitive, or primitive failed, activate the method"
	self activateNewMethod.
	"check for possible interrupts at each real send"
	self quickCheckForInterrupts