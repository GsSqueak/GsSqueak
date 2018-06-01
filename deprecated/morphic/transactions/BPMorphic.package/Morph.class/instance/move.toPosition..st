-Etoys-geometry
move: aMorph toPosition: aPointOrNumber 
	"Support for e-toy demo. Move the given submorph to the given
	position. Allows the morph's owner to determine the policy for motion.
	For example, moving forward through a table might mean motion
	only in the x-axis with wrapping modulo the table size."
	aMorph position: aPointOrNumber asPoint