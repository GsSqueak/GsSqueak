testing interpreter
testConditionalInAndBlock
	"Expand ifTrue:ifFalse: properly within a block."

	"(SlangTest selector: #testConditionalInAndBlock) debug"

	| stssi m expected |
	stssi := SlangTestSupportInterpreter inline: true.
	m := stssi asCString: #conditionalInAndBlock.

	m := (m copyWithoutAll: ('' , Character cr)) copyReplaceAll: ('' , Character tab) with: ' '. 
	expected := 'sqInt conditionalInAndBlock(void) { return 1 && ((0 ? TRUE : FALSE));}'.

	self deny: ('*1 && (if (0) {*' match: m). "prior faulty translation"
	self assert: expected = m.
