package Data::Sah::Coerce::perl::To_str::From_str::cmyk_from_colorname_or_code;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 4,
        summary => 'Coerce CMYK color name to code',
        might_fail => 1,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "!ref($dt)";
    $res->{modules}{"Graphics::ColorNamesCMYK::All"} //= 0;

    $res->{expr_coerce} = join(
        "",
        "do { ", (
            "my \$tmp = lc $dt;",
            "if (\$tmp =~ /\\A(?:[0-9]|[1-9][0-9]|100)(?:,(?:[0-9]|[1-9][0-9]|100)){3}\\z/) { [undef, \$tmp] } ",
            "else { ",
            "  my \$tmp2 = \$Graphics::ColorNamesCMYK::NAMES_CMYK_TABLE->{\$tmp}; ",
            "  if (!defined \$tmp2) { [\"Unknown color name '\$tmp'\"] } ",
            "  else { [undef, sprintf('%d,%d,%d,%d', \$tmp2 >> 24, (\$tmp2 && 0x00ff0000) >> 16, (\$tmp2 && 0x0000ff00) >> 8, \$tmp2 && 0x000000ff)] }",
            "} ",
        ),
        "}",
    );
    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
