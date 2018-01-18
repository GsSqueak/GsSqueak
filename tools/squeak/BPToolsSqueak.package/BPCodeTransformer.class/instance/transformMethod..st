transforming
transformMethod: aMethodString
	self squeakCode: aMethodString.
	self cleanSqueakCode.
	^ self generateGsCode.