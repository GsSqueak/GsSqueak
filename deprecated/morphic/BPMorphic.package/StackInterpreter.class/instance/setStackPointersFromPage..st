stack pages
setStackPointersFromPage: thePage 
	stackPointer := thePage headSP.
	framePointer := thePage headFP