package Data::Sah::Coerce::perl::str::str_rgb24_from_colorname_X_or_code;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 3,
        might_fail => 1,
        enable_by_default => 0,
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
            "if (\$tmp =~ /\\A\#?([0-9a-f]{6})\\z/) { return [undef, \$1] } ",
            "unless (\%__Sah::colorcodes_X) { tie \%__Sah::colorcodes_X, 'Graphics::ColorNames', 'X' } ",
            "if (exists \$__Sah::colorcodes_X{\$tmp}) { return [undef, \$__Sah::colorcodes_X{\$tmp}] } ",
            "[\"Unknown color name \\'\$tmp\\'\"]", ),
        "}",
    );
    $res;
}

1;
# ABSTRACT: Coerce RGB24 code or color name (from Graphics::ColorNames::X scheme) to RGB24 code

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

The rule is not enabled by default. You can enable it in a schema using e.g.:

 ["color::rgb24", "x.perl.coerce_rules"=>["str_rgb24_from_colorname_X_or_code"]]
