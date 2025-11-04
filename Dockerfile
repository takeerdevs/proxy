FROM ubuntu/squid:latest

# Install apache2-utils for htpasswd
RUN apt-get update && apt-get install -y apache2-utils && rm -rf /var/lib/apt/lists/*

# Copy our custom config
COPY squid-conf/squid.conf /etc/squid/squid.conf

# Copy password file (will be created in next step)
COPY squid-conf/passwords /etc/squid/passwords

# Ensure proper permissions
RUN chmod 644 /etc/squid/squid.conf && chmod 600 /etc/squid/passwords

# Run squid in foreground
CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"]
