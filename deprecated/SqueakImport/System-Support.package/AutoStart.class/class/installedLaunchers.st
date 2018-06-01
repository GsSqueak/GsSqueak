private
installedLaunchers
	InstalledLaunchers ifNil: [
		InstalledLaunchers := OrderedCollection new].
	^InstalledLaunchers