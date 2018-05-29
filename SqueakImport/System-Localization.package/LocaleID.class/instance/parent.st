accessing
parent
	^ (self class
			isoLanguage: self isoLanguage)
			isoCountry: nil;
			yourself