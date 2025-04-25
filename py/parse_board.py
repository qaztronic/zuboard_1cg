#

import xml.etree.ElementTree as ET

tree = ET.parse('../../bdf/zub1cg/1.2/part0_pins.xml')
root = tree.getroot()

package_pin_str = 'set_property PACKAGE_PIN %s [get_ports {%s}]'
iostandard_str = 'set_property IOSTANDARD %s [get_ports {%s}]'

for child in root:
  for pin in child:
    print(package_pin_str % (pin.attrib['loc'], pin.attrib['name']))

print(40*'# ')

for child in root:
  for pin in child:
    print(iostandard_str % (pin.attrib['iostandard'], pin.attrib['name']))

