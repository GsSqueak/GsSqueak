I am a context for compiling methods. I maintain the namespace of classes and global variables that are visible to the methods compiled within me.

I have the following instance variables:

info <EnvironmentInfo>
Metadata about me and the code I contain.

declarations <IdentityDictionary>
Bindings for class and other globals that have been declared inside me.

bindings <IdentityDictionary>
Bindings for all the class and global variables visible from the compiler.
It generally includes the declarations (see importSelf), plus other imports from other environments, including aliases.

policies      <Collection of: NamePolicy>
The list of rules for importing and exporting bindings to other environments.

observers      <Collection of: Environment>
These are the environments importing some bindings from self, and which should be notified whenever we add/remove/change some binding.
