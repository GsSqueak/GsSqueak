classes and traits
replaceBinding: oldBinding inAllMethodsWith: newBinding
	"Replace oldBinding to newBinding in all methods in the system except for those which are the methods of the class of oldBinding. Return true if such replacement were made, false otherwise."

	| foundReferringMethod |
	foundReferringMethod := false.
	self systemNavigation allSelectorsAndMethodsDo: [ :behavior :selector :method |
		(behavior ~~ oldBinding value and: [
			method instVarsInclude: oldBinding ]) ifTrue: [ "Use the fast primitive first."
				"The penultimate literal holds the selector of the method, the last literal is the class."
				1 to: method numLiterals - 2 do: [ :index |
					(method literalAt: index) == oldBinding ifTrue: [
						foundReferringMethod := true.
						method 
							literalAt: index put: newBinding;
							flushCache ] ] ] ].
	^foundReferringMethod