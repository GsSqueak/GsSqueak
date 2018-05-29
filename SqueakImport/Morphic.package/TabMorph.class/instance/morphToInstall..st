as yet unclassified
morphToInstall: m
	morphToInstall := m.
	self contents: m externalName.
	self actionSelector: #tabSelected.
	self target: self