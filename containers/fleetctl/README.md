# Fleetctl

Docker wrapper for running fleetctl.

For proper setup, you must configure fleetctl:

1. Set fleet address
2. Login
3. Optional - if using private cert, ignore TLS verification

```
fleetctl config set --address https://example.com
fleetctl config set --token abc123...
fleetctl config set --tls-skip-verify
```

