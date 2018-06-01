drawing
font: newFont
	font := (newFont ifNil: [ TextStyle default defaultFont ]).
	self adjustHeight.
	listFilterOffsets := Array new: self getListSize withAll: nil.
	self changed.