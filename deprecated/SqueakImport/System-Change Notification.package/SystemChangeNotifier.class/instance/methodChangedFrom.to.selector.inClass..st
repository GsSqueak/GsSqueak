system triggers
methodChangedFrom: oldMethod to: newMethod selector: aSymbol inClass: aClass
	self trigger: (ModifiedEvent
					methodChangedFrom: oldMethod
					to: newMethod
					selector: aSymbol 
					inClass: aClass)