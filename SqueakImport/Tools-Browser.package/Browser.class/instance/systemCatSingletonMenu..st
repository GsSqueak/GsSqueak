system category functions
systemCatSingletonMenu: aMenu

	^ aMenu labels:
'browse all
browse
printOut
fileOut
update
rename...
remove' 
	lines: #(2 4)
	selections:
		#(browseAllClasses buildSystemCategoryBrowser
		printOutSystemCategory fileOutSystemCategory updateSystemCategories
		renameSystemCategory removeSystemCategory)
