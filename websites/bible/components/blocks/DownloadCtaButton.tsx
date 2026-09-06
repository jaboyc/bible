'use client';

import { useEffect, useState } from 'react';

import CtaButton from '@/components/blocks/CtaButton';
import { getPreferredStore } from '@/lib/store';

export default function DownloadCtaButton({
  appStoreUrl,
  googlePlayUrl,
}: {
  appStoreUrl: string;
  googlePlayUrl: string;
}) {
  const [href, setHref] = useState('#download');

  useEffect(() => {
    const preferredStore = getPreferredStore(navigator);
    setHref(
      preferredStore === 'app-store'
        ? appStoreUrl
        : preferredStore === 'google-play'
          ? googlePlayUrl
          : '#download',
    );
  }, [appStoreUrl, googlePlayUrl]);

  return <CtaButton text="Download for Free" href={href} />;
}
