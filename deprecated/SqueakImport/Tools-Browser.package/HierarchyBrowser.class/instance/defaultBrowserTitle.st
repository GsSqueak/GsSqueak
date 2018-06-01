initialization
defaultBrowserTitle
	^ self selectedSystemCategoryName ifNil: [ 'Hierarchy Browser' ]