menu
chooseMagnification
	| result |
	result := UIManager default chooseFrom: #(1.5 2 4 8) values: #(1.5 2 4 8) 
		title:  ('Choose magnification
(currently {1})' translated format:{magnification}).
	(result isNil or: [result = magnification]) ifTrue: [^ self].
	magnification := result.
	self extent: self extent. "round to new magnification"
	self changed. "redraw even if extent wasn't changed"