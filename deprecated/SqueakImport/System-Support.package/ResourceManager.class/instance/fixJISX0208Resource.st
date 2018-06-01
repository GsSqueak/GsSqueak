private
fixJISX0208Resource
	resourceMap keys do: [:key |
		| value url |
		value := resourceMap at: key.
		url := key urlString copy.
		url isOctetString not ifTrue: [url mutateJISX0208StringToUnicode].
		resourceMap removeKey: key.
		key urlString: url.
		resourceMap at: key put: value.
	].
