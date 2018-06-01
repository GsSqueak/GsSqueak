world menu
removeAllViewers
	"Delete all the viewers lined up along my right margin."

	(self submorphs select: [:m | m isKindOf: ViewerFlapTab]) do:
		[:m |
			m referent ifNotNil: [m referent delete].
			m delete.]