fileIn/Out
fileOutCategory: category 
	"Store on the file named category (a string) concatenated with '.st' all the 
	classes associated with the category."
	^ self fileOutCategory: category asHtml: false