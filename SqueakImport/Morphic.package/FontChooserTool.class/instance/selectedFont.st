font list
selectedFont
	| font |
	font := self selectedTextStyle fontOfPointSize: pointSize.
	^font emphasized: emphasis