initialization
reset

	origin := 0@0.							"origin of the top-left corner of this cavas"
	form ifNil:[
		"This code path will never be executed after the changes in setForm:
		are installed, so it can be removed in due time."
		clipRect := (0@0 corner: 10000@10000).
	] ifNotNil:[
		clipRect := (0@0 corner: form extent).	"default clipping rectangle"
	].
	self shadowColor: nil.