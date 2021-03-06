process primitive support
assertValidStackLimits
	<returnTypeC: #void>
	"Order in the stackLimit checks is important because stackLimit is smashed by
	 interrupts. So always check for unsmashed value first to avoid race condition."
	self assert: (stackLimit = stackPage realStackLimit
				or: [stackLimit = (self cCoerceSimple: -1 signedIntToLong to: 'char *')]).
	self assert: (stackPage stackLimit = stackPage realStackLimit
				or: [stackPage stackLimit = (self cCoerceSimple: -1 signedIntToLong to: 'char *')])