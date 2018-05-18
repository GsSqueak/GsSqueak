instance creation
from: aPopupMenu title: titleStringOrNil
	"Answer a MenuMorph constructed from the given PopUpMenu. Used to simulate MVC-style menus in a Morphic-only world."

	| menu items lines selections labelString j |
	menu := self new.
	titleStringOrNil ifNotNil: [
		titleStringOrNil isEmpty ifFalse: [menu addTitle: titleStringOrNil]].
	labelString := aPopupMenu labelString.
	items := labelString asString lines.
	labelString isText ifTrue:
		["Pass along text emphasis if present"
		j := 1.
		items := items collect:
			[:item | | emphasis |
			j := labelString asString findString: item startingAt: j.
			emphasis := TextEmphasis new emphasisCode: (labelString emphasisAt: j).
			item asText addAttribute: emphasis]].
	lines := aPopupMenu lineArray.
	lines ifNil: [lines := #()].
	menu cancelValue: 0.
	menu defaultTarget: menu.
	selections := (1 to: items size) asArray.
	1 to: items size do: [:i |
		menu add: (items at: i) selector: #selectMVCItem: argument: (selections at: i).
		(lines includes: i) ifTrue: [menu addLine]].
	^ menu
