translation
translate: aString toLocaleID: localeID
	"translate for default domain"
	^ (self availableForLocaleID: localeID)
		translate: aString