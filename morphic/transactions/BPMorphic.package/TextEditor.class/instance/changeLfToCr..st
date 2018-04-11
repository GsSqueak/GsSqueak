editing keys
changeLfToCr: aKeyboardEvent 
	"Replace all LFs by CRs.
	Triggered by Cmd-U -- useful when getting code from FTP sites
	jmv- Modified to als change crlf by cr"
	| _gsSqueakTemp_fixed |
	_gsSqueakTemp_fixed := self selection string withSqueakLineEndings.
	self
		replaceSelectionWith: (Text fromString: _gsSqueakTemp_fixed).
	^ true