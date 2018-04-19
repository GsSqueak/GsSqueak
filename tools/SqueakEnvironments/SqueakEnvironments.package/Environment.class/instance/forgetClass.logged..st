classes and traits
forgetClass: aClass logged: aBool 
	(self hasBindingOf: aClass @env7: name)
		ifFalse: [^ self].
	aBool
		ifTrue: [SystemChangeNotifier uniqueInstance classRemoved: aClass fromCategory: aClass category].
	self organization removeElement: aClass @env7: name.
	Smalltalk removeFromStartUpList: aClass.
	Smalltalk removeFromShutDownList: aClass.
	self unbind: aClass @env7: name
