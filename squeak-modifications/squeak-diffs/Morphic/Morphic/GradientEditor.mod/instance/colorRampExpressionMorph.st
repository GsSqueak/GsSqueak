initialization
colorRampExpressionMorph
	| inputField builder |
	builder := ToolBuilder default.
	inputField := (builder build: (builder pluggableInputFieldSpec new
		model: self;
		getText: #colorRamp;
		setText: #colorRampExpression:;
		softLineWrap: true)).
	inputField
		 hResizing: #spaceFill ;
		 vResizing: #spaceFill ;
		 
		 height: (Preferences standardDefaultTextFont height * 3/2).
	^ inputField