Linda Twitter Tweet
===================
Tweet with RocketIO::Linda

* https://github.com/shokai/linda-twitter
* watch tuple ["twitter", "tweet", "hey!!"] and Tweet "hey!!"
* then write tuple ["twitter", "tweet", "success"] or ["twitter", "tweet", "fail"]


Dependencies
------------
- [Tw](http://shokai.github.io/tw)
- Ruby 1.8.7 ~ 2.0.0
- [LindaBase](https://github.com/shokai/linda-base)


Install Dependencies
--------------------

    % gem install bundler foreman
    % bundle install


Run
---

set ENV var "TW_USER", "LINDA_BASE" and "LINDA_SPACE"

    % export TW_USER=shokai
    % export LINDA_BASE=http://linda.example.com
    % export LINDA_SPACE=test
    % bundle exec ruby linda-twitter.rb


oneline

    % TW_USER=shokai LINDA_BASE=http://linda.example.com LINDA_SPACE=test  bundle exec ruby linda-twitter.rb


Install as Service
------------------

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app linda-twitter -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/linda-twitter-tweet-1.plist


for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app linda-twitter -d `pwd` -u `whoami`
    % sudo service linda-twitter start
