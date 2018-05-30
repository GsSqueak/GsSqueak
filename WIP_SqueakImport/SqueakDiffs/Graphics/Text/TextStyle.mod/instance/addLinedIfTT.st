*TrueType
addLinedIfTT

	(fontArray first isKindOf: TTCFont) ifFalse: [^ self].

	fontArray do: [:f |
		f addLined.
	].
