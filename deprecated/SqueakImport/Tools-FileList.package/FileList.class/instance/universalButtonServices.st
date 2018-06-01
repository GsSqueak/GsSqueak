initialization
universalButtonServices
	"Answer a list of services underlying the universal buttons in their initial inception.  For the moment, only the sorting buttons are shown."

	^ {self serviceSortByName. self serviceSortByDate. self serviceSortBySize}