initialize-release
setSpec: aSpec
	state := IdentityDictionary new.
	spec := aSpec.
	spec model addDependent: self.
	self refresh.