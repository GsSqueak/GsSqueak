search
showOnlyImplementedSelectors
	"Caution -- can be slow! Filter my selector list down such that it only  
	shows selectors that are actually implemented somewhere in the system."
	self okToChange ifFalse: [^ self].
	
	Cursor wait showWhile: [
		self selectorList: (self systemNavigation allSelectorsWithAnyImplementorsIn: selectorList)].