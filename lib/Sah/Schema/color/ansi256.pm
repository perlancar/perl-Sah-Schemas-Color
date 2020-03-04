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
        {value=>  0, valid=>1},
        {value=>255, valid=>1},
        {value=>256, valid=>0},
        {value=>'black'  , valid=>0}, # not supported yet
        {value=>'foo'    , valid=>0},
    ],
}, {}];

1;
# ABSTRACT:
