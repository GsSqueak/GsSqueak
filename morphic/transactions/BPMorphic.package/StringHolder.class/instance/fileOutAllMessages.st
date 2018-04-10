-Tools
fileOutAllMessages
	"Put a description of the all the message list on a file."
	FileStream
		writeSourceCodeFrom: (String
				new: 16000
				streamContents: [:str | self messageList
						do: [:e | e actualClass
								printMethodChunk: e methodSymbol
								withPreamble: true
								on: str
								moveSource: false
								toFile: 0]])
		baseName: (self messageListSelectorTitle replaceAll: Character space with: $_)
		isSt: true
		useHtml: false