tests - converting
testWithNoLineLongerThan
	"self run: #testWithNoLineLongerThan"
	self assert: ('Hello', String cr, 'World') equals: ('Hello World' withNoLineLongerThan: 5).

	self assert: String crlf equals: (String crlf withNoLineLongerThan: 5).
	self assert: 'Hello\\World' withCRs equals: (('Hello', String cr, String cr,'World') withNoLineLongerThan: 5).

	self
		assert: ('Sample text to line break at', String cr, 'some point')
		equals: ('Sample text to line break at some point' withNoLineLongerThan:  28).
	self
		assert: ('Sample text', String cr, 'to line break', String cr, 'at some point')
		equals: ('Sample text', String cr, 'to line break', String cr, 'at some point' withNoLineLongerThan:  28).
