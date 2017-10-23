baseline
baseline: spec
  <baseline>
  spec
    for: #'gs643.4.x'
    do: [ 
      spec
        package: 'GsSqueak-ProoofOfConcept1-GsSqueak';
        yourself ].
  spec
    for: #'gs3.4.x'
    do: [ 
      spec
        package: 'Cypress-Environmental-Tools';
        package: 'GsSqueak-Tode-Tools'
          with: [ spec requires: #('Cypress-Environmental-Tools') ];
        package: 'GsSqueak-Tode-ProofOfConecept1'
          with: [ 
              spec
                requires: #('GsSqueak-Tode-Tools');
                postLoadDoIt: #'installGsSqueakUserPackages' ];
        package: 'GsSqueak-GemStone-Tools'
          with: [ spec requires: #('Cypress-Environmental-Tools') ];
        yourself.
      spec
        group: 'default' with: #('Tools');
        group: 'Tools' with: #('GsSqueak-Tode-Tools');
        yourself ]