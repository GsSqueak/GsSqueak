installing
installBaseMethodsInto: class

	self instanceMethods do: [:method |
		method isExtension ifFalse: [
			method installInto: class theNonMetaClass]].
	self classMethods do: [:method |
		method isExtension ifFalse: [
			method installInto: class theMetaClass]]