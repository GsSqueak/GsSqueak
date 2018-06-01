accessing
offset
	"There are basically two kinds of display objects in the system: those
	that, when asked to transform themselves, create a new object; and those
	that side effect themselves by maintaining a record of the transformation
	request (typically an offset). Path, like Rectangle and Point, is a display
	object of the first kind."

	self shouldNotImplement