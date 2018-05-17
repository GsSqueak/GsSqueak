accessing
removeLocator: loc
	locatorMap keys "copy" do:[:k|
		(locatorMap at: k) = loc ifTrue:[locatorMap removeKey: k]].