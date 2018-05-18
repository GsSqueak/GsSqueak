other
removeAllButFirstSubmorph
	"Remove all of the receiver's submorphs other than the first one."

	self submorphs allButFirst do: [:m | m delete]