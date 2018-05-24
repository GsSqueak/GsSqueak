loading
prioritizedUnloadedResources
	"Return an array of unloaded resource locators prioritized by some means"
	| list |
	list := unloaded asArray.
	^list sort:[:l1 :l2|
		(l1 resourceFileSize ifNil:[SmallInteger maxVal]) <=
			(l2 resourceFileSize ifNil:[SmallInteger maxVal])]