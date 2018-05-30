example pane
searchResult: anExternalSearchResult

	self contents: ''.
	classList := #(). classListIndex := 0.
	selectorIndex := 0.
	selectorList := self listFromResult: anExternalSearchResult.
 	self changed: #messageList.
	self changed: #classList.
	self changed: #contents
