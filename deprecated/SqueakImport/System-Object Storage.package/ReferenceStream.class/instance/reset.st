writing
reset
	"PRIVATE -- Reset my internal state.
	   11/15-17/92 jhm: Added transients and fwdRefEnds.
	   7/11/93 sw: Give substantial initial sizes to avoid huge time spent growing.
	   9/3/93 sw: monster version for Sasha"

	super reset.
	references := IdentityDictionary new: 4096 * 5.
"	objects := IdentityDictionary new: 4096 * 5.
	fwdRefEnds := IdentityDictionary new.
"
	blockers ifNil: [blockers := IdentityDictionary new].
 