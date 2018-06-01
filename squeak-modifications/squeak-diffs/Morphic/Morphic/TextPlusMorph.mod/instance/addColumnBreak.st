as yet unclassified
addColumnBreak

	| ed old new break |

	ed := self editor.
	old := ed selection.
	break := Character characterForColumnBreak asString.
	break := Text string: break attributes: {}.
	new := old ,break.
	ed replaceSelectionWith: new.
	self releaseParagraphReally.
	self layoutChanged.

