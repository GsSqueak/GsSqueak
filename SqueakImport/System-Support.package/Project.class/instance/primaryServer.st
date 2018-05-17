file in/out
primaryServer
	"Return my primary server, that is the one I was downloaded from or are about to be stored on."
	^self primaryServerIfNil: [nil]