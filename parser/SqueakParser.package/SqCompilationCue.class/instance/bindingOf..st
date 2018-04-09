binding
bindingOf: aSymbol
  self halt.
  ^ class bindingOf: ('Squeak' , aSymbol) asSymbol	"TODO: environment: environment"