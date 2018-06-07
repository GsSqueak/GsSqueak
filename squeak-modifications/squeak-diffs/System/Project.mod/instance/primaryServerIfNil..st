file in/out
primaryServerIfNil: aBlock
	"Return my primary server, that is the one I was downloaded from or are about to be stored on. If none is set execute the exception block"
	| serverList | 
	serverList := self serverList.
	^serverList isEmptyOrNil
		ifTrue: [aBlock value]
		ifFalse: [serverList first]