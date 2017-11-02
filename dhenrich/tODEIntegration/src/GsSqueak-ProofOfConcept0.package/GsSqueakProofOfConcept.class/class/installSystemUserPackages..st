private
installSystemUserPackages: packageNames
  "expect to be installing methods as SystemUser"

  "abort at beginning and commit at end"

  | packageManager repo gsSqueakUser |
  System abort.
  packageManager := CypressEnvironmentPackageManager new.
  repo := CypressAbstractRepository onUrl: self repositoryUrl alias: ''.
  packageManager defaultEnvironmentId: 7.
  packageNames
    do: [ :packageName | 
      packageManager
        addResolvedReference:
          (CypressResolvedReference name: packageName repository: repo) ].
  packageManager loadResolvedReferences.
  System commit