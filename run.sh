#!/usr/bin/env sh

env
if [[ -e /etc/paprikacoin/paprikacoind.conf ]]; then
    source /etc/paprikacoin/paprikacoind.conf
    /home/paprikacoin/paprikacoind \
      -server=$SERVER \
      -printtoconsole=$PRINTTOCONSOLE \
      -maxconnections=$MAXCONNECTIONS \
      -datadir=$DATADIR \
      -txindex=$TXINDEX \
      -assetindex=$ASSETINDEX \
      -debug=$DEBUG \
      -addressindex=$ADDRESSINDEX \
      -timestampindex=$TIMESTAMPINDEX \
      -spentindex=$SPENTINDEX \
      -zmqpubrawtx=$ZMQPUBRAWTX \
      -zmqpubhashblock=$ZMQPUBHASHBLOCK \
      -rpcbind=$RPCBIND \
      -rpcport=$RPCPORT \
      -rpcallowip=$RPCALLOWIP \
      -rpcuser=$RPCUSER \
      -rpcpassword=$RPCPASSWORD \
      -uacomment=$UACOMMENT \
      -bantime=$BANTIME \
      -mempoolexpiry=$MEMPOOLEXPIRY \
      -rpcworkqueue=$RPCWORKQUEUE \
      -maxmempool=$MAXMEMPOOL \
      -dbcache=$DBCACHE \
      -maxtxfee=$MAXTXFEE \
      -dbmaxfilesize=$DBMAXFILESIZE \
      -reindex=$REINDEX \
      -testnet=$TESTNET
else

  if [[ $SERVER ]]; then
    $SERVER_ARG = "-server=$SERVER"
  fi

  /home/paprikacoin/paprikacoind \
    $SERVER_ARG \
    -printtoconsole=$PRINTTOCONSOLE \
    -maxconnections=$MAXCONNECTIONS \
    -datadir=$DATADIR \
    -txindex=$TXINDEX \
    -assetindex=$ASSETINDEX \
    -debug=$DEBUG \
    -addressindex=$ADDRESSINDEX \
    -timestampindex=$TIMESTAMPINDEX \
    -spentindex=$SPENTINDEX \
    -zmqpubrawtx=$ZMQPUBRAWTX \
    -zmqpubhashblock=$ZMQPUBHASHBLOCK \
    -rpcbind=$RPCBIND \
    -rpcport=$RPCPORT \
    -rpcallowip=$RPCALLOWIP \
    -rpcuser=$RPCUSER \
    -rpcpassword=$RPCPASSWORD \
    -uacomment=$UACOMMENT \
    -bantime=$BANTIME \
    -mempoolexpiry=$MEMPOOLEXPIRY \
    -rpcworkqueue=$RPCWORKQUEUE \
    -maxmempool=$MAXMEMPOOL \
    -dbcache=$DBCACHE \
    -maxtxfee=$MAXTXFEE \
    -dbmaxfilesize=$DBMAXFILESIZE \
    -reindex=$REINDEX \
    -testnet=$TESTNET
fi
