initialize-release
roundNib: diameter
	"Makes this pen draw with a round dot of the given diameter."

	self sourceForm: (Form dotOfSize: diameter).
	combinationRule := Form paint.
