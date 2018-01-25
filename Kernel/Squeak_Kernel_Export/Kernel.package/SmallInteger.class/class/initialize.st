class initialization
initialize
	SmalltalkImage current addToStartUpList: self before: Delay.
	self startUp: true