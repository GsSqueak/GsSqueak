isolation layers
invoke

	"Do the first part of the invoke operation -- no particular hurry."
	changeRecords do: [:changeRecord | changeRecord invokePhase1].

	"Complete the invoke process -- this must be very simple."
	"Replace method dicts for any method changes."
	changeRecords do: [:changeRecord | changeRecord invokePhase2].
	Behavior flushCache.

