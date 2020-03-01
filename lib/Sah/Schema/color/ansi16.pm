package Sah::Schema::color::ansi16;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'ANSI-16 color, either a number from 0-15 or color names like "black", "bold red", etc',
    match => qr/\A(?:0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
                    (?:(bold|bright) \s )?(black|red|green|yellow|blue|magenta|cyan|white))\z/ix,
    examples => [
        {data=> 0, valid=>1},
        {data=>15, valid=>1},
        {data=>16, valid=>0},
        {data=>'black'  , valid=>1, res=>'black'},
        {data=>'foo'    , valid=>0},
    ],
}, {}];

1;
# ABSTRACT:
