own services
servicesForProjectLoader
	"Answer the services to show in the button pane for the project loader"

	^ {self serviceSortByName. self serviceSortByDate. self serviceSortBySize. self serviceOpenProjectFromFile}