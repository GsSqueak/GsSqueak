new selection
selectWord
	"Select a word or expression, the result of pressing Command+[Space
	Bar] or by double-clicking."
	^ self selectWordLeftDelimiters: '
"''|([{<' rightDelimiters: '
"''|)]}>'"<--- punctuation symbols should precede the bracket symbols"