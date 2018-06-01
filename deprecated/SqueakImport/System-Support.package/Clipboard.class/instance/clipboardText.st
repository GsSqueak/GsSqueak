accessing
clipboardText
	"Return the text currently in the clipboard. If the system clipboard is empty, or if it differs from the Smalltalk clipboard text, use the Smalltalk clipboard. This is done since (a) the Mac clipboard gives up on very large chunks of text and (b) since not all platforms support the notion of a clipboard."

	| string decodedString |
	string := self primitiveClipboardText withSqueakLineEndings.
	(string isEmpty
			or: [string = contents asString])
		ifTrue: [^ contents].
	decodedString := self interpreter fromSystemClipboard: string.
	^ decodedString = contents asString 
		ifTrue: [contents]
		ifFalse: [decodedString asText].
