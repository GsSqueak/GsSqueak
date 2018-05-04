menus
platformNameText: aText 
	"set the platform name - this will almost certainly mean replacing the  
	vmMaker with one suited to the platform so we do it anyway."
	| prevVMMaker |
	prevVMMaker := vmMaker.
	"make a new vmmaker and ensure I depend on it correctly"
	vmMaker := VMMaker forPlatform: aText string.
	vmMaker logger: logger.
	vmMaker addDependent: self.
	prevVMMaker removeDependent: self.
	"configure the new vmmaker to match the old one"
	[vmMaker loadConfiguration: prevVMMaker configurationInfo.
	vmMaker platformDirectory]
		on: VMMakerException
		do: [:ex| self inform: ex messageText.
			^ false].
	^ true