This is a resumable error you get if you try to assign a readonly variable a value.
Name definitions in the module system can be read only and are then created using instances of ReadOnlyVariableBinding instead of Association.
See also LookupKey>>beReadWriteBinding and LookupKey>>beReadOnlyBinding.

