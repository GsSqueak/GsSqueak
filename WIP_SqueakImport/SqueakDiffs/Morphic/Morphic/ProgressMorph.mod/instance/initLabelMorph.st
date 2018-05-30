initialization
initLabelMorph
	^ labelMorph := (StringMorph contents: '')
		font: ((UserInterfaceTheme current get: #font for: SystemProgressMorph) ifNil: [TextStyle defaultFont]);
		color: ((UserInterfaceTheme current get: #textColor for: SystemProgressMorph) ifNil: [Color black]);
		yourself