examples
example
	"Draw a spiral with a pen that is 2 pixels wide."
	"Display restoreAfter: [Pen example]"

	| bic |
	bic := self new.
	bic defaultNib: 2.
	bic color: Color blue.
	bic combinationRule: Form over.
	1 to: 100 do: [:i | bic go: i*4. bic turn: 89].
