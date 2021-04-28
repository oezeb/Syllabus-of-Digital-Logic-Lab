## Hexa Digit Display
set_property -dict { PACKAGE_PIN A14  IOSTANDARD LVCMOS33 } [get_ports { out[0] }];
set_property -dict { PACKAGE_PIN A13  IOSTANDARD LVCMOS33 } [get_ports { out[1] }];
set_property -dict { PACKAGE_PIN A16  IOSTANDARD LVCMOS33 } [get_ports { out[2] }];
set_property -dict { PACKAGE_PIN A15  IOSTANDARD LVCMOS33 } [get_ports { out[3] }];

## FPGAOL SWITCH
set_property -dict { PACKAGE_PIN D14  IOSTANDARD LVCMOS33 } [get_ports { a[0] }];
set_property -dict { PACKAGE_PIN F16  IOSTANDARD LVCMOS33 } [get_ports { a[1] }];
set_property -dict { PACKAGE_PIN G16  IOSTANDARD LVCMOS33 } [get_ports { a[2] }];
set_property -dict { PACKAGE_PIN H14  IOSTANDARD LVCMOS33 } [get_ports { a[3] }];