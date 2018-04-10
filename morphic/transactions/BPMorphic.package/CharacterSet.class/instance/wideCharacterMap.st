private
wideCharacterMap
	"used for comparing with WideCharacterSet"
	| _gsSqueakTemp_wide |
	_gsSqueakTemp_wide := WideCharacterSet new.
	_gsSqueakTemp_wide addAll: self.
	^ _gsSqueakTemp_wide wideCharacterMap