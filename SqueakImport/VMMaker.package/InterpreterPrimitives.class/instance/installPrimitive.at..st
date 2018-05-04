primitive table
installPrimitive: selector at: anInteger
	"The primitive table is normally initialized at compile time. This allows an entry
	in the table to be istalled at runtime."

	<inline: false> "for readability"
	<var: 'selector' type: 'void *'>
	primitiveTable at: anInteger put: selector.
