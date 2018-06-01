initialization
initProgressMorph
	progress := ProgressBarMorph new.
	progress borderColor: ((UserInterfaceTheme current get: #borderColor for: SystemProgressBarMorph) ifNil: [Color black]).
	progress borderWidth: ((UserInterfaceTheme current get: #borderWidth for: SystemProgressBarMorph) ifNil: [1]).
	progress color: ((UserInterfaceTheme current get: #color for: SystemProgressBarMorph) ifNil: [Color white]).
	progress progressColor: ((UserInterfaceTheme current get: #barColor for: SystemProgressBarMorph) ifNil: [Color gray]).
	progress extent: 200 @ 15.
