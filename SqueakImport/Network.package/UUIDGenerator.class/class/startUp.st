class initialization
startUp
	"Reseed the random"
	TheSemaphore critical: [TheRandom seed: nil].