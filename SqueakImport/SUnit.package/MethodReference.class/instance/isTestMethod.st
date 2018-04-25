*SUnit-testing
isTestMethod

	^self actualClass isTestClass and: [self methodSymbol isTestSelector]