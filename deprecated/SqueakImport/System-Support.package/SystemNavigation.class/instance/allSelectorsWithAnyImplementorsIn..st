query
allSelectorsWithAnyImplementorsIn: selectorList 
	"Answer the subset of the given list which represent method selectors 
	which have at least one implementor in the system."
	| good |
	good := Set new.
	self allBehaviorsDo: [:class | selectorList
				do: [:aSelector | (class includesSelector: aSelector)
						ifTrue: [good add: aSelector]]].
	^good sorted

	" 
	SystemNavigation new selectorsWithAnyImplementorsIn: #( contents 
	contents: nuts)
	"