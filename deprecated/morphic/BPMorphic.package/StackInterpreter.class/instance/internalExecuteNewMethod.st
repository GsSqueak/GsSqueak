message sending
internalExecuteNewMethod
	| _gsSqueakTemp_succeeded |
	primitiveFunctionPointer ~= 0
		ifTrue: [self isPrimitiveFunctionPointerAnIndex
				ifTrue: [^ self internalQuickPrimitiveResponse].
			self externalizeIPandSP.
			_gsSqueakTemp_succeeded := self slowPrimitiveResponse.
			self internalizeIPandSP.
			_gsSqueakTemp_succeeded
				ifTrue: [self browserPluginReturnIfNeeded.
					^ nil]].
	"if not primitive, or primitive failed, activate the method"
	^ self internalActivateNewMethod