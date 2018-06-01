resize/collapse
adjustExtraButton
	labelButton
		ifNil: [^ self].
	labelButton position: self innerBounds topLeft + (20 @ -3);
		 extent: self innerBounds extent * (0.4 @ 1)