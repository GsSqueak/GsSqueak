message list menu
copyName
	"Copy the current selector to the clipboard"

	| selector |
	(selector := self selectorList at: selectorListIndex ifAbsent: [nil]) ifNotNil:
		[Clipboard clipboardText: selector asString asText]