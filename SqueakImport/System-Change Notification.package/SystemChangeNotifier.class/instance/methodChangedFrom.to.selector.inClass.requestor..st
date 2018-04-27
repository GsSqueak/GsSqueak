system triggers
methodChangedFrom: oldMethod to: newMethod selector: aSymbol inClass: aClass requestor: requestor
	self trigger: (ModifiedEvent
					methodChangedFrom: oldMethod
					to: newMethod
					selector: aSymbol 
					inClass: aClass
					requestor: requestor)