class deps
classDepsIndex: idx
	"Class dependency selection"
	classDepsIndex := idx.
	self classListIndex: 0.
	self changed: #classDepsIndex.
	self changed: #classList.
