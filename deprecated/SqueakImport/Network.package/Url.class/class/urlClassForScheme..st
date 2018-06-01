parsing
urlClassForScheme: scheme
	^ SchemeRegistry at: scheme ifAbsent: [GenericUrl].