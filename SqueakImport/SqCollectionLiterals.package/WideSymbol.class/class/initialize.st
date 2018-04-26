class initialization
initialize

	QuadByteSymbol superclass: self.

	DoubleByteSymbol superclass: self.

	Smalltalk removeFromShutDownList: self. "@@@ Remove this later @@@"
