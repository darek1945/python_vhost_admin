<VirtualHost 127.0.0.1:7001>
        ServerAdmin webmaster@$domena
        ServerName      $domena
        DocumentRoot $katalog_domowy$domena/public_html/
        <Directory />
                Options FollowSymLinks
                AllowOverride None
        </Directory>
        <Directory $katalog_domowy$domena/public_html/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
        </Directory>


        ErrorLog $katalog_domowy$domena/logs/$domena-error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        CustomLog $katalog_domowy$domena/logs/$domena-access.log combined
</VirtualHost>
~
~