as yet unclassified
setAllChannelMasterVolumes: aNumber

	| vol |
	vol := (aNumber asFloat min: 1.0) max: 0.0.
	channels do: [:ch | ch masterVolume: vol].
