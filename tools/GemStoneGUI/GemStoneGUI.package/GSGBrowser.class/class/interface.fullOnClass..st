instance creation
interface: aGSGInterface fullOnClass: aClass

	^ (self interface: aGSGInterface)
		setClass: aClass;
		buildAndOpenFullBrowser