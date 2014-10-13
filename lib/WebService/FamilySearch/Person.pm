package WebService::FamilySearch::Person;
use strict;
use warnings;

use Moo;

has result_codes => (
  is => 'ro',
);

has content => (
  is =>  'rw',
);

has description =>  (
  is => 'rw',
);

has places  =>  (
  is => 'rw',
);

has sourceDescriptions  =>  (
  is => 'rw',
);

1;
