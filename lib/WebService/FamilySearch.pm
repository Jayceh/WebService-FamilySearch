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

sub current_person {
  my $self = shift;
  my $ret = $self->_http->get( $self->host . '/platform/tree/current-person', { headers => $self->_default_http_args });
  debug decode_json($ret->{'content'});
  my $person = WebService::FamilySearch::Person->new( decode_json( $ret->{'content'} ) );
};


1;
__END__

=head1 DOCUMENTATION

Developer Documentation available at: 

https://familysearch.org/developers/docs/api

Getting developer credentials can be done at:

https://familysearchcommunity.force.com/Developer/

=head1 ENVIRONMENTS

=head2 SANDBOX

The sandbox is an empty environment that you can use to play around with any data. Applications can be setup thought the developer site, as well as user creation and credentials

=head2 BETA

The BETA environment is a clone of the live tree, and you will use your own OAuth credentials to log in and work with the real data. Credentials must be approved from the FamilySearch group.

=over


