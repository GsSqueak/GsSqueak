tests - finding
testFindStringStartingAt
	"Run the tests with both String's and ByteString's method"

	{
		"text pattern startIndex expectedResult"
		#('Smalltalk' 'al' 2 3).
		{ (Character value: 12345) asString, 'foo'. 'foo'. 1. 2 }.
		{ (Character value: 12345) asString, 'foo'. (Character value: 12345) asString, 'foo'. 1. 1 }.
		{ 'foo', (Character value: 12345) asString. (Character value: 12345) asString. 1. 4 }.
		#('ababab' 'ab' 2 3).
		#('abc' 'a' 2 0) } do: [ :input |
			#(
				(yourself yourself)
				"the (yourself asWideString) pair would sometimes result 0 
				(like here: 'Smalltalk' findString: 'al' asWideString startingAt: 1)
				if the text is a ByteString, because of the optimized version,
				but normally ByteStrings never ''contain'' WideStrings"
				(asWideString yourself)
				(asWideString asWideString)) do: [ :modifiers |
					| text pattern startIndex expectedResult result |
					text := input first perform: modifiers first.
					pattern := input second perform: modifiers second.
					startIndex := input third.
					expectedResult := input fourth.
					self assert: (result := text findString: pattern startingAt: startIndex) = expectedResult ] ]