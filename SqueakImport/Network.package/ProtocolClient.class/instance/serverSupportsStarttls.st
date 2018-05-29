testing
serverSupportsStarttls

	^ self serverCapabilities at: self starttlsVerb ifAbsent: [false]