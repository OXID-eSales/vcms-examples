<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Acceptance;

use OxidEsales\VcmsExamples\Tests\Codeception\Step\VisualCmsAcceptanceTester;

/**
 * @group oe_vcmsexamples
 * @group oe_vcmsexamples_widget_text
 */
final class TextWidgetCest
{
    public function testVisualCMSAvailable(VisualCmsAcceptanceTester $I): void
    {
        $I->wantToTest('Visual CMS available and accessible');

        $I->loginAdmin();
        $I->openVisualCms();
    }
}
