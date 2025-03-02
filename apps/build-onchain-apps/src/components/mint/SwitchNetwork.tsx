import { Button } from '@radix-ui/themes';
import { useSwitchNetwork } from 'wagmi';
import { baseGoerli } from 'viem/chains';
import { useCallback } from 'react';

const EXPECTED_CHAIN = baseGoerli;

function SwitchNetwork() {
  const { switchNetwork } = useSwitchNetwork({ chainId: EXPECTED_CHAIN.id });
  const handleClick = useCallback(() => (switchNetwork ? switchNetwork() : null), [switchNetwork]);
  return (
    <div className="flex flex-col justify-start">
      <p className="text-sm">Please switch to {EXPECTED_CHAIN.name}</p>
      <Button onClick={handleClick}>Switch Network</Button>
    </div>
  );
}

export default SwitchNetwork;
