accessing
rate: aNumber
	"Set the playback rate. For example, a rate of 2.0 will playback at twice normal speed."

	rate := aNumber asFloat.
	self tempoOrRateChanged.
