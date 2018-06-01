menu messages
compareToClipboard
	"If any text is selected, present the modifications that would be made
	to it if the clipboard contents were pasted over it. If no text is
	selected, present the differences betwen the entire pane's contents
	and the clipboard text."
	| _gsSqueakTemp_subjectText _gsSqueakTemp_proposedText |
	_gsSqueakTemp_subjectText := self selection string
				ifEmpty: [paragraph text string].
	_gsSqueakTemp_proposedText := self clipboardText string.
	_gsSqueakTemp_subjectText = _gsSqueakTemp_proposedText
		ifTrue: [^ self inform: 'Exact match'].
	(StringHolder new
		textContents: (TextDiffBuilder buildDisplayPatchFrom: _gsSqueakTemp_subjectText to: _gsSqueakTemp_proposedText))
		openLabel: 'Differences with Clipboard Text'