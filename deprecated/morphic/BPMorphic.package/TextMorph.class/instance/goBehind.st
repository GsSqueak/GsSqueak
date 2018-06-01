submorphs-add/remove
goBehind
	"We need to save the container, as it knows about fill and run-around"
	| _gsSqueakTemp_cont |
	container
		ifNil: [^ super goBehind].
	self releaseParagraph.
	"Cause recomposition"
	_gsSqueakTemp_cont := container.
	"Save the container"
	super goBehind.
	"This will change owner, nilling the container"
	container := _gsSqueakTemp_cont.
	"Restore the container"
	self changed