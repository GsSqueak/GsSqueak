preferences
refreshAllDialogs
	
	self allSubInstances do: [:instance | instance setDefaultParameters; setTitleParameters].