
typeme() {
  while read letter; do
          if [ "$letter" == "" ]; then
                  echo -n " "
          fi
          echo -n -e "$letter"
          sleep .02
  done
}

typethis() {
  echo $1 | sed -e 's/\(.\)/\1\n/g' | typeme
}

green=`tput setaf 2`
yellow=`tput setaf 3`
response=`tput setaf 6`
white=`tput sgr0`

echo -n '$ '
typethis "# Let's use our streaming API to see who's sending me EOS tokens..."
echo ""
echo -n '$ '
sleep 1
typethis 'MYTOKEN='$green' ...get your token from dfuse.io... '$white
echo ""
echo -n '$ '
sleep .3
typethis 'ws wss://mainnet.eos.dfuse.io/v1/stream?token=$MYTOKEN'
echo ""
sleep .01
echo -n '> '

typethis '{"type":"get_actions","listen":true,"data":{"account":"eosio.token","action_name":"transfer","receiver":"'$green'11111dfuseio"'$white'}}'
echo ""

        
sleep 1
echo $response'< {"type":"listening","next_block":14934803}'

sleep 1
echo '< {"type":"action_trace","data":{"block_num":14934816,"block_id":"00e3e320ea51a5699f35588add4e799e3fd19e4111ae45a4d641ae9dacfb6268","trx_id":"e7d617d04153d96a37a038994d75fb77a97d9401ffd6029ebcb1b4b65a3ed75f","idx":2,"depth":1,"trace":{"receipt":{"receiver":"11111dfuseio","act_digest":"ca17fdb1158e88ce1c6e954ee3a73f7e0d7239ef6ad5d0b857cde03fed0a7268","global_sequence":35106871,"recv_sequence":124,"auth_sequence":[["deathstarcom",34]],"code_sequence":2,"abi_sequence":2},"act":{"account":"eosio.token","name":"transfer","authorization":[{"actor":"deathstarcom","permission":"active"}],'$green'"data":{"from":"deathstarcom","to":"11111dfuseio","quantity":"5.0000 EOS","memo":"It works!"}'$response',"hex_data":"90aaca5841b354cb202932c94c83305550c300000000000004454f530000000009497420776f726b7321"},"elapsed":3756,"cpu_usage":0,"console":"","total_cpu_usage":0,"trx_id":"e7d617d04153d96a37a038994d75fb77a97d9401ffd6029ebcb1b4b65a3ed75f","inline_traces":[]}}}'
sleep 2

echo '< {"type":"action_trace","data":{"block_num":14934825,"block_id":"00e3e32901b1ad9b09f9486446cd39f1e78148a31984948f9ea82407d4734e7b","trx_id":"6a9a2062db181ea773a9a3d4e4d85742b61de22f938f181e1efd0b53c68812a7","idx":2,"depth":1,"trace":{"receipt":{"receiver":"11111dfuseio","act_digest":"1683e916b0ce8fafa5cfe374a9cf921f75d828053ac057366ce0bce576ba4f4d","global_sequence":35106896,"recv_sequence":125,"auth_sequence":[["nectarinecom",21]],"code_sequence":2,"abi_sequence":2},"act":{"account":"eosio.token","name":"transfer","authorization":[{"actor":"nectarinecom","permission":"active"}],'$green'"data":{"from":"nectarinecom","to":"11111dfuseio","quantity":"6.0000 EOS","memo":"It really works!"}'$response',"hex_data":"30297e384f4d1132202932c94c83305560ea00000000000004454f5300000000104974207265616c6c7920776f726b7321"},"elapsed":25,"cpu_usage":0,"console":"","total_cpu_usage":0,"trx_id":"6a9a2062db181ea773a9a3d4e4d85742b61de22f938f181e1efd0b53c68812a7","inline_traces":[]}}}'

sleep 1
echo -e -n "$white^EOF\n$ "


