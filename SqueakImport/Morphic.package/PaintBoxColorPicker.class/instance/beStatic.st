initialization
beStatic

	"an aid for Nebraska: make the color chart a static image to reduce traffic"
	image isStatic ifFalse: [
		image := image as: StaticForm
	].