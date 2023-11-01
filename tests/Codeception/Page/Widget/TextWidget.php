<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget;

use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

class TextWidget extends BaseWidget
{
    private $inputContentElement = ".form-group[data-area='dd-type-text'] .note-editable";

    private $inputHeadingElement = ".form-group[data-area='dd-type-text'] #elm_widget_text_heading";

    private $gridWidgetContent = "//div[contains(@class, 'dd-widget-type-text')][%d]//span[@class='dd-widget-preview']";
    private $widgetContent = "(//div[contains(@class, 'dd-shortcode-text')])[%d]";
    private $widgetHeading = "(//div[contains(@class, 'dd-shortcode-text')])[%d]//h1";

    public function getLabel(): string
    {
        return 'DD_VISUAL_EDITOR_SHORTCODE_TEXT';
    }

    public function addTextContent(string $content): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $this->addContent($this->inputContentElement, $content);

        return $this;
    }

    public function addTextHeading(string $content): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->appendField($this->inputHeadingElement, $content);

        return $this;
    }

    public function seeGridWidgetContent(int $index, string $content): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $locator = sprintf($this->gridWidgetContent, $index + 1);
        $I->seeElement($locator);
        $I->see($content, $locator);

        return $this;
    }

    public function seeWidgetContent(int $index, string $content, string $heading): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $locator = sprintf($this->widgetContent, $index + 1);
        $I->seeElement($locator);
        $I->see($content, $locator);
        $I->see($heading, $locator);

        return $this;
    }
}
