accessing
sum
	"Optimized version. Use the sum(n * i - k, i=a..b) = -1/2 * (a - b - 1) *
	(n * (a + b) - 2 * k) equation with a = 1, n = step, b = self size and k
	= step - start."
	| _gsSqueakTemp_b |
	_gsSqueakTemp_b := self size.
	^ _gsSqueakTemp_b * (_gsSqueakTemp_b - 1 * step + (start * 2)) / 2