misc
showingFullScreenString
	"Answer a string characterizing whether the receiver is operating in full-screen mode."

	^ (self isInFullScreenMode ifTrue: ['<yes>'] ifFalse: ['<no>']), 'view pages full-screen' translated