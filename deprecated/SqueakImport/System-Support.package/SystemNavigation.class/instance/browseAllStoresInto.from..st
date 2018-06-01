browse
browseAllStoresInto: varName from: aClass
	"Create and schedule a Message Set browser for all the receiver's methods 
	or any methods of a subclass/superclass that refer to the instance variable name."
	"self new browseAllStoresInto: 'contents' from: Collection."
	^ self
		browseMessageList: (self allStoresInto: varName from: aClass)
		name: 'Stores into ' , varName
		autoSelect: varName