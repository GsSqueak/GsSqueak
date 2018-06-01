class initialization
initialize
	TheRandom := Random new.
	TheSemaphore := Semaphore forMutualExclusion.
	Smalltalk addToStartUpList: self