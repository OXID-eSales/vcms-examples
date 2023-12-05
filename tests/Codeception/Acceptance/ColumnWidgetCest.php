<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Acceptance;

use OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget\ColumnWidget;
use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

/**
 * @group oe_vcmsexamples
 * @group oe_vcmsexamples_widget_column
 */
final class ColumnWidgetCest
{
    public function testColumnWidgetAdd(AdminAcceptanceTester $I): void
    {
        $I->wantToTest('adding of column widget');

        $cmsTitle = 'Column widget';
        $visualCmsPanel = $I->createCMSPage($cmsTitle);

        $visualCmsPanel->addColumn();
        $visualCmsPanel->saveCmsContent();

        //Open page in frontend
        $I->amOnPage('/column-widget');
        $I->dontSeeInTitle($visualCmsPanel->inTitle);
        $I->see($cmsTitle);

        $textWidget = new ColumnWidget($I);
        $textWidget->seeColumnWidgetElement();
    }
}
