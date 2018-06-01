saving
write: classDefinition with: classProxy

	| class | 
	class := classDefinition ifNil: [GSSNewClass new name: classProxy name; 
								comment: classProxy comment;
								category: classProxy category;
								superclass: classProxy superclassName;
								fileDirectory: (self fileDirectory createDirectory: classProxy name , '.new') ] .
	class updateFrom: classProxy.