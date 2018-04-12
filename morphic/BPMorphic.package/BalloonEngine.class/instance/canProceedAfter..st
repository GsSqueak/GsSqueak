copying
canProceedAfter: failureReason 
	"Check if we can proceed after the failureReason indicated."
	| _gsSqueakTemp_newBuffer |
	failureReason = GErrorNeedFlush
		ifTrue: ["Need to flush engine before proceeding"
			self copyBits.
			self reset.
			^ true].
	failureReason = GErrorNoMoreSpace
		ifTrue: ["Work buffer is too small"
			_gsSqueakTemp_newBuffer := workBuffer species new: workBuffer size * 2.
			self primCopyBufferFrom: workBuffer to: _gsSqueakTemp_newBuffer.
			workBuffer := _gsSqueakTemp_newBuffer.
			^ true].
	"Not handled"
	^ false