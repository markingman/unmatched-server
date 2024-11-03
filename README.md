# Generic Unmatched Server

Use as generic response for a load balancer for unknown request.

For any specific domain, route to preferred server or service. Everything else can be routed to this lightweight response system.

This responds with HTTP 400 for all requests except for health checks – a HTTPS request to /hc is 200.

This uses self signed certificate set up by `cert.sh`.

The response message of error400.html is set in the configuration with `make_config.sh`.
