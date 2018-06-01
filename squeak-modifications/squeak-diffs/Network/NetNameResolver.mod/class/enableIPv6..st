system startup
enableIPv6: aBool
	"Set a preference to control whether IPv6 primitives and new network support
	should be used if available, and reinitialize the UseOldNetwork flag to recognize
	the setting. If true, the new networking support will be used if the VM provides
	the required primitives. If false, IPv6 and new network support will not be used.
	The new network support may be unreliable on some platforms, so this preference
	allows it to be explicitly disabled."

	EnableIPv6 := aBool.
	self initializeOldNetworkFlag
