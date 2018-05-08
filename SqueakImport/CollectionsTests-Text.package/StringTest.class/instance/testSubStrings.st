tests - converting
testSubStrings

	#("receiver (argument expectedResult argument expectedResult ...) ..."
		'' ('' () ($a) () 'a' () 'ab' () 'aaa' ())
		'a' ('' ('a') ($a) () 'a' () 'ab' () 'aaa' () ($b) ('a') 'b' ('a') 'bc' ('a'))
		'aa' ('' ('aa') ($a) () 'a' () 'ab' () 'aaa' () ($b) ('aa') 'b' ('aa') 'bc' ('aa'))
		'ab' ('' ('ab') ($a) ('b') 'a' ('b') 'ab' () 'aaa' ('b') ($b) ('a') 'b' ('a') 'bc' ('a'))
		'ababa' ('' ('ababa') ($a) ('b' 'b') 'a' ('b' 'b') 'ab' () 'aaa' ('b' 'b') ($b) ('a' 'a' 'a') 'b' ('a' 'a' 'a') 'bc' ('a' 'a' 'a'))
		'abbccba' ('' ('abbccba') ($a) ('bbccb') 'a' ('bbccb') 'ab' ('cc') 'aaa' ('bbccb') ($b) ('a' 'cc' 'a') 'b' ('a' 'cc' 'a') 'bc' ('a' 'a')))
		pairsDo: [ :receiver :argumentsAndExpectedResults |
			argumentsAndExpectedResults pairsDo: [ :argument :expectedResult |
				self assert: expectedResult equals: (
					receiver subStrings: argument) ] ]
