private
createContainer
	"Private - Create a container"
	| container |
	container := BorderedMorph new.
	container extent: (self world extent * (1 / 4 @ (2 / 3))) rounded.
	container layoutPolicy: TableLayout new.
	container hResizing: #rigid.
	container vResizing: #rigid.
	container
		setColor: (Color gray: 0.9)
		borderWidth: 1
		borderColor: Color gray.
	container layoutInset: 0.
	"container useRoundedCorners."
	""
	container setProperty: #morphHierarchy toValue: true.
	container setNameTo: 'Objects Hierarchy' translated.
	""
	^ container