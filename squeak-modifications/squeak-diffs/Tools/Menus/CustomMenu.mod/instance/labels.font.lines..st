construction
labels: aString font: aFont lines: anArrayOrNil
	"This method allows the receiver to accept old-style SelectionMenu creation messages. It should be used only for backward compatibility during the MVC-to-Morphic transition. New code should be written using the other menu construction protocol such as addList:."

	| labelList linesArray |
	labelList := aString lines asArray.
	anArrayOrNil
		ifNil: [linesArray := #()]
		ifNotNil: [linesArray := anArrayOrNil].
	1 to: labelList size do: [:i |
		self add: (labelList at: i) action: (labelList at: i).
		(linesArray includes: i) ifTrue: [self addLine]].
	font ifNotNil: [font := aFont].
