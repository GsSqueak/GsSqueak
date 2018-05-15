loading
registerUnloadedResources
	resourceMap keys do: [:newLoc |
		unloaded add: newLoc]
