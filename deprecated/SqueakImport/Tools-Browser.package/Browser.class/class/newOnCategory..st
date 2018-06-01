instance creation
newOnCategory: aCategory
	"Open a new browser on this category"

	"Browser newOnCategory: 'Tools-Browser'"

	^self newOnCategory: aCategory label:  'Classes in category ', aCategory
