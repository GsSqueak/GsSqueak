testing ssip plugins
testSSIPDoNotGenerateSubclassResponsibility
	"If a method contains self subclassResponsibility, assume it is not meant for translation."

	| stss m |
	stss := SlangTestSupportSSIP inline: false.
	self assert: (SlangTestSupportSSIP canUnderstand: #anAbstractMethod).
	m := stss asCString: #anAbstractMethod.
	self assert: (m includesSubString: 'No source has been generated').
	self deny: (stss asCString includesSubString: 'anAbstractMethod').
	self should: [stss anAbstractMethod]
		raise: Error
