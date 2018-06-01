private
logChangedSelector: element category: newCategory
	"make an entry in the changes to record the changed category"
	| method |	
	"if we do not have a changes file, the code below would try to make a new method"
	(subject == nil or: [SourceFiles == nil or: [(SourceFiles at: 2) == nil]]) ifTrue: [^self].
	method := subject compiledMethodAt: element ifAbsent: [^self].
	subject logMethodSource: (method getSourceFor: element in: subject)
		forMethodWithNode: (CompiledMethodWithNode method: method node: method) 
		inCategory: newCategory withStamp: method timeStamp notifying: nil.
