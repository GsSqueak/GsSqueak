as yet unclassified
fileOut: aClass To: internalStream 
	"File a description of the receiver onto a new file whose base name is the name of the receiver."

	internalStream header; timeStamp.
	aClass sharedPools size > 0 ifTrue: [
		aClass shouldFileOutPools
			ifTrue: [aClass fileOutSharedPoolsOn: internalStream]].
	aClass fileOutOn: internalStream moveSource: false toFile: 0.
	internalStream trailer.

