accessing
switchTo: locale gently: gentlyFlag
	"Locale switchTo: (Locale isoLanguage: 'de')"
	| availableID |
	availableID := (NaturalLanguageTranslator availableForLocaleID: locale localeID) localeID.
	Current localeID = availableID
		ifFalse: [Previous := Current.
				CurrentPlatform := Current := Locale localeID: availableID.
				NaturalLanguageTranslator localeChanged.
				gentlyFlag ifTrue: [self localeChangedGently] ifFalse: [self localeChanged]]