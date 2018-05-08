tests
testOR

	self assert: (false | true) =  true.
	self assert: (false | false) = false.