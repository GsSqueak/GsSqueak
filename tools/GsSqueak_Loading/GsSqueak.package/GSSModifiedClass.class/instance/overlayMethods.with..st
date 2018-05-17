accessing
overlayMethods: originalMethods with: modifiedMethods

	| methods |
	methods := PluggableSet newFrom: modifiedMethods.
	methods equalBlock: [:m1 :m2 | m1 selector == m2 selector].
	methods addAll: originalMethods.
	^ methods asArray