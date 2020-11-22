---
title: 개인적인 CODNS CRONTAB
date: 2020-11-16T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Living"
tags:
  - "Hardware"

# post type
type: "post"
---

현재 D-Link 공유기를 사용중인데 올해 초? D-Link 측에서 DDNS 서비스를 종료한다는 공지가 떴습니다. ([참고 포스팅](https://jjerry-k.github.io/living/2020/05/31/Dlink_ddns/))  
그래서..다른 서비스를 찾고 있던중 [CODNS](http://www.codns.com) 라는 국내 서비스를 찾게 되었습니다.  
근데 이 서비스는 일정 기간 사용하면 수동으로 갱신을 해줘야하는 불편함이 있더라구요.  
그래서...라즈베리파이에 crontab을 이용하여 자동 갱신 스크립트를 돌려 사용중입니다.  

``` bash
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command
0 12 * * * /home/pi/codns/CODNS_CLIENT.LINUX -ipupdate
```

