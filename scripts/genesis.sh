#!/bin/bash
curdir=${PWD}
echo "current $curdir"
docker run -it --rm -v "${curdir}/config:/root/config" --name generate --entrypoint /usr/bin/prysmctl ethnet/tools \
	testnet \
	generate-genesis \
	--fork=capella \
	--num-validators=64 \
	--genesis-time-delay=15 \
	--output-ssz=/root/config/genesis.ssz \
	--chain-config-file=/root/config/config.yml \
	--geth-genesis-json-in=/root/config/genesis.json \
	--geth-genesis-json-out=/root/config/genesis.json
