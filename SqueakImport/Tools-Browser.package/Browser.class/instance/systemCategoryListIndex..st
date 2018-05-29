system category list
systemCategoryListIndex: anInteger 
	"Set the selected system category index to be anInteger. Update all other 
	selections to be deselected."
	
	self selectSystemCategory: (self systemCategoryList at: anInteger ifAbsent: [ nil ])