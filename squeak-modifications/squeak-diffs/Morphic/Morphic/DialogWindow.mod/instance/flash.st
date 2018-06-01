running
flash
	"Flash me"
	Beeper beepPrimitive.

	self class useWiggleAnimation ifTrue: [
		#(-2 4 -6 8 -4) do: [:i |
			self left: self left + i.
			self refreshWorld.
		] separatedBy: [(Delay forMilliseconds: 50) wait]
	] ifFalse: [
		1 to: 2 do:[:i|
			self color: Color black.
			self world doOneCycleNow.
			(Delay forMilliseconds: 50) wait.
			self color: Color white.
			self world doOneCycleNow.
			(Delay forMilliseconds: 50) wait] ]