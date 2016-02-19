### How to setup let's encrypt with nginx

0. Go to your server and login as `root` user
1. Make sure you have `git` and `bc` tools
ubuntu command: `sudo apt-get -y install git bc`
2. Clone repo: `git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt`
3. Stop nginx: `service nginx stop`
4. Make sure nginx has stopped: `netstat -na | grep ':80.*LISTEN'`
5. Run let's encrypt script: `cd /opt/letsencrypt && ./letsencrypt-auto certonly --standalone`
6. Put you email address in the next window
7. Enter domain names and subdomains
8. Start nginx (optional)
9. Open your nginx configuration file: `/etc/nginx/sites-available/your_site`  
and replace `listen 80;` directive via `listen 443 ssl;`  
Also add certificates:  
```
  ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
```
You might want to add the most secure SSL protocols and ciphers:  
```
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH';
```
10. Add a new section to redirect users to https
```
server {
  listen 80;
  server_name example.com;
  return 301 https://$host$request_uri;
}
```
11. Start or restart nginx `service nginx restart`
12. Auto Renewal. The certificate is valid only for 90 days.
`crontab -e` and add `0 5 * * 1 cd /opt/letsencrypt && ./letsencrypt-auto renew`
It will be trying to renew certificates every week at 5am utc zone
