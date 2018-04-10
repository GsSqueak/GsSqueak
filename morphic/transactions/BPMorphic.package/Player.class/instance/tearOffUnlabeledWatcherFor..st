slots-user
tearOffUnlabeledWatcherFor: aGetter 
	"Hand the user anUnlabeled readout for viewing a numeric value"
	(WatcherWrapper new unlabeledForPlayer: self getter: aGetter) openInHand