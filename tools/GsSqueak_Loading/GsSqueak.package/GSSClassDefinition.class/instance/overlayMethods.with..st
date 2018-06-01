accessing
overlayMethods: originalMethods with: modifiedMethods

	| methods |
	methods := Dictionary new.
	originalMethods do: [:method | methods at: method selector put: method].
	modifiedMethods do: [:method | methods at: method selector put: method].
	^ methods values asArray