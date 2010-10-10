# extlib_lite

extlib_lite is a super lightweight alternative to [activesupport](http://github.com/rails/rails/tree/master/activesupport) or [extlib](http://github.com/datamapper/extlib). It contains some of the usual friends such as pluralize, singularize, classify, and constantize without the overhead of its big brothers. I take no credit for extlib_lite, I simply extracted the code from [activesupport](http://github.com/rails/rails/tree/master/activesupport) and [extlib](http://github.com/datamapper/extlib).
## Supported Functions
Currently extlib_lite supports the following functions
### String
* pluralize
* singularize
* classify
* constantize
* underscore
* to_const_path

### Hash
* stringify

## Installation

    gem install extlib_lite
    require 'extlib_lite'

Copyright (c) 2010 David Wilkie, released under the MIT license

