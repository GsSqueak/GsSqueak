make arrows
makeArrows
"
TextStyle default makeArrows.
"
	fontArray do: [ :font |
		(font isKindOf: StrikeFont) ifTrue:[ 
			font 
				makeAssignArrow; 
				makeReturnArrow.
		]
	].
