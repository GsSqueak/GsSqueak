instance management
addInstance: anInstance

	self instanceDict at: anInstance ifAbsentPut: [self freeId]