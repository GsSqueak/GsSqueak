private
layoutScratchPad
	| world pos width |
	world := Project current world.
	world mainDockingBars do:
		[ : each | each searchBarMorph ifNotNil:
			[ : searchBar | pos := searchBar bottomLeft.
			width := searchBar width ] ].
	width ifNil: [ width := 250.  pos := world topRight - (width @ 5) ].
	scratchPad
		width: width ;
		position: pos ;
		startStepping: #deleteUnlessHasFocus at: Time millisecondClockValue arguments: nil stepTime: 3000