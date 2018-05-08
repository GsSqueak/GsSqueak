tests - converting
testAsPrecomposedUnicode
	"Test the behavior of #asPrecomposedUnicode"
	| composed decomposed |

	"Tests single character"
	composed := String with: (Character value: 353).
	decomposed := String with: (Character value: 115) with: (Character value: 780).
	self assert: decomposed asPrecomposedUnicode = composed.

	"Test character at end of text"
	composed := 'Hello', (String with: (Character value: 353)).
	decomposed := 'Hello', (String with: (Character value: 115) with: (Character value: 780)).
	self assert: decomposed asPrecomposedUnicode = composed.

	"Test character in the midst of text"
	composed := 'Hello', (String with: (Character value: 353)), 'World'.
	decomposed := 'Hello', (String with: (Character value: 115) with: (Character value: 780)), 'World'.
	self assert: decomposed asPrecomposedUnicode = composed.

	"Test character in the end of text"
	composed := (String with: (Character value: 353)), 'World'.
	decomposed := (String with: (Character value: 115) with: (Character value: 780)), 'World'.
	self assert: decomposed asPrecomposedUnicode = composed.

	"Test string full of characters"
	"Test character in the end of text"
	composed := (String with: (Character value: 353)).
	decomposed := (String with: (Character value: 115) with: (Character value: 780)).
	self assert: (decomposed, decomposed, decomposed) asPrecomposedUnicode = (composed, composed, composed).
