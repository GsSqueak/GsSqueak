instance creation
interface: aGSGInterface class: classProxy selector: aSymbol

	^ self new
		interface: aGSGInterface;
		ownerClass: classProxy;
		selector: aSymbol