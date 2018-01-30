printing
reportableSize
	"Answer a size worth reporting as the receiver's size in a list view"
	| total |
	total := super reportableSize.
	submorphs
		do: [:m | total := total + m reportableSize].
	^ total