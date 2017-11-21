*BPToolsSqueak
fileOutTo: internalStream
	"File a description of the receiver onto a new file whose base name is the name of the receiver."

	internalStream header; timeStamp.

	self sharedPools size > 0 ifTrue: [
		self shouldFileOutPools
			ifTrue: [self fileOutSharedPoolsOn: internalStream]].
	self fileOutOn: internalStream moveSource: false toFile: 0.
	internalStream trailer.

