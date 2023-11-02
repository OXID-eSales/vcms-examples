<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget;

use Codeception\Actor;
use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

class ColumnWidget
{
    private $widgetShortCodeClass = "(//div[@class='dd-ve-content'] //div[contains(@class, 'dd-shortcode-column')])";
    private $widgetAdditionalClass = "(//div[@class='dd-ve-content'] //div[contains(@class, 'prefix-class')])";
    private Actor $user;

    public function __construct(Actor $I)
    {
        $this->user = $I;
    }

    public function seeColumnWidgetElement(): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->seeElement($this->widgetShortCodeClass);
        $I->seeElement($this->widgetAdditionalClass);

        return $this;
    }
}
