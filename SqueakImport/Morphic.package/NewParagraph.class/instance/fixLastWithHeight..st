composition
fixLastWithHeight: lineHeightGuess
"This awful bit is to ensure that if we have scanned all the text and the last character is a CR that there is a null line at the end of lines. Sometimes this was not happening which caused anomalous selections when selecting all the text. This is implemented as a post-composition fixup because I coul;dn't figure out where to put it in the main logic."

	| oldLastLine newRectangle line |

	(text size > 1 and: [text last = Character cr]) ifFalse: [^self].

	oldLastLine := lines last.
	oldLastLine last - oldLastLine first >= 0 ifFalse: [^self].
	oldLastLine last = text size ifFalse: [^self].

	newRectangle := oldLastLine left @ oldLastLine bottom 
				extent: 0@(oldLastLine bottom - oldLastLine top).
	"Even though we may be below the bottom of the container,
	it is still necessary to compose the last line for consistency..."

	line := TextLine start: text size+1 stop: text size internalSpaces: 0 paddingWidth: 0.
	line rectangle: newRectangle.
	line lineHeight: lineHeightGuess baseline: textStyle baseline.
	lines := lines, (Array with: line).
