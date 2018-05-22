accessing
clipboardText: text notifyWith: anObject
	"Set the contents of the clipboard to text. anObject can be used as a marker for the source of the clipboard change, the default value is nil."

	| string |
	string := text asString.
	self noteRecentClipping: text asText.
	contents := text asText.
	string := self interpreter toSystemClipboard: string.
	self primitiveClipboardText: string.
	self triggerEvent: #contentChanged withArguments: { text. anObject }