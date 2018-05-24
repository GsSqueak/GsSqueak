accessing
preferredExtent

	| iw ih lw lh |
	self currentImage ifNil: [^ 1@1].
	iw := self currentImage width.
	ih := self currentImage height.
	lw := self font widthOfString: (self label ifNil: ['']).
	lh := self font height.
	^ (iw + 3 + lw) @ (ih max: lh)