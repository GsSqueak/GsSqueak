drawing
drawCharactersOn: aCanvas
	| glyph origin r offset cy m |
	0 to: 255 do: [:i |
		glyph := font at: i.
		origin := font bounds extent * ((i \\ 16) @ (i // 16)).
		r := origin extent: font bounds extent.
		offset := r center - glyph bounds center.
		cy := glyph bounds center y.
		m := MatrixTransform2x3 withOffset: 0@cy.
		m := m composedWithLocal: (MatrixTransform2x3 withScale: 1 @ -1).
		m := m composedWithLocal: (MatrixTransform2x3 withOffset: 0 @ cy negated).
		m := m composedWithGlobal: (MatrixTransform2x3 withOffset: offset).
		aCanvas asBalloonCanvas preserveStateDuring: [:balloonCanvas |
			balloonCanvas transformBy: m.
			balloonCanvas drawGeneralBezierShape: glyph contours
					color: color
					borderWidth: 0
					borderColor: Color black.
		].
	].