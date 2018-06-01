top window
dimWindowButtons
	{closeBox. collapseBox. menuBox. expandBox}
		do: [:b | b ifNotNil: [b dim]]