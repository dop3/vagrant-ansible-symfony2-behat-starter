server {
    listen  80;

    root {{ doc_root }}/{{ app_folder }}/web;

    server_name {{ servername }};

    location / {
        try_files $uri /app_dev.php$is_args$args;
    }

    location ~ ^/(app_dev|config)\.php(/|$) {
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS off;
    }

    error_log /var/log/nginx/{{ app_name }}.log;
    access_log /var/log/nginx/{{ app_name }}.log;
}
