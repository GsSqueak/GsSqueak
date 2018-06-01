testing base plugins
testPluginDoNotGenerateSubclassResponsibility
	"If a method contains self subclassResponsibility, assume it is not meant for translation."

	| stsp m |
	stsp := SlangTestSupportPlugin inline: false.
	self assert: (SlangTestSupportPlugin canUnderstand: #anAbstractMethod).
	m := stsp asCString: #anAbstractMethod.
	self assert: (m includesSubString: 'No source has been generated').
	self deny: (stsp asCString includesSubString: 'anAbstractMethod').
	self should: [stsp anAbstractMethod]
		raise: Error
