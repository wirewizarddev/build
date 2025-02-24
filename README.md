<div align="center">

  <picture><img alt="logo" src="/docs/wirewizard.png" width="20%" height="20%"></picture>
  <h2>

  WireWizard: Assistant in the ecosystem management [WireGuard](https://github.com/WireGuard).
  
  </h2>

</div>

### Build minimal
```bash
git clone https://github.com/wirewizarddev/build.git && cd build
# If you are not running as root, use sudo.
# So far only works with the apt package manager.
./bin/build_minimal.sh
ww --help
```

### Build classic
```bash
# Will be added soon.
```

## FAQ
* Reserved ports:
  - **5432** for postgres.
  - **1335** for frontend.
  - **1336** for backend.
  - **1337-1446** for WG network interfaces.
* Reserved subnet:
  - **10.0.0.1/28 - 10.0.9.1/28 -> 10.0.0.2/32 :: 10.0.0.14/32 - 10.0.9.2/32 :: 10.0.9.14/32**
* Invitation codes live for **30** minutes and then auto-delete.
