use inc::Module::Install;
name 'MouseX-Types-URI';
all_from 'lib/MouseX/Types/URI.pm';

requires 'Mouse' => '0.15';
requires 'MouseX::Types' => '0.01';
requires 'MouseX::Types::Path::Class' => '0.03';
requires 'namespace::clean';
requires 'URI';
requires 'URI::FromHash';

recommends 'MouseX::Getopt';

tests 't/*.t';
test_requires 'Test::More';
test_requires 'ok';
author_tests 'xt';
use_test_base;

auto_include_deps;
WriteAll;
