instance creation
newOnCategory: aCategory label: aLabel
	"Open a new browser on this category (testing first for existence)."

	"Browser newOnCategory: 'Tools-Browser' label: 'Testing category browser'"

	| newBrowser newCat |
	newBrowser := self new.
	newCat := aCategory asSymbol.
	(newBrowser systemCategoryList includes: newCat)
		ifTrue: [ newBrowser selectSystemCategory: newCat ]
		ifFalse: [ ^ self inform: 'No such category' ].
	
	newBrowser buildAndOpenCategoryBrowserLabel: aLabel.
	^ newBrowser
	
