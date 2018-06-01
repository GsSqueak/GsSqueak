menu
copyUrl
	"Copy this page's url to the clipboard"
	| str |
	str := currentPage url ifNil: [str := 'Page does not have a url.  Send page to server first.' translated].
	Clipboard clipboardText: str asText.
