initialize-release
setClass: aBehavior selector: aSymbol
	"Set the state of a new, uninitialized Browser."

	aBehavior ifNil: [^ self].

	self
		setClass: aBehavior;	
		setSelector: aSymbol.