package WebService::FamilySearch;
# ABSTRACT: Library for interfacing with the FamilySearch API 

=head1 SYNOPSIS

use WebService::FamilySearch;
my $FS = WebService::FamilySearch->new;
$FS->oauth_token($oauth_token);

=cut

use strict;
use warnings;
use v5.10;
use Moo;
use JSON qw( decode_json encode_json );
use WebService::FamilySearch::Person;
use Data::Debug;

sub _http { my $self = shift; $self->{'http'} ||= do { require HTTP::Tiny; HTTP::Tiny->new( %{ $self->_default_http_args } ) } }

sub _default_http_args { my $self = shift; return { timeout => 120, authorization => 'Bearer ' .$self->oauth_token, accept => 'application/x-fs-v1+json', } }

has default_headers =>  (
  is      => 'rw',
  lazy    =>  1,
  default => sub {
    my $self = shift;
    return {
      timeout       => 120,
      authorization => 'Bearer ' . $self->oauth_token,
      accept        => 'application/x-gedcomx-atom+json'
      };
  },
);

has oauth_token     => (
  is =>  'rw',
);

has environment => (
  is => 'rw',
);

has host =>  (
  is =>  'rw',
  default => sub {
    return 'https://beta.familysearch.org';
  },
);


__END__
