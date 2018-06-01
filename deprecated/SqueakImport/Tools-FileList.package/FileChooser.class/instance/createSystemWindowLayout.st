ui creation
createSystemWindowLayout
	"Create a layout suitable for a SystemWindow file chooser."

	| buttonsHeight |

	buttonsHeight := 33.

	self addFullPanesTo: self morphicView
		from: {
				{
					(self buttonPane).
					(0 @ 0 corner: 1 @ 0).
					(0 @ 0 corner: 0 @ buttonsHeight)
				}.
				{
					(self directoryPane).
					(0 @ 0 corner: 0.5 @ 1).
					(0 @ buttonsHeight corner: 0 @ 0)
				}.
				{
					(self filePane).
					(0.5 @ 0 corner: 1 @ 1).
					(0 @ buttonsHeight corner: 0 @ 0)
				}
			}