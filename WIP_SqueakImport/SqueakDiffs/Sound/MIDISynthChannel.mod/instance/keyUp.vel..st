midi dispatching
keyUp: key vel: vel
	"Handle a key up event."

	
	activeSounds copy do: [:entry | | snd |
		(entry at: 1) = key ifTrue: [
			snd := entry at: 2.
			snd stopGracefully.
			activeSounds remove: entry]].
