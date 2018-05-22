read write
uniClassInstVarsRefs: dummy
	"If some of the objects seen so far are instances UniClasses, check the UniClasses for extra class inst vars, and send them to the steam also.  The new objects get added to (dummy references), where they will be noticed by the caller.  They will wind up in the structures array and will be written on the disk by class.
	Return all classes seen." 
| uniClasses normal more aUniClass mySize allClasses |

"Note: Any classes used in the structure of classInstVars must be written out also!"
uniClasses := Set new.
allClasses := IdentitySet new.
normal := Object class instSize.
more := true.
[more] whileTrue: [
	more := false.
	dummy references keysDo: [:each | "any faster way to do this?"
		(aUniClass := each class) isSystemDefined ifFalse: [
			(uniClasses includes: aUniClass name) ifFalse: [
				mySize := aUniClass class instSize.
				normal+1 to: mySize do: [:ii | 
					more := true.
					dummy nextPut: (aUniClass instVarAt: ii)].
				uniClasses add: aUniClass name]].
		each class class isMeta ifFalse: ["it is a class" allClasses add: each]]].
"References dictionary is modified as the loop proceeds, but we will catch any we missed on the next cycle."

^ allClasses