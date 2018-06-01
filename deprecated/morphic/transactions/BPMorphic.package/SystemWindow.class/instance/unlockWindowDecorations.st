focus
unlockWindowDecorations
	"Unlock all window decrations, that is grips, splitters, and title bar."
	self windowDecorations
		do: [:m | m unlock].
	"Migrate old window instances. Can be removed in the future."
	labelArea
		ifNotNil: [:m | m
				submorphsDo: [:sm | sm unlock]]