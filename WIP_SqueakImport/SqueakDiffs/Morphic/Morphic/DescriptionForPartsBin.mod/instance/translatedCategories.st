accessing
translatedCategories
	"Answer translated the categoryList of the receiver"
	^ self categories
		collect: [:each | each translated]