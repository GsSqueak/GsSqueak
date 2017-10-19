baseline
baseline: spec
  <baseline>
  spec for: #'gs3.4.x' do: [ spec
        package: 'Cypress-Environmental-Tools';
        package: 'GsSqueak-GemStone-Tools'
		with: [ spec requires: #( 'Cypress-Environmental-Tools' ) ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('GsSqueak-GemStone-Tools');
        yourself ]
