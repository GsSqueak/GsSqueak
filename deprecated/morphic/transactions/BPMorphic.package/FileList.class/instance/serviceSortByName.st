own services
serviceSortByName
	"Answer a service for soring by name"
	^ (SimpleServiceEntry new
		provider: self
		label: 'by name' translatedNoop
		selector: #sortByName
		description: 'sort entries by name' translatedNoop) extraSelector: #sortingByName;
		 buttonLabel: 'name' translatedNoop