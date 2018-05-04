image save/restore
sqImage: memoryAddress read: fileStream size: elementSize length: length
	"Normally implemented in support code as fread().
	See CCodeGenerator>>writeDefaultMacrosOn: which specifies a default implementation."
 
	<inline: true>
	<returnTypeC: 'size_t'>
	<var: #memoryAddress type: 'char *'>
	<var: #elementSize type: 'size_t'>
	<var: #length type: 'size_t'>
	<var: #fileStream type: 'sqImageFile'>
	^ self sqImage: memoryAddress File: elementSize  ReadEntire: length Image: fileStream 

