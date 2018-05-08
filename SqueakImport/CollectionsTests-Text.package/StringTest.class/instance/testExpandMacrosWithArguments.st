tests - formatting
testExpandMacrosWithArguments

	| patterns |
	patterns := {
		"Input - Expected output"
		#('' '').
		#('foo' 'foo').
		{ '<N>'. String cr }.
		{ '<T>'. String tab }.
		{ '<n>'. String cr }.
		{ '<t>'. String tab }.
		#('%>' '>').
		#('%<' '<').
		#('%%' '%').
		#('%a' 'a').
		#('%A' 'A').
		#('<1S>' 'foo').
		#('<1s>' 'foo').
		#('<10S>' '10').
		#('<10s>' '10').
		#('<2P>' '1').
		#('<3p>' 'true').
		#('<10P>' '''10''').
		#('<11p>' '11').
		#('<3?ab:cde>' 'ab').
		#('<4?ab:cde>' 'cde') }.
	"Test all possible 3 long sequences of the above patterns. Since the patterns include
	the empty string, all 1 and 2 long sequences will be tested too."
	patterns do: [ :first |
		patterns do: [ :second |
			patterns do: [ :third |
				| result |
				result := first first, second first, third first expandMacrosWithArguments: #('foo' 1 true false 5 6 7 8 9 '10' 11).
				self assert: first second, second second, third second equals: result ] ] ].
	"Test some malformed inputs too."
	#('%' '<' '<N' '<T' '<1T' '<>' '<N><' '<1st' '<A' '<1Phello>' '<1?abcd>' '<?a:b>') do: [ :each |
		self should: [ each expandMacrosWithArguments: #() ] raise: Error ]