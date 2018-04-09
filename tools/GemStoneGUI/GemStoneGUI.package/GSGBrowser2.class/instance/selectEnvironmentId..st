environmentId list
selectEnvironmentId: anInteger

	envId := anInteger.
	self invalidateMessageCategoryDict.
	self changed: #environmentIdListIndex