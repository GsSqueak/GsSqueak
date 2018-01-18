transforming
transformMethod: aMethodString class: aClass
	self methodClass: aClass.
	self squeakCode: aMethodString.
	self cleanSqueakCode.
	self parse.
	^ self generateGsCode.