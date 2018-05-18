enter
finalExitActions: enteringProject

	world triggerClosingScripts.

	"Pause sound players, subject to preference settings"
	(world hasProperty: #letTheMusicPlay)
		ifTrue: [world removeProperty: #letTheMusicPlay]
		ifFalse: [SoundService stop].

	world sleep.

	(world findA: ProjectNavigationMorph)
		ifNotNil: [:navigator | navigator retractIfAppropriate].

	self clearGlobalState.
	Sensor flushAllButDandDEvents. 
	
	self world submorphsDo: [:ea | ea removeProperty: #dropShadow].