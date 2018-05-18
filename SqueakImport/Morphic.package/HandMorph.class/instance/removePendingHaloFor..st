halo handling
removePendingHaloFor: aMorph
	"Get rid of pending balloon help or halo actions."
	self removeAlarm: #spawnMagicHaloFor:.