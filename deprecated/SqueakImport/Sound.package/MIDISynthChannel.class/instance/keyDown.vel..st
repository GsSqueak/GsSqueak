midi dispatching
keyDown: key vel: vel
	"Handle a key down event with non-zero velocity."

	| pitch snd |
	muted ifTrue: [^ self].
	pitch := AbstractSound pitchForMIDIKey: key.
	snd := instrument
		soundForPitch: pitch
		dur: 10000.0  "sustain a long time, or until turned off"
		loudness: masterVolume * channelVolume * (self convertVelocity: vel).
	snd := (MixedSound new add: snd pan: pan) reset.
	SoundPlayer resumePlaying: snd quickStart: false.
	activeSounds add: (Array with: key with: snd with: pitch).
