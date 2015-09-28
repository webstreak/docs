Make sure you have `dig` tool
```bash
$ which dig
/usr/bin/dig
```

All 3 IP addresses should be present in `ANSWER SECTION`.  
Example:
```bash
$ dig chrisleithdodge.com

; <<>> DiG 9.10.3 <<>> chrisleithdodge.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 16260
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;chrisleithdodge.com.           IN      A

;; ANSWER SECTION:
chrisleithdodge.com.    3599    IN      A       54.84.47.174
chrisleithdodge.com.    3599    IN      A       54.86.62.197
chrisleithdodge.com.    3599    IN      A       54.172.13.74

;; Query time: 254 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Mon Sep 28 09:41:28 EDT 2015
;; MSG SIZE  rcvd: 96
```
