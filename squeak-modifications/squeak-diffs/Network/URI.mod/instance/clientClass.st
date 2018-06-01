private
clientClass
	^Smalltalk at: (ClientClasses at: self scheme ifAbsent: [ClientClasses at: 'file'])