*SqClasses-copying
copy: sel from: class classified: cat 
	"Install the method associated with the first arugment, sel, a message 
	selector, found in the method dictionary of the second argument, class, 
	as one of the receiver's methods. Classify the message under the third 
	argument, cat."

	"Useful when modifying an existing class"
	(class sourceCodeAt: sel ifAbsent: []) ifNotNil:
		[:code| | method category |
		method := class compiledMethodAt: sel.
		category := cat == nil
						ifTrue: [class organization categoryOfElement: sel]
						ifFalse: [cat].
		((self methodDict includesKey: sel)
		 and: [code asString ~= (self sourceCodeAt: sel) asString]) ifTrue:
			[self error: self name , ' '  , sel  , ' will be redefined if you proceed.'].
		self compile: code classified: category withStamp: method timeStamp notifying: nil]
