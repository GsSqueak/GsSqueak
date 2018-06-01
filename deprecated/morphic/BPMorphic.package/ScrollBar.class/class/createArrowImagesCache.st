class initialization
createArrowImagesCache
	"creates the cache to store the arrow forms"
	^ LRUCache
		size: 40
		factory: [:key | ""
			self
				createArrowOfDirection: key first
				size: key second
				color: key third]