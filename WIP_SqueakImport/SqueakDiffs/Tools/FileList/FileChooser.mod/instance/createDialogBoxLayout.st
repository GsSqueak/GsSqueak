ui creation
createDialogBoxLayout
	"Create a layout suitable for a MorphicModel file chooser."

	| inset insetNeg captionTop captionBottom buttonsBottom buttonsTop contentTop contentBottom |

	inset := 6.
	insetNeg := inset negated.
	captionTop := 0.
	captionBottom := 33.
	contentTop := captionBottom + inset.
	contentBottom := -30 - inset - inset.
	buttonsTop := contentBottom + inset.
	buttonsBottom := insetNeg.

	self addFullPanesTo: self morphicView
		from: {
				{
					(self captionPane).
					(0 @ 0 corner: 1 @ 0).
					(0 @ captionTop corner: 0 @ captionBottom)
				}.
				{
					(self buttonPane).
					(0 @ 1 corner: 1 @ 1).
					(inset @ buttonsTop corner: insetNeg @ buttonsBottom)
				}.
				{
					(self directoryPane).
					(0 @ 0 corner: 0.5 @ 1).
					(inset @ contentTop corner: insetNeg @ contentBottom)
				}.
				{
					(self filePane).
					(0.5 @ 0 corner: 1 @ 1).
					(inset @ contentTop corner: insetNeg @ contentBottom)
				}
			}