instance creation
fillRandomly: aUUID

	TheSemaphore critical: [
		TheRandom nextBytes: 16 "128 bit" into: aUUID startingAt: 1].