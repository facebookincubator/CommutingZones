/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @format
 */

// With JSDoc @type annotations, IDEs can provide config autocompletion
/** @type {import('@docusaurus/types').DocusaurusConfig} */
(module.exports = {
  title: 'Commuting Zones',
  tagline: 'Data-driven boundaries to understand local economies.',
  url: 'https://facebookincubator.github.io/',
  baseUrl: '/CommutingZones/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon2.ico',
  organizationName: 'facebookincubator', // Usually your GitHub org/user name.
  projectName: 'CommutingZones', // Usually your repo name.

  presets: [
    [
      '@docusaurus/preset-classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          editUrl: 'https://github.com/facebookincubator/CommutingZones',
        },
        blog: {
          showReadingTime: true,
          // Please change this to your repo.
          editUrl:
            'https://github.com/facebookincubator/CommutingZones',
            blogSidebarTitle: 'All posts',
            blogSidebarCount: 'ALL',
            blogTitle: 'Commuting Zones Blog',
            blogDescription: 'The Official Commuting Zones Blog',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'Commuting Zones by Meta Open Source',
        logo: {
          alt: 'Commuting Zones by Meta Open Source Logo',
          src: 'img/CZ.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'intro',
            position: 'left',
            label: 'Documentation',
          },
          {
            type: 'doc',
            docId: 'Methodology/CZMethodology',
            position: 'left',
            label: 'Methodology',
            },
            {
              type: 'doc',
              docId: 'About',
              position: 'left',
              label: 'About',
            },
          {to: 'blog', label: 'Blog', position: 'left'},
          // Please keep GitHub link to the right for consistency.
          {
            href: 'https://github.com/facebookincubator/CommutingZones',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Learn',
            items: [
              {
                label: 'Documentation',
                to: 'docs/intro',
              },
              {
                label: 'Methodology',
                to: 'docs/Methodology/CZMethodology',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Commuting Zones Facebook',
                href: 'https://www.facebook.com/',
              },
              {
                label: 'GeoLift Facebook',
                href: 'https://www.facebook.com/groups/fbgeolift',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                to: 'blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/facebookincubator/CommutingZon',
              },
            ],
          },
          {
            title: 'Legal',
            // Please do not remove the privacy and terms, it's a legal requirement.
            items: [
              {
                label: 'Privacy',
                href: 'https://opensource.facebook.com/legal/privacy/',
              },
              {
                label: 'Terms',
                href: 'https://opensource.facebook.com/legal/terms/',
              },
              {
                label: 'Data Policy',
                href: 'https://opensource.facebook.com/legal/data-policy/',
              },
              {
                label: 'Cookie Policy',
                href: 'https://opensource.facebook.com/legal/cookie-policy/',
              },
            ],
          },
        ],
        logo: {
          alt: 'Facebook Open Source Logo',
          src: 'img/oss_logo.png',
          href: 'https://opensource.facebook.com',
        },
        // Please do not remove the credits, help to publicize Docusaurus :)
        copyright: `Copyright © ${new Date().getFullYear()} Facebook, Inc. Built with Docusaurus.`,
      },
    }),
});
