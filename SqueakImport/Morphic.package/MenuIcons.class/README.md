I represent a registry for icons.  You can see the icons I contain using the following script:

| dict methods |
dict := Dictionary new. 
methods := MenuIcons class selectors select: [:each | '*Icon' match: each asString].
methods do: [:each | dict at: each put: (MenuIcons perform: each)].
GraphicalDictionaryMenu openOn: dict withLabel: 'MenuIcons'