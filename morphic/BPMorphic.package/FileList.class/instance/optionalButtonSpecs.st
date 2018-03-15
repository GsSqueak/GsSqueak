initialization
optionalButtonSpecs
	"Answer a list of services underlying the optional buttons in their initial
	inception. "
	^ {self serviceSortByName. self serviceSortByDate. self serviceSortBySize}