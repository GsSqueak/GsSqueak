accessing
overallVolume: aNumber
	"Set the overally playback volume to a value between 0.0 (off) and 1.0 (full blast)."

	overallVolume := (aNumber asFloat min: 1.0) max: 0.0.

