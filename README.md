# NAME

WebService::FamilySearch - Library for interfacing with the FamilySearch API 

# VERSION

version 0.001

# SYNOPSIS

use WebService::FamilySearch;

my $FS = WebService::FamilySearch->new;

$FS->oauth\_token($oauth\_token);

# DOCUMENTATION

Developer Documentation available at: 

https://familysearch.org/developers/docs/api

Getting developer credentials can be done at:

https://familysearchcommunity.force.com/Developer/

# ENVIRONMENTS

## SANDBOX

The sandbox is an empty environment that you can use to play around with any data. Applications can be setup thought the developer site, as well as user creation and credentials

## BETA

The BETA environment is a clone of the live tree, and you will use your own OAuth credentials to log in and work with the real data. Credentials must be approved from the FamilySearch group.

# AUTHOR

Jason (Jayce^) Hall <jayce@lug-nut.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Jason (Jayce^) Hall.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
