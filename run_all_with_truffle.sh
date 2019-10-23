#!/usr/bin/env bash

# Setup the truffle project
rm -Rf truffle
pushd .
mkdir truffle
cd truffle
truffle init
popd

# Copy the contracts to the truffle
ALL_CONTRACTS=$(find contracts -name "*.sol")
CONTRACTS_WITH_TEST=$(grep -l 'truffleMain' $ALL_CONTRACTS)
cp $CONTRACTS_WITH_TEST truffle/contracts/

# Add to migrations
DEPLOY=truffle/migrations/2_deploy_contracts.js
(
for c in $CONTRACTS_WITH_TEST
do
  c_basename=`basename $c`
  c_name=${c_basename%.*}
  echo "var $c_name = artifacts.require('./$c_basename');"
done
echo
echo "module.exports = function(deployer) {"
for c in $CONTRACTS_WITH_TEST
do
  c_basename=`basename $c`
  c_name=${c_basename%.*}
  echo "  deployer.deploy($c_name);"
done
echo "};"
) > $DEPLOY

# Add to tests
TEST=truffle/test/All.js
(
for c in $CONTRACTS_WITH_TEST
do
  c_basename=`basename $c`
  c_name=${c_basename%.*}
  echo "var $c_name = artifacts.require('$c_name');"
done
echo
echo "contract('All', function(accounts) {"
echo "  var contract"
echo "  var user = accounts[0]"
echo
for c in $CONTRACTS_WITH_TEST
do
  c_basename=`basename $c`
  c_name=${c_basename%.*}
  echo "  it('$c_name', function() {"
  echo "    return $c_name.deployed().then(function(instance) {"
  echo "      return instance.truffleMain({ from: user, gas: 500000});"
  echo "    });"
  echo "  });"
done
echo "});"
) > $TEST

# Now actually test
cd truffle
truffle test
