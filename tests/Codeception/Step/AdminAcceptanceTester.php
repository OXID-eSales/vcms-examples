<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Step;

use OxidEsales\VcmsExamples\Tests\Codeception\AcceptanceTester;
use OxidEsales\VcmsExamples\Tests\Codeception\Page\VisualCmsPanel;

/**
 * @group oe_vcmsexamples
 */
class AdminAcceptanceTester extends AcceptanceTester
{
    public function openVisualCMSModule(): VisualCmsPanel
    {
        $I = $this;
        $I->loginAdmin();

        $adminPanel = new VisualCmsPanel($I);

        return $adminPanel->openVisualCms();
    }

    public function createCMSPage(string $cmsPageTitle): VisualCmsPanel
    {
        $I = $this;

        return $I
            ->openVisualCMSModule()
            ->createNewContent($cmsPageTitle)
            ->activateCmsContent()
            ->selectTab(VisualCmsPanel::TAB_ADVANCED)
            ->selectCmsType(VisualCmsPanel::TYPE_MANUAL)
            ->saveCmsContent();
    }
}
