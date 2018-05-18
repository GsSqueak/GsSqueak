visual properties
highlightedForm
	^ highlightedForm ifNil: [ highlightedForm := self firstSubmorph baseGraphic lighter ]