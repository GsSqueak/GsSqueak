as yet unclassified
addJumpBeginning

	| ed attribute jumpEnd mySelection a1 ax |

	ed := self editor.
	(mySelection := ed selection) isEmpty ifTrue: [^self inform: 'Please select something first'].
	jumpEnd := self chooseOneJumpEnd.
	jumpEnd isEmptyOrNil ifTrue: [^self].

	attribute := TextPlusJumpStart new jumpLabel: jumpEnd.
	a1 := (mySelection attributesAt: 1) reject: [ :each | each isKindOf: TextPlusJumpStart].
	ax := (mySelection attributesAt: mySelection size) reject: [ :each | each isKindOf: TextPlusJumpStart].
	ed replaceSelectionWith: 
		(Text string: '*' attributes: a1),
		(mySelection addAttribute: attribute),
		(Text string: '*' attributes: ax).
	self releaseParagraphReally.
	self layoutChanged.

