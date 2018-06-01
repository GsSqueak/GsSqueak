initialize-release
newColorExpressionMorph
	| inputField builder |
	builder := ToolBuilder default.
	inputField := (builder build: (builder pluggableInputFieldSpec new
		model: self;
		getText: #colorExpression;
		setText: #colorExpression:)).
	inputField
		 hResizing: #spaceFill ;
		 vResizing: #rigid ;
		 height: (Preferences standardDefaultTextFont height * 3/2).
	^ inputField