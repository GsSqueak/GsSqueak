private
translatedString: index
	"KNOWN PROBLEM: conversion is executed everytimes this method called"
	| str |
	str := translatedStrings at: index.

	^str utf8ToSqueak applyLanguageInformation: (Locale localeID: localeID) languageEnvironment.
