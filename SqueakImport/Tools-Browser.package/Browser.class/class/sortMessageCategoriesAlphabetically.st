preferences
sortMessageCategoriesAlphabetically

	<preference: 'Sort Message Categories Alphabetically'
		categoryList: #(browsing Tools)
		description: 'When enabled, the message category list in the browser is ordered by alphabet. No need to ''alphabetize'' this list manually via the context menu.'
		type: #Boolean>
		
	^ SortMessageCategoriesAlphabetically ifNil: [false]
