comparing
= anObject

	self == anObject ifTrue: [^ true].
	self species = anObject species ifFalse: [^ false].
	self selector = anObject selector ifFalse: [^ false].
	self category = anObject category ifFalse: [^ false].
	self source = anObject source ifFalse: [^ false].
	^ true