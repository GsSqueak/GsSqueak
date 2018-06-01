misc menu items
sortTabs: evt
	TabSorterMorph new sortTabsFor: self.  "it directly replaces me"
	self delete
