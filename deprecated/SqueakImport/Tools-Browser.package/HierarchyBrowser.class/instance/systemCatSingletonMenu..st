menu messages
systemCatSingletonMenu: aMenu
	"This appears to be obsolete now that the hierarchybrowser has not category view"
	^ aMenu labels:
'find class... (f)
browse
printOut
fileOut
update
rename...
remove' 
	lines: #(1 4)
	selections:
		#(findClass buildSystemCategoryBrowser
		printOutSystemCategory fileOutSystemCategory updateSystemCategories
		 renameSystemCategory removeSystemCategory )
