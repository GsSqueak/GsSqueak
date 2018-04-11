*SqClasses-instance creation
newUniqueClassInstVars: instVarString classInstVars: classInstVarString
	"Create a unique class for the receiver"

	| aName aClass |
	self isSystemDefined ifFalse:
		[^ superclass newUniqueClassInstVars: instVarString classInstVars: classInstVarString].
	aName := self chooseUniqueClassName.
	aClass := self subclass: aName instanceVariableNames: instVarString 
		classVariableNames: '' poolDictionaries: '' category: self categoryForUniclasses.
	classInstVarString size > 0 ifTrue:
		[aClass class instanceVariableNames: classInstVarString].
	self flag: #todo. self flag: #uniclasses. "Discuss if we really want to hide uniclasses again"
	aClass environment forgetClass: aClass logged: false.
	self removeSubclass: aClass.
	^ aClass
