as yet unclassified
addJumpEnd

	| ed attribute jumpLabel selectedString |

	ed := self editor.
	selectedString := ed selection asString.
	selectedString isEmpty ifTrue: [^self inform: 'Please select something first'].
	jumpLabel := UIManager default request: 'Name this place' initialAnswer: selectedString.
	jumpLabel isEmpty ifTrue: [^self].
	self removeJumpEndFor: jumpLabel.
	attribute := TextPlusJumpEnd new jumpLabel: jumpLabel.
	ed replaceSelectionWith: (ed selection addAttribute: attribute).

