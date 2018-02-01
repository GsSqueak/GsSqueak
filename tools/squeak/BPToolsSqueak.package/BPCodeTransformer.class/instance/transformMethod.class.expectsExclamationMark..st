transforming
transformMethod: aMethodString class: aClass expectsExclamationMark: aBoolean
	self expectsExclamationMark: aBoolean.
	self methodClass: aClass.
	self squeakCode: aMethodString.
	self cleanSqueakCode.
	self parse.
	self renameTemporaries.
	self removePrimitive.
	^ self generateGsCode.