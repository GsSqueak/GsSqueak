environmentId list
environmentIdListIndex: anIndex

	self selectEnvironmentId: (self environmentIdList at: anIndex ifAbsent: [nil])