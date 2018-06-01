initialization
sampleImageForm
	"If I have a sample image form override stored, answer it, else answer one obtained by launching an actual instance"

	^ sampleImageForm ifNil:
		[((Smalltalk at: globalReceiverSymbol) perform: nativitySelector) imageFormDepth: 32]