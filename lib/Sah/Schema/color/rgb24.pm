package Sah::Schema::color::rgb24;

# DATE
# VERSION

our $schema = [str => {
    summary => 'RGB 24-digit color, a hexdigit e.g. ffcc00', # XXX also allow other forms
    match => qr/\A[0-9A-Fa-f]{6}\z/,
}, {}];

1;
# ABSTRACT:
