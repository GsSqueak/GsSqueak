copying
copyCategoryUnobtrusively: cat from: class 
	"Specify that one of the categories of messages for the receiver is cat, as 
	found in the class, class. Copy each message found in this category."

	self copyUnobtrusivelyCategory: cat
		from: class
		classified: cat