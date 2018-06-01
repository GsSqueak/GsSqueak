import/export
importAllIcons
	"self importAllIcons; initialize"

	| icons |
	icons := FileDirectory default fileNames select: [:each | '*Icon.gif' match: each ].
	icons do: [:icon | self importIconNamed: (icon upTo: $.)] 