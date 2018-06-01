testing interpreter
testInterpDoNotdoNotGenerateSubclassResponsibility
	"If a method contains self subclassResponsibility, assume it is not meant for translation."

	| stssi m |
	stssi := SlangTestSupportInterpreter inline: false.
	self assert: (SlangTestSupportInterpreter canUnderstand: #anAbstractMethod).
	m := stssi asCString: #anAbstractMethod.
	self assert: (m includesSubString: 'No source has been generated').
	self deny: (stssi asCString includesSubString: 'anAbstractMethod').
	self should: [stssi anAbstractMethod]
		raise: Error

