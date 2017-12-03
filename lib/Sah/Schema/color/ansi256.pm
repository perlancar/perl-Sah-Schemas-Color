package Sah::Schema::color::ansi256;

# DATE
# VERSION

our $schema = [int => {
    summary => 'ANSI-256 color, an integer number from 0-255',
    min => 0,
    max => 255,
}, {}];

# ABSTRACT:
