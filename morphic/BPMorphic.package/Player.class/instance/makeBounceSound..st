misc
makeBounceSound: soundName 
	"Having bounced off an edge, produce the given sound"
	SoundService soundEnabled
		ifTrue: [self costume playSoundNamed: soundName]