server {
    listen  80;

    root {{ doc_root }}/web;

    server_name {{ servername }};

    location / {
        try_files $uri /app.php$is_args$args;
    }

    location ~ ^/app\.php(/|$) {
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS off;
        # Prevents URIs that include the front controller. This will 404:
        # http://domain.tld/app.php/some-path
        # Remove the internal directive to allow URIs like this
        internal;
    }

    error_log /var/log/nginx/{{ app_name }}.log;
    access_log /var/log/nginx/{{ app_name }}.log;
}
