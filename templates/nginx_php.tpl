server {
        listen          80;
        server_name      $domena www.$domena;
        client_max_body_size    4G;
        keepalive_timeout       5;


        if ($host = 'www.$domena' ) {
                 rewrite ^/(.*)$ http://$domena/$1 permanent;
        }

    access_log  $katalog_domowy$domena/logs/$domena.access.log;


    location / {
        proxy_pass          http://127.0.0.1:7001;
        proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
        # error_page   404 500 502 503 504    /50x.html;
        proxy_redirect      off;
        proxy_set_header    Host            $host;
        proxy_set_header    X-Real-IP       $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
    }
        location /static/ {
                alias $katalog_domowy$domena/public_html/static/;
        }

          location = /favicon.ico {
       #empty_gif;
        return 204;
      }
}
