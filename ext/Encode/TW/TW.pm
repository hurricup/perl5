package Encode::TW;
BEGIN {
    if (ord("A") == 193) {
	die "Encode::TW not supported on EBCDIC\n";
    }
}
our $VERSION = do { my @r = (q$Revision: 0.97 $ =~ /\d+/g); sprintf "%d."."%02d" x $#r, @r };

use Encode;
use XSLoader;
XSLoader::load('Encode::TW',$VERSION);

1;
__END__
=head1 NAME

Encode::TW - Taiwan-based Chinese Encodings

=head1 SYNOPSIS

    use Encode qw/encode decode/; 
    $big5 = encode("big5", $utf8); # loads Encode::TW implicitly
    $utf8 = decode("big5", $big5); # ditto

=head1 DESCRIPTION

This module implements Taiwan-based Chinese charset encodings.
Encodings supported are as follows.

  Canonical   Alias		Description
  --------------------------------------------------------------------
  big5        /big-?5$/i	The original Big5 encoding
  big5-hkscs  /big5-hk(scs)?$/i	Big5 plus Cantonese characters in 
                                Hong Kong
  cp950		                Code Page 950 
                                (Big5 + Microsoft vendor mappings)
  --------------------------------------------------------------------

To find how to use this module in detail, see L<Encode>.

=head1 NOTES

Due to size concerns, C<EUC-TW> (Extended Unix Character) and C<BIG5PLUS>
(CMEX's Big5+) are distributed separately on CPAN, under the name
L<Encode::HanExtra>. That module also contains extra China-based encodings.

=head1 BUGS

The C<CNS11643> encoding files are not complete (only the first two planes,
C<11643-1> and C<11643-2>, exist in the distribution). For common CNS11643
manipulation, please use C<EUC-TW> in L<Encode::HanExtra>, which contains
plane 1-7.

ASCII part (0x00-0x7f) is preserved for all encodings, even though it
conflicts with mappings by the Unicode Consortium.  See

F<http://www.debian.or.jp/~kubota/unicode-symbols.html.en>

to find why it is implemented that way.

=head1 SEE ALSO

L<Encode>

=cut
