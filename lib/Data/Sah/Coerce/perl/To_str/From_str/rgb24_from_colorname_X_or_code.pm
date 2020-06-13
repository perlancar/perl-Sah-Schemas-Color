package Data::Sah::Coerce::perl::To_str::From_str::rgb24_from_colorname_X_or_code;

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
        summary => 'Coerce RGB24 code or color name (from Graphics::ColorNames::X scheme) to RGB24 code',
        might_fail => 1,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "!ref($dt)";
    $res->{modules}{"Graphics::ColorNames"} //= 0;
    $res->{modules}{"Graphics::ColorNames::X"} //= 0;

    $res->{expr_coerce} = join(
        "",
        "do { ", (
            "my \$tmp = lc $dt;",
            "if (\$tmp =~ /\\A\#?([0-9a-f]{6})\\z/) { [undef, \$1] } ",
            "else { ",
            "  unless (\%__Sah::colorcodes_X) { tie \%__Sah::colorcodes_X, 'Graphics::ColorNames', 'X' } ",
            "  if (exists \$__Sah::colorcodes_X{\$tmp}) { [undef, \$__Sah::colorcodes_X{\$tmp}] } ",
            "  else { [\"Unknown color name \\'\$tmp\\'\"] } ",
            "} ",
        ),
        "}",
    );
    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
