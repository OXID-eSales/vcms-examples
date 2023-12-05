<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Acceptance;

use OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget\TextWidget;
use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

/**
 * @group oe_vcmsexamples
 * @group oe_vcmsexamples_widget_text
 */
final class TextWidgetCest
{
    public function testVisualCMSAvailable(AdminAcceptanceTester $I): void
    {
        $I->wantToTest('Visual CMS available and accessible');
        $I->openVisualCMSModule();
    }

    public function testTextWidgetAdd(AdminAcceptanceTester $I): void
    {
        $I->wantToTest('adding of text widget');

        $cmsTitle = 'Text widget';
        $widgetHeading = 'Text Heading';
        $visualCmsPanel = $I->createCMSPage($cmsTitle);

        $widgetsData = [
            'text widget 1 content',
            'text widget 2 content'
        ];

        //Add widget to the grid
        foreach ($widgetsData as $widgetData) {
            $visualCmsPanel
                ->addWidget(TextWidget::class)
                ->addTextContent($widgetData)
                ->addTextHeading($widgetHeading)
                ->saveWidget();
        }

        $visualCmsPanel->saveCmsContent();

        //Check text widgets are in the grid after save
        $textWidget = new TextWidget($I);
        foreach ($widgetsData as $index => $widgetData) {
            $textWidget->seeGridWidgetContent($index, $widgetData);
        }

        //Check preview contains added text
        $visualCmsPanel->previewCmsContent();

        $I->seeNumberOfElements("(//div[contains(@class, 'dd-shortcode-text')])", count($widgetsData));

        foreach ($widgetsData as $index => $widgetData) {
            $textWidget->seeWidgetContent($index, $widgetData, $widgetHeading);
        }

        //Open page in frontend
        $I->amOnPage('/text-widget');
        $I->dontSeeInTitle($visualCmsPanel->inTitle);
        $I->see($cmsTitle);

        foreach ($widgetsData as $index => $widgetData) {
            $textWidget->seeWidgetContent($index, $widgetData, $widgetHeading);
        }
    }
}
