'use client';

import {
  IconBrandAppleFilled,
  IconBrandGooglePlay,
} from '@tabler/icons-react';
import Link from 'next/link';
import { ReactElement, useEffect, useState } from 'react';

import { Button } from '@/components/ui/Button';
import { getPreferredStore, StoreName } from '@/lib/store';

const stores = {
  'app-store': {
    title: 'App Store',
    icon: <IconBrandAppleFilled style={{ width: '100%', height: '100%' }} />,
  },
  'google-play': {
    title: 'Google Play',
    icon: <IconBrandGooglePlay style={{ width: '100%', height: '100%' }} />,
  },
} as const;

function StoreButton({ store, href }: { store: StoreName; href: string }) {
  return (
    <Button asChild>
      <Link href={href}>
        <span className="mr-2 h-4 w-4">{stores[store].icon}</span>
        {stores[store].title}
      </Link>
    </Button>
  );
}

export default function AppStoreButtons({
  appStoreUrl,
  googlePlayUrl,
}: {
  appStoreUrl?: string;
  googlePlayUrl?: string;
}) {
  const [preferredStore, setPreferredStore] = useState<StoreName>();
  useEffect(() => {
    setPreferredStore(getPreferredStore(navigator));
  }, []);

  const buttons: ReactElement[] = [];
  if (preferredStore === 'app-store' && appStoreUrl) {
    buttons.push(
      <StoreButton key="app-store" store="app-store" href={appStoreUrl} />,
    );
  } else if (preferredStore === 'google-play' && googlePlayUrl) {
    buttons.push(
      <StoreButton
        key="google-play"
        store="google-play"
        href={googlePlayUrl}
      />,
    );
  } else {
    if (appStoreUrl) {
      buttons.push(
        <StoreButton key="app-store" store="app-store" href={appStoreUrl} />,
      );
    }
    if (googlePlayUrl) {
      buttons.push(
        <StoreButton
          key="google-play"
          store="google-play"
          href={googlePlayUrl}
        />,
      );
    }
  }

  return <div className="flex flex-wrap flex-center gap-4">{buttons}</div>;
}
