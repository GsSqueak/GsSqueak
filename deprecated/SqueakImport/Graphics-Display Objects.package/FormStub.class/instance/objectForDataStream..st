fileIn/Out
objectForDataStream: refStream
	"Force me into outPointers so that I get notified about startup"
	refStream replace: self with: self.
	^self