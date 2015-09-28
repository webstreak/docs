Make sure you have `dig` tool
```
$ which dig
/usr/bin/dig
```

All 3 IP addresses should be present in `ANSWER SECTION`.  
Example:
```
$ dig chrisleithdodge.com +nocomments +noquestion +noauthority +noadditional +nostats

chrisleithdodge.com.    3599    IN      A       54.84.47.174
chrisleithdodge.com.    3599    IN      A       54.86.62.197
chrisleithdodge.com.    3599    IN      A       54.172.13.74
```
