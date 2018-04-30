menu
copyUrl
	"Copy this page's url to the clipboard"
	| _gsSqueakTemp_str |
	_gsSqueakTemp_str := currentPage url
				ifNil: [_gsSqueakTemp_str := 'Page does not have a url.  Send page to server first.' translated].
	Clipboard clipboardText: _gsSqueakTemp_str asText