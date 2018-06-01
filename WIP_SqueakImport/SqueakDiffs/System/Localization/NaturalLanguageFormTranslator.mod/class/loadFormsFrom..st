i/o
loadFormsFrom: aStream

	| rr pair inst |
	rr := ReferenceStream on: aStream.
	pair := rr next.
	inst := self localeID: (LocaleID isoString: pair first).
	pair second associationsDo: [:assoc |
		inst name: assoc key form: assoc value.
	].
	^ inst.
