isolation layers
revoke

	"Do the first part of the revoke operation -- this must be very simple."
	"Replace original method dicts if there are method changes."
	changeRecords do: [:changeRecord | changeRecord revokePhase1].
	Behavior flushCache.

	"Complete the revoke process -- no particular hurry."
	changeRecords do: [:changeRecord | changeRecord revokePhase2].
