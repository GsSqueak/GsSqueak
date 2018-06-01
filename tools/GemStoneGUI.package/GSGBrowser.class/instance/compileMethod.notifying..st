contents
compileMethod: aString notifying: aController
	"Compile the code that was accepted by the user, placing the compiled method into an appropriate message category.  Return true if the compilation succeeded, else false."
	| category newSelector class |
	category := self messageCategoryOfNewMethod.
	class := self selectedClassOrMetaClass.
	self flag: #gsg. "Ignores the controller for now"
	newSelector := class
						compileMethod: aString
						category: category.
	newSelector ifNil: [^ false].
	newSelector = self selectedMessageName
		ifTrue: [self invalidateContents]
		ifFalse: [self setSelector: newSelector].
	^ true