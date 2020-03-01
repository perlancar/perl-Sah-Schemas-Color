package Sah::Schema::color::ansi256;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [int => {
    summary => 'ANSI-256 color, an integer number from 0-255',
    min => 0,
    max => 255,
    examples => [
        {data=>  0, valid=>1},
        {data=>255, valid=>1},
        {data=>256, valid=>0},
        {data=>'black'  , valid=>0}, # not supported yet
        {data=>'foo'    , valid=>0},
    ],
}, {}];

1;
# ABSTRACT:
