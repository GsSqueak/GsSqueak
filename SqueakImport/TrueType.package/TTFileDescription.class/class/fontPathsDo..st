font paths
fontPathsDo: aBlock
	"Evaluate aBlock with all of the font paths that should be searched on the current platform"

	"Start with the current directory"
	aBlock value: FileDirectory default pathName.

	"Then subdirectory 'fonts'"
	aBlock value: (FileDirectory default directoryNamed: 'fonts') pathName.

	"Platform specific directories"
	Smalltalk platformName caseOf:{
		['Win32']	->	[
			"Standard Windows fonts directory"
			aBlock value: 'C:\Windows\Fonts'.
		].
		['Mac OS']	->	[
			"Standard system fonts directories"
			#('/System/Library/Fonts' '/Library/Fonts') do: [:fontDir |
				aBlock value: fontDir].
		].
		['unix']		->	[ | base |
			"Standard fonts are in /usr/share/fonts/*"
			base := '/usr/share/fonts'.
			(FileDirectory on: base) directoryTreeDo: [ :path |
				path last isDirectory ifTrue: [
					aBlock value: path last fullName ] ].
		].
	} otherwise:[].
	