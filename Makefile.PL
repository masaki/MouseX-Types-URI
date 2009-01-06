use inc::Module::Install;
name 'MouseX-Types-URI';
all_from 'lib/MouseX/Types/URI.pm';

requires 'Mouse' => '0.14';
requires 'MouseX::Types';
requires 'MouseX::Types::Path::Class';
requires 'namespace::clean';
requires 'URI';
requires 'URI::FromHash';

tests 't/*.t';
test_requires 'Test::More';
test_requires 'ok';
author_tests 'xt';
use_test_base;

auto_include_deps;
WriteAll;
