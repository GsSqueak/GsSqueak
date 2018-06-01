as yet unclassified
scrollToYAbsolute: yValue

	| transform transformedPoint |

	transform := scroller transformFrom: self.
	transformedPoint := transform localPointToGlobal: 0@yValue.

	self scrollBy: 0@(bounds top - transformedPoint y).
