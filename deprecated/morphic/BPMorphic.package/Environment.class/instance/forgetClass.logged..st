classes and traits
forgetClass: aClass logged: aBool 
	(self hasBindingOf: aClass name)
		ifFalse: [^ self].
	aBool
		ifTrue: [SystemChangeNotifier uniqueInstance classRemoved: aClass fromCategory: aClass category].
	self organization removeElement: aClass name.
	Smalltalk removeFromStartUpList: aClass.
	Smalltalk removeFromShutDownList: aClass.
	self unbind: aClass name