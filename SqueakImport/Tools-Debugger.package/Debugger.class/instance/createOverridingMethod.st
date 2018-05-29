private
createOverridingMethod
	"Should only be called when this Debugger was created in response to a
	SubclassResponsibility exception. Create a stub for the method that needs
	overriding and proceed into it. Let the user only select a class in the
	inheritance chain between the actual class and the class declaring the
	subclassResponsibility."
	| chosenClass msg category |
	msg := self contextStackTop exceptionMessage.
	chosenClass := self
		askForSuperclassOf: self contextStackTop receiver class
		upTo: self contextStackTop sender method methodClass
		toImplement: msg selector
		ifCancel: [^self].
	"Use the same category as the marker method."
	category := self contextStackTop sender selectorCategory.
	self implementOverridingMethod: msg inClass: chosenClass inCategory: category.