package Sah::Schema::color::cmyk;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'CMYK color in the format of C,M,Y,K where each component is an integer between 0-100, e.g. 0,0,0,50 (gray)', # XXX also allow other form
    match => qr/\A(?:[0-9]|[1-9][0-9]|100)(?:,(?:[0-9]|[1-9][0-9]|100)){3}\z/,
    'x.completion' => ['colorname'],
    'x.perl.coerce_rules' => ['From_str::cmyk_from_colorname_or_code'],
    examples => [
        {value=>'0,0,0,0', valid=>1},
        {value=>'0,0,0, 0', valid=>0, summary=>'Whitespace currently not allowed'},
        {value=>'0,0,0', valid=>0, summary=>'Too few numbers'},
        {value=>'0,0,0,0,0', valid=>0, summary=>'Too many numbers'},
        {value=>'0,0,0,101', valid=>0, summary=>'Invalid number (not 0-100)'},
        {value=>'0,0,0,-2', valid=>0, summary=>'Invalid number (not 0-100)'},
        {value=>'0,0,0,1.5', valid=>0, summary=>'Invalid number (not integer)'},
        {value=>'foo', valid=>0, summary=>'Invalid syntax, not a comma-separated list of numbers'},
        # XXX test color name conversion
    ],
}];

1;
# ABSTRACT:

=head1 DESCRIPTION

Accepts color name, e.g.:

 deep red   # becomes "25,100,100,25"

Color names are taken from L<Graphics::ColorNamesCMYK::All>.
