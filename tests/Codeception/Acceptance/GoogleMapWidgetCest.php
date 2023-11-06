<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Acceptance;

use OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget\GoogleMapWidget;
use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

/**
 * @group oe_vcmsexamples
 * @group oe_vcmsexamples_widget_googlemaps
 */
final class GoogleMapWidgetCest
{
    public function testVisualCMSAvailable(AdminAcceptanceTester $I): void
    {
        $I->wantToTest('Visual CMS available and accessible');
        $I->openVisualCMSModule();
    }

    public function testGoogleMapWidgetAdd(AdminAcceptanceTester $I): void
    {
        $I->wantToTest('adding of text widget');

        $cmsTitle = 'Google Map Widget';

        // @codingStandardsIgnoreStart
        $link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d341751.4640925346!2d7.2344488890625!3d47.995675900000016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47911b61e3aab3d3%3A0x2739f5134e70bd9e!2sOXID%20eSales%20AG!5e0!3m2!1sen!2sde!4v1697029847015!5m2!1sen!2sde';
        // @codingStandardsIgnoreEnd
        $widgetData = [
            'height' => 400,
            'width' => 500,
            'link' => $link
        ];
        $visualCmsPanel = $I->createCMSPage($cmsTitle);

        $widget = $visualCmsPanel
            ->addWidget(GoogleMapWidget::class)
            ->fillData($widgetData);

        $widget->saveWidget();
        $visualCmsPanel->saveCmsContent();

        //Check preview
        $visualCmsPanel->previewCmsContent();
        $I->seeNumberOfElements("(//div[contains(@class, 'dd-shortcode-googlemap')])", 1);

        //Open page in frontend
        $I->amOnPage('/google-map-widget');
        $I->dontSeeElement($visualCmsPanel->previewHolder);
        $I->see($cmsTitle);

        $widget->seeWidgetLink($widgetData['link']);
    }
}
