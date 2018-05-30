as yet unclassified
addAlansAnchorFor: aMorph

	| ed attribute selRects |

	self removeAlansAnchorFor: aMorph.
	ed := self editor.
	attribute := TextAnchor new anchoredMorph: aMorph.
	aMorph setProperty: #geeMailLeftOffset toValue: aMorph left - self left.
	ed replaceSelectionWith: (ed selection addAttribute: attribute).
	selRects := self paragraph selectionRects.
	selRects isEmpty ifFalse: [
		aMorph top: selRects first top
	].
	self releaseParagraphReally.
	self layoutChanged.

