geometry
extentToFit
	"Resize scroll pane to exactly fit its contents."
	
	| offset |
	offset := 0@0.
	(retractableScrollBar not and: [self vScrollBarPolicy == #always])
		ifTrue: [offset := (self scrollBarThickness - self borderWidth) @ offset y].
	(retractableScrollBar not and: [self hScrollBarPolicy == #always])
		ifTrue: [offset := offset x @ (self scrollBarThickness - self borderWidth)].
		
	^ scroller submorphBounds extent + offset + (2* (self borderWidth @ self borderWidth))