# Generic Unmatched Server

Use as generic response to a load balancer for unknown or wildcard domain.

For any specific domain, route to preferred server or service. Everything else can be routed to this lightweight response system.

This responds with HTTP 400 for all requests except for health checks – a HTTPS request to /hc is 200.

Note this uses self signed certificate set up by `cert.sh`.

Note the response message of error400.html is set in the configuration with `make_config.sh`.
