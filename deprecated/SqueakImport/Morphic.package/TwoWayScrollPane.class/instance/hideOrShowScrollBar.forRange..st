retractable scroll bar
hideOrShowScrollBar: scrollBar forRange: range

	(self hasProperty: #hideUnneededScrollbars) ifFalse: [^ self].
	(submorphs includes: scrollBar)
		ifTrue: [range <= 0 ifTrue: [scrollBar model: nil; delete]]
		ifFalse: [range > 0 ifTrue: [scrollBar model: self.  self resizeScrollBar; addMorph: scrollBar]]
