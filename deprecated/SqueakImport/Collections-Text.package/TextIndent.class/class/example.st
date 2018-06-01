example
example
	"TextIndent example"
	| text pg |

	"create an example text with some indentation"
	text := 'abcdao euoaeuo aeuo aeuoaeu o aeuoeauefgh bcd efghi'  asText.
	text addAttribute: (TextColor red)  from: 3 to: 8.
	text addAttribute: (TextIndent amount: 1) from: 1 to: 2.
	text addAttribute: (TextIndent amount: 2) from: 20 to: 35.

	"stick it in a paragraph and display it"
	pg := text asParagraph.
	pg compositionRectangle: (0@0 extent: 100@200).
	pg textStyle alignment: 2.
	pg displayAt: 0@0.
