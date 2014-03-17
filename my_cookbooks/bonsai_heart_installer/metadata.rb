name             'bonsai_heart_installer'
maintainer       'Stefano Germani'
maintainer_email '...'
license          'All rights reserved'
description      'Install bonsai_heart app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'bonsai_heart_installer', 'Install bonsai_heart app'

supports 'ubuntu'
supports 'debian'