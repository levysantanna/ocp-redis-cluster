FROM rhscl/redis-32-rhel7

COPY src/redis.conf /opt/rh/rh-redis32/register.content/etc/opt/rh/rh-redis32/redis.conf
# _________________________

COPY src/*.sh /usr/local/bin/
COPY src/redis-trib.rb /usr/local/bin/
chmod +x /usr/local/bin/cluster-init.sh /usr/local/bin/redis-trib.rb
# _________________________________
EXPOSE 6379 16379

USER 1001

ENTRYPOINT ["container-entrypoint"]
CMD ["run-redis"]
