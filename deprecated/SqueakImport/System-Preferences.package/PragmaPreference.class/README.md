Differs from superclass by redirecting all queries to a preference provider that defines its preference via a class-side preference method marked with a pragma.  For example, evaluate
	self systemNavigation browseAllCallsOn: #preference:categoryList:description:type:

Each preference method getter can be accompanied by a setter that assigns to the preference whose value the getter answers.  If the getter is of the form
	^SomeGlobalOrClassVar ifNil: [...]
then the framework is smart enough to figure out the SomeGlobalOrClassVar from the getter and no setter method is required.