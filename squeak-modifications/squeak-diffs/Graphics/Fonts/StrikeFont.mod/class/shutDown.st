derivative font caching
shutDown  "StrikeFont shutDown"
	"Deallocate synthetically derived copies of base fonts to save space"
	self allSubInstancesDo: [:sf | sf reset].
	DefaultStringScanner := nil.
