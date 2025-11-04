FROM ubuntu/squid:latest

# Copy our custom config
COPY squid-conf/squid.conf /etc/squid/squid.conf

# Ensure proper permissions
RUN chmod 644 /etc/squid/squid.conf

# Run squid in foreground
CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"]
