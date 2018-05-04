image save/restore
sqImage: memoryAddress write: fileStream size: elementSize length: length
	"Normally implemented in support code as fwrite()"

	<inline: true>
	<returnTypeC: 'size_t'>
	<var: #memoryAddress type: 'char *'>
	<var: #elementSize type: 'size_t'>
	<var: #length type: 'size_t'>
	<var: #fileStream type: 'sqImageFile'>
	^ self sq: memoryAddress Image: elementSize File: length Write: fileStream "sqImageFileWrite()"
