use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl extension for generating XML",
  "AUTHOR" => "Benjamin Holzman <bholzman\@gmail.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "XML-Generator",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.008",
  "NAME" => "XML::Generator",
  "PREREQ_PM" => {},
  "TEST_REQUIRES" => {
    "Test" => 0
  },
  "VERSION" => "1.09",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Test" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
