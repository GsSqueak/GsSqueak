piano rolls
triggerActionFromPianoRoll
	
	WorldState addDeferredUIMessage: 
			[ | proj |
			self currentIndex >= listOfPages size 
				ifTrue: [Beeper beep]
				ifFalse: 
					[currentIndex := self currentIndex + 1.
					proj := Project named: ((listOfPages at: currentIndex) first).
					proj world setProperty: #letTheMusicPlay toValue: true.
					proj enter]]