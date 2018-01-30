copying
copyUnobtrusivelyCategory: cat from: aClass classified: newCat 
	"Specify that one of the categories of messages for the receiver is the 
	third argument, newCat. Copy each message found in the category cat in 
	class aClass into this new category."

	self copyAllUnobtrusively: (aClass organization listAtCategoryNamed: cat)
		from: aClass
		classified: newCat