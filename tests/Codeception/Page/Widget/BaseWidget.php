<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget;

use Codeception\Actor;
use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

abstract class BaseWidget
{
    private $saveWidgetButton = "//div[contains(@class, 'modal')]//button[contains(text(), 'Save')]";

    public Actor $user;

    abstract public function getLabel(): string;

    public function __construct(Actor $I)
    {
        $this->user = $I;
    }

    public function saveWidget(): void
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->click($this->saveWidgetButton);
    }

    public function addContent(string $element, string $content): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->appendField($element, $content);

        $I->see($content, $element);

        return $this;
    }

}
