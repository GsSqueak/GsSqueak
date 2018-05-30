ui creation
createSystemWindowLayoutWithCaptionPane

	| buttonsHeight captionHeight |

	buttonsHeight := 33.
	captionHeight := 28.

	self addFullPanesTo: self morphicView
		from: {
				{
					(self captionPane). 
					(0 @ 0 corner: 1 @ 0). 
					(0 @ 0 corner: 0 @ captionHeight)
				}.
				{
					(self buttonPane).
					(0 @ 0 corner: 1 @ 0).
					(0 @ captionHeight corner: 0 @ (captionHeight + buttonsHeight))
				}.
				{
					(self directoryPane).
					(0 @ 0 corner: 0.5 @ 1).
					(0 @ (captionHeight + buttonsHeight) corner: 0 @ 0)
				}.
				{
					(self filePane).
					(0.5 @ 0 corner: 1 @ 1).
					(0 @ (captionHeight + buttonsHeight) corner: 0 @ 0)
				}
			}