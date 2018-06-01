private
cutBackExecutionToSenderContext
	"When accepting a new version of a method which can't be simulated (i.e. a quick method) we
	 must cut back to the sender.  But this is non-trivial. If the quick method has been reached via
	 a perform: (as it is when one uses Create toi implement a method from an MNU) then the relevant
	 arguments won't be on the stack and we can't simply proceed without crashing the VM."
	| oldContext context sel |
	oldContext := self selectedContext.
	self down.
	context := self selectedContext.
	context jump: (context previousPc - context pc).
	sel := context selectorToSendOrSelf.
	sel numArgs = oldContext method numArgs
		ifTrue:
			[context push: oldContext receiver.
			 oldContext arguments do:
				[:arg| context push: arg]]
		ifFalse:
			[context privRefresh; stepToSendOrReturn]