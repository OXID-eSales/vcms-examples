<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Step;

use OxidEsales\Codeception\Module\Translation\Translator;
use OxidEsales\VcmsExamples\Tests\Codeception\AcceptanceTester;

/**
 * @group oe_vcmsexamples
 */
class VisualCmsAcceptanceTester extends AcceptanceTester
{
    public function openVisualCms(): self
    {
        $I = $this;
        $I->selectNavigationFrame();
        $I->retryClick(Translator::translate('mxcustnews'));
        $I->retryClick(Translator::translate('ddoevisualcms'));

        $I->wait(3);
        $I->waitForDocumentReadyState();

        return $this;
    }
}
