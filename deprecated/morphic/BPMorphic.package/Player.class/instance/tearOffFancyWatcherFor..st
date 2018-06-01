slots-user
tearOffFancyWatcherFor: aGetter 
	"Hand the user a labeled readout for viewing a numeric value"
	(WatcherWrapper new fancyForPlayer: self getter: aGetter) openInHand