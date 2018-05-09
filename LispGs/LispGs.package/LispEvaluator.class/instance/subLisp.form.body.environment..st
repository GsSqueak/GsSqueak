private
subLisp: aSymbol form: aForm body: aConsCell environment: aLKEnvironment
  "local scope is implemented by creating a temporary copy of the whole
	interpreter where local bindings will be made. this method is the
	place for defining how exactly the copy should be made.
	
	the 'body' argument is used by CLisp for handling of declarations. see
	how it overrides this method"

  ^ self copy
    environment: aLKEnvironment;
    upperLisp: self;
    upperHead: aSymbol;
    upperTail: aForm