tests - formatting
testFormat

	#(
		'\{ \} \\ foo {1} bar {2}' #(12 'string') '{ } \ foo 12 bar string'
		'\{ \} \\ foo {2} bar {1}' #('string' 12) '{ } \ foo 12 bar string'
		'\{1}' #() '{1}'
		'\{1}{1}' #($a) '{1}a'
		'foo' #() 'foo'
	) groupsDo: [ :receiver :argument :expectedResult |
		self assert: expectedResult equals: (receiver format: argument) ].
	#(
		'{1 }'
		'{1abc}'
		'{ 1}'
		'{ 1.0 }'
		'{1'
		'{1 foo'
		'{2}'
		'{0}'
		'{-0}'
		'{-1}'
	) do: [ :each |
		self should: [ each format: { 'x' } ] raise: Error ]