diffing
methodsToCollectIn: aClass

	| categoryDict |
	self flag: #gss. "Should respect categories to load"
	categoryDict := aClass messageCategoryDict.
	^ categoryDict associations gather: [:assoc |
		assoc value]