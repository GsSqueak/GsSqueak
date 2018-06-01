selection
selectedMorph: aMorph 
	"this shouldn't be used any longer. Only sent by implemetations of #list: such as PluggableListMorph, SimpleHierarchicalListMorph etc"

	self isThisEverCalled .
	true ifTrue: [^self]