editing
handleInteraction: interactionBlock fromEvent: evt 
	"Perform the changes in interactionBlock, noting any change in
	selection and possibly a change in the size of the paragraph (ar
	9/22/2001 - added for TextPrintIts)"
	| _gsSqueakTemp_oldEditor _gsSqueakTemp_oldParagraph _gsSqueakTemp_oldText |
	_gsSqueakTemp_oldEditor := editor.
	_gsSqueakTemp_oldParagraph := paragraph.
	_gsSqueakTemp_oldText := _gsSqueakTemp_oldParagraph text copy.
	self selectionChanged.
	"Note old selection"
	interactionBlock value.
	_gsSqueakTemp_oldParagraph == paragraph
		ifTrue: ["this will not work if the paragraph changed"
			editor := _gsSqueakTemp_oldEditor].
	self selectionChanged.
	"Note new selection"
	(_gsSqueakTemp_oldText = paragraph text
			and: [_gsSqueakTemp_oldText runs = paragraph text runs])
		ifFalse: [self paragraph composeAll.
			self updateFromParagraph].
	self setCompositionWindow