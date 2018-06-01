contents
isModeStyleable
	"determine the current mode can be styled"
	^ self showingSource or: [self showingPrettyPrint]