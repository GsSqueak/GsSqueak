query assembly
codeReferencingMe

	^ '({1} compiledMethodAt: {2} environmentId: {3} otherwise: nil)'
		format: {
			self environment codeReferencingClassNamed: self className.
			self selector storeString.
			self envId}