dependents access
evaluate: actionBlock wheneverChangeIn: aspectBlock
	| viewerThenObject objectThenViewer |
	objectThenViewer := self.
	viewerThenObject := ObjectViewer on: objectThenViewer.
	objectThenViewer become: viewerThenObject.
	"--- Then ---"
	objectThenViewer xxxViewedObject: viewerThenObject
			evaluate: actionBlock
			wheneverChangeIn: aspectBlock