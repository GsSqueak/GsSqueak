-SUnitTools-testing
hasClassWithTestsSelected
	^ self selectedClass
		ifNil: [false]
		ifNotNil: [:cls | cls isTestClass
				and: [cls isAbstract not]]