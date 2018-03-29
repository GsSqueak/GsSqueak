return bytecodes
commonCallerReturn
	"Return to the previous context/frame (sender for method activations,
	caller for block activations)."
	| _gsSqueakTemp_callersFPOrNull _gsSqueakTemp_doWeHaveANativeFrame |
	"TODO: Store/restore the nativeSP more properly, when it exists"
	LowcodeVM
		ifTrue: [_gsSqueakTemp_doWeHaveANativeFrame := self frameHasNativeFrame: localFP.
			_gsSqueakTemp_doWeHaveANativeFrame
				ifTrue: [nativeStackPointer := (self nativePreviousStackPointerIn: localFP)
								- 1.
					nativeSP := 0.
					self setFrameHasNotNativeFrame: localFP]].
	_gsSqueakTemp_callersFPOrNull := self frameCallerFP: localFP.
	_gsSqueakTemp_callersFPOrNull = 0
		ifTrue: ["baseFrame"
			self assert: localFP = stackPage baseFP.
			^ self baseFrameReturn].
	localIP := self frameCallerSavedIP: localFP.
	localSP := localFP
				+ (self frameStackedReceiverOffset: localFP).
	localFP := _gsSqueakTemp_callersFPOrNull.
	self
		setMethod: (self frameMethod: localFP).
	self fetchNextBytecode.
	self internalStackTopPut: localReturnValue