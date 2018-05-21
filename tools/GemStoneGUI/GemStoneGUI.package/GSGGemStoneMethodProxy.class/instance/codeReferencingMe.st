query assembly
codeReferencingMe

	^ '({1} compiledMethodAt: {2} environmentId: {3} otherwise: nil)'
		format: {
			self inClass codeReferencingMe.
			self selector storeString.
			self envId}