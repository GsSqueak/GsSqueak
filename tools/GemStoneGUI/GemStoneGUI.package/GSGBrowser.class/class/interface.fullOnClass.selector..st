instance creation
interface: aGSGInterface fullOnClass: classProxy selector: aSelector

	^ (self interface: aGSGInterface)
		setClass: classProxy selector: aSelector;
		buildAndOpenFullBrowser