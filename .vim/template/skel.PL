use strict;
use inc::Module::Install;

name('Hoge-Fuge-Foo');
all_from('lib/Hoge/Fuga/Foo.pm');

require('Template::Toolkit');
require('Encode');
require('Encode::Guess');
test_require('Test::More');

WriteAll;
