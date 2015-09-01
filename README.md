# docker-mediawiki-ldap
Docker container for [Mediawiki](http://www.mediawiki.org/wiki/MediaWiki) with LDAP authentication.

Dervied from [synctree/mediawiki](https://github.com/synctree/docker-mediawiki).

## Extensions included
- [Realnames](http://olivierbeaton.com/mediawiki/#realnames)
- [LDAPAuthentication](https://www.mediawiki.org/wiki/Extension:LDAP_Authentication)

## Example usage


    docker run --name my-wiki -d -e MEDIAWIKI_DB_HOST='mariadb.example.com:3306' -e MEDIAWIKI_DB_USER='my-wiki' -e MEDIAWIKI_DB_PASSWORD='my-wiki' -v /home/belminf/my-wiki:/var/www-shared/html belminf/mediawiki-ldap

Remember to `sudo chcon -Rt svirt_sandbox_file_t` wherever your volume is located.

For more examples, view [synctree/mediawiki](https://github.com/synctree/docker-mediawiki).
