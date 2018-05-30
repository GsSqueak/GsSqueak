as yet unclassified
darkenedForm
	^ darkenedForm ifNil: [ darkenedForm := self firstSubmorph baseGraphic darker ]