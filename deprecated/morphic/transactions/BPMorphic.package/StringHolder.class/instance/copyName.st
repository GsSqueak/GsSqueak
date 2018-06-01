-Tools
copyName
	"Copy the current selector to the clipboard"
	self selectedMessageName
		ifNotNil: [:_gsSqueakTemp_selector | Clipboard clipboardText: _gsSqueakTemp_selector asString asText]