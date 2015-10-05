name 'methylation'
maintainer "Jörgen Brandt"
maintainer_email "brandjoe@hu-berlin.de"
license 'all_rights'
description 'Installs/Configures methylation'
long_description 'Installs/Configures methylation'
version '0.1.0'

recipe "methylation::_common", "Performs an update of the package system."
recipe "methylation::default", "Sets up all preconditions to run the methylation workflow."


depends "chef-bioinf-worker"
depends "chef-cuneiform"
