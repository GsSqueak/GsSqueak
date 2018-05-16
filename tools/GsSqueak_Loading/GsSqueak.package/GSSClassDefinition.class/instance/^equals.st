comparing
= anObject

	self species = anObject species ifFalse: [^ false].
	self name = anObject name ifFalse: [^ false].
	self superclass = anObject superclass ifFalse: [^ false].
	self type = anObject type ifFalse: [^ false].
	self category = anObject category ifFalse: [^ false].
	self instVars = anObject instVars ifFalse: [^ false].
	self classVars = anObject classVars ifFalse: [^ false].
	self classInstVars = anObject classInstVars ifFalse: [^ false].
	self pools = anObject pools ifFalse: [^ false].
	self comment = anObject comment ifFalse: [^ false].
	self commentStamp = anObject commentStamp ifFalse: [^ false].
	self instanceMethods = anObject instanceMethods ifFalse: [^ false].
	self classMethods = anObject classMethods ifFalse: [^ false].
	^ true