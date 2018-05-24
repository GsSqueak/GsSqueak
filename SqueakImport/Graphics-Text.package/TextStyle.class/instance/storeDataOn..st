Disk I/O
storeDataOn: aDataStream
	"The shared arrays in tabsArray and marginTabsArray are the globals DefaultTabsArray and DefaultMarginTabsArray.  DiskProxies will be substituted for these in (Array objectForDataStream:)."

	^ super storeDataOn: aDataStream