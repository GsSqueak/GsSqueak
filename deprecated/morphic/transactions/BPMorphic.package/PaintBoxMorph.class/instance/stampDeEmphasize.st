actions
stampDeEmphasize
	"Turn off an emphasized stamp. Was turned on in
	pickup:action:cursor: "
	tool owner class == AlignmentMorph
		ifTrue: ["actionButton"
			tool owner color: Color transparent;
				 borderColor: Color transparent
			"layoutMorph"]