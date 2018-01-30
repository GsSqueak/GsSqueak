evaluating
valueWithReceiver: aReceiver arguments: anArray 

	"This should be changed after the release of Squeak 4.3 to
		^self class receiver: aReceiver withArguments: anArray executeMethod: self"
	^ aReceiver withArgs: anArray executeMethod: self