player commands
playSoundNamed: soundName
	"Play the sound with the given name.
	Does nothing if this image lacks sound playing facilities."

	SoundService default playSoundNamed: soundName asString