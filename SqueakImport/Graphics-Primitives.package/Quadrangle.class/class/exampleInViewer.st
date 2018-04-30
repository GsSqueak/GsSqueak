instance creation
exampleInViewer
	"Create a sample Quadrangle and open a Viewer on it"

	(self region: (100@100 extent: 100@50) borderWidth: (1 + (6 atRandom)) borderColor: Color black insideColor: (Color perform: #(green red blue yellow) atRandom)) beViewed

"Quadrangle exampleInViewer"