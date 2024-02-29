<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Acceptance;

use OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget\ActionWidget;
use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

/**
 * @group oe_vcmsexamples
 * @group oe_vcmsexamples_action_widget_decoration
 */
final class ActionWidgetCest
{
    public function testActionWidgetHaveCorrectOptions(AdminAcceptanceTester $I): void
    {
        $I->wantToTest('Options of the action widget');

        $vcmsPanel = $I->openVisualCMSModule();
        $I->selectBaseFrame();

        $vcmsPanel->addWidget(ActionWidget::class);

        $I->waitForText('Old title is decorated now');
        $I->waitForText('New text option');
    }
}
