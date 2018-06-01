instance creation
selector: aSelector method: aMethod protocol: prot class: aClass oldProtocol: oldName

	^(self method: aMethod protocol: prot class: aClass) 
		itemSelector: aSelector;
		oldCategory: oldName;
		yourself