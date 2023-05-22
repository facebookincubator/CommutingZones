/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @format
 */

import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import useBaseUrl from '@docusaurus/useBaseUrl';
import styles from './styles.module.css';

const featuresIntro = [
  {
    title: '',
    imageUrl: 'img/CZ.svg',
    description: (
      <>
      </>
    ),
  },
];

const features = [
  {
    title: 'Timeliness',
    imageUrl: 'img/undraw_time_management_re_tk5w.svg',
    description: (
      <>
        Traditional commuting zones are developed using census data which is
        updated every 10 years in the U.S, but these zones can be updated every
        few months to capture local economic and commuting changes.
      </>
    ),
  },
  {
    title: 'Global Reach',
    imageUrl: 'img/undraw_the_world_is_mine_re_j5cr.svg',
    description: (
      <>
        With over three billion people using Meta services, our team has built the
        first comprehensive estimate of commuting zones at an international level.
      </>
    ),
  },
  {
    title: 'Privacy',
    imageUrl: 'img/undraw_private_data_re_4eab.svg',
    description: (
      <>
        These zones are a set of boundary shapes built using aggregated estimates of
        home and work locations. Data used to build commuting zones is aggregated and
        de-identified.
      </>
    ),
  }
];

const featuresTwo = [
  {
    title: 'Commuting Zones for Marketing',
    imageUrl: 'img/undraw_all_the_data_re_hh4w.svg',
    description: (
      <>
        Commuting Zones reflect how users live and move. By leveraging these zones
        for geo-targeting, advertisers can reach their consumers where they are with
        relevant marketing campaigns.
      </>
    ),
  },
  {
    title: 'Unlock Better Measurement!',
    imageUrl: 'img/Artboard 1.svg',
    description: (
      <>
        Increase the power, reduce bias, and limit the contamination of your geo-experiments
        by leveraging the Commuting Zones. Combing them with next-gen geo-measurement solutions such
        as <a href="https://facebookincubator.github.io/GeoLift/">GeoLift by Meta Open Source</a>, can
        take your omni and cross-channel measurement to the next level!
      </>
    ),
  }
];

function FeatureIntro({imageUrl, title, description}) {
  const imgUrl = useBaseUrl(imageUrl);
  return (
    <div className={clsx('col col--10', styles.feature)}>
      {imgUrl && (
        <div className="text--center">
          <img className={styles.featureImage} src={imgUrl} alt={title} />
        </div>
      )}
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
}

function Feature({imageUrl, title, description}) {
  const imgUrl = useBaseUrl(imageUrl);
  return (
    <div className={clsx('col col--4', styles.feature)}>
      {imgUrl && (
        <div className="text--center">
          <img className={styles.featureImage} src={imgUrl} alt={title} />
        </div>
      )}
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
}

function FeatureTwo({imageUrl, title, description}) {
  const imgUrl = useBaseUrl(imageUrl);
  return (
    <div className={clsx('col col--6', styles.feature)}>
      {imgUrl && (
        <div className="text--center">
          <img className={styles.featureImage} src={imgUrl} alt={title} />
        </div>
      )}
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
}

export default function Home() {
  const context = useDocusaurusContext();
  const {siteConfig = {}} = context;
  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description="Description will go into a meta tag in <head />">
      <header className={clsx('hero hero--primary', styles.heroBanner)}>
        <div className="container">
          <h1 className="hero__title">{siteConfig.title}</h1>
          <p className="hero__subtitle">{siteConfig.tagline}</p>
          <div className={styles.buttons}>
            <Link
              className={clsx(
                'button button--outline button--secondary button--lg',
                styles.getStarted,
              )}
              to={useBaseUrl('docs/intro')}>
              Get Started
            </Link>
          </div>
        </div>
      </header>
      <main>

      <div className="padding-vert--xl">
          <div className="container">
            <div className="row">
              <div className={clsx('col col--6', styles.descriptionSection)}>
                <h2>Geographical Zones That Reflect How People Live and Commute! </h2>
                <p className={styles.descriptionSectionText}>To really understand an audience
                we need to comprehend how they live and where travel to. Unfortunately, the most
                commonly used geographical delimitations such as counties, cities, or states,
                are based on political boundaries that don't really represent the dynamics of their
                ppulation. </p>
                <p>Commuting Zones are geographical regions that were built to represent local
                economies and labor markets. Based on an analysis of people's movement, these Zones
                can help us take our research and understanding of a population to the next level!</p>
              </div>
              <div class="map">
                <a href="#">
                  <img src="img/CZ_Mexico.gif" width="600" height="342"/>
                </a>
              </div>
            </div>
          </div>
        </div>

        {features && features.length > 0 && (
          <section className={styles.features}>
            <div className="container">
              <div className="row">
                {features.map(({title, imageUrl, description}) => (
                  <Feature
                    key={title}
                    title={title}
                    imageUrl={imageUrl}
                    description={description}
                  />
                ))}
              </div>
            </div>
          </section>
        )}

        <div className="padding-vert--xl">
          <div className="container">
            <div className="row">
            <div class="map">
                <a href="#">
                  <img src="img/cz_dfg_usa_titles.gif" width="600" height="342"/>
                </a>
              </div>
              <div className={clsx('col col--6', styles.descriptionSection)}>
                <h2>GeoLift: Simplicity in Geo-Experimentation</h2>
                <p className={styles.descriptionSectionText}>From identifying where to run your
                experiment and running the power calculations, to measuring the Lift from your
                marketing campaigns, GeoLift has the tools you need to understanding the true
                incremental value of your marketing and help businesses make better decisions. </p>
              </div>
            </div>
          </div>
        </div>

        {featuresTwo && featuresTwo.length > 0 && (
          <section className={styles.featuresTwo}>
            <div className="container">
              <div className="row">
                {featuresTwo.map(({title, imageUrl, description}) => (
                  <FeatureTwo
                    key={title}
                    title={title}
                    imageUrl={imageUrl}
                    description={description}
                  />
                ))}
              </div>
            </div>
          </section>
        )}

        {featuresIntro && featuresIntro.length > 0 && (
          <section className={styles.footerfeatures}>
            <div className="container">
              <div className="row">
                {featuresIntro.map(({title, imageUrl, description}) => (
                  <FeatureIntro
                    key={title}
                    title={title}
                    imageUrl={imageUrl}
                    description={description}
                  />
                ))}
              </div>
            </div>
          </section>
        )}

      </main>
    </Layout>
  );
}
