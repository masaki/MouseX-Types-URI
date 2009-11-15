use Test::More;
use URI;
use URI::WithBase;

{
    package Foo;
    use Mouse;
    use MouseX::Types::URI;

    has 'uri'  => (is => 'ro', isa => 'URI',       coerce => 1);
    has 'base' => (is => 'ro', isa => 'URI',       coerce => 1);
    has 'data' => (is => 'ro', isa => 'URI::data', coerce => 1);
    has 'file' => (is => 'ro', isa => 'URI::file', coerce => 1);
}

{
    package Bar;
    use Mouse;
    use MouseX::Types::URI qw( Uri DataUri FileUri );

    has 'uri'  => (is => 'ro', isa => Uri,     coerce => 1);
    has 'base' => (is => 'ro', isa => Uri,     coerce => 1);
    has 'data' => (is => 'ro', isa => DataUri, coerce => 1);
    has 'file' => (is => 'ro', isa => FileUri, coerce => 1);
}

my $uri  = URI->new('http://localhost');
my $base = URI::WithBase->new('foo', $uri);
my $data = URI->new('data:'); $data->data('bar');
my $file = URI->new('file:///path/to');

for my $class (qw(Foo Bar)) {
    my $obj = $class->new( uri => "$uri", base => $base, data => \"$data", file => $file );
    isa_ok $obj => $class;
    isa_ok $obj->uri  => 'URI';
    isa_ok $obj->base => 'URI::WithBase';
    isa_ok $obj->data => 'URI::data';
    isa_ok $obj->file => 'URI::file';
    is $obj->uri  => $uri;
    is $obj->base => $base;
    is $obj->data => $data;
    is $obj->file => $file;
}

done_testing;
