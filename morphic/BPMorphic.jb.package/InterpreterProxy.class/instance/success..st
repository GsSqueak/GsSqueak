other
success: aBoolean 	self failed		ifTrue: [^ self].	aBoolean		ifFalse: [self primitiveFailFor: 1.			(self confirm: 'A primitive is failing -- Stop simulation?')				ifTrue: [self halt]]