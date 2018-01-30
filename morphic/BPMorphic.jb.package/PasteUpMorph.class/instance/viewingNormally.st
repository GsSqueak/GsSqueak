viewing
viewingNormally
	"Answer whether the receiver is being viewed normally, viz not in
	list-view or auto-line-layout"
	^ (self showingListView
		or: [self autoLineLayout == true]) not