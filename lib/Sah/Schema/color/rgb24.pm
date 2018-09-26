package Sah::Schema::color::rgb24;

# DATE
# VERSION

our $schema = [str => {
    summary => 'RGB 24-digit color, a hexdigit e.g. ffcc00', # XXX also allow other forms
    match => qr/\A[0-9A-Fa-f]{6}\z/,
    'x.completion' => ['colorname'],
    'x.perl.coerce_rules' => ['str_rgb24_from_colorname_X_or_code'],
}, {}];

1;
# ABSTRACT:

=head1 DESCRIPTION

Accepts color codes (with optional pound sign prefix, which will be removed), e.g.:

 ffff00
 #80FF00

Color names (from L<Graphics::ColorNames::X>) are also accepted and will be
coerced to its RGB code, e.g.:

 black

(will be coerced to C<000000>)
