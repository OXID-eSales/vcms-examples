<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Page;

use Facebook\WebDriver\WebDriverKeys;
use OxidEsales\Codeception\Admin\Component\AdminMenu;
use OxidEsales\Codeception\Module\Translation\Translator;
use OxidEsales\Codeception\Page\Page;
use OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget\BaseWidget;
use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

class VisualCmsPanel extends Page
{
    public const TAB_ADVANCED = 2;
    private $contentContainer = ".dd-content-loader";

    private $tabButton = "//div[@class='dd-veditor-form-settings']//ul[contains(@class, 'nav-tabs')]//li[%d]";

    private $activateCheckbox = "//input[@id='elm_edit_active']";

    private $newContentCheckbox = "//input[@id='elm_edit_new']";

    private $titleField = "//input[@id='elm_edit_title']";

    public const TYPE_MANUAL = 3;

    private $typeRadio = "//input[@id='elm_edit_type_%d']";

    private $addWidgetButton = "//a[@class='dd-veditor-widget-action']";

    public $previewHolder = "//body[contains(@class, 'cl-ddoevisualcmspreview')]";
    public function openVisualCms(): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->selectNavigationFrame();
        $I->click(Translator::translate('mxcustnews'));
        $I->click(Translator::translate('ddoevisualcms'));

        $I->wait(3);
        $I->waitForDocumentReadyState();

        return $this;
    }
    public function createNewContent(string $title): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->selectBaseFrame();
        $I->seeElement($this->newContentCheckbox);
        $I->click($this->newContentCheckbox);

        $I->fillField($this->titleField, $title);

        return $this;
    }
    public function activateCmsContent(): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->selectBaseFrame();
        $I->click($this->activateCheckbox);

        return $this;
    }
    public function saveCmsContent(): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->click(Translator::translate('DD_VISUAL_EDITOR_ADD_WIDGET_SAVE'));
        $I->waitForPageLoad();
        $I->waitForElementNotVisible($this->contentContainer);

        return $this;
    }

    public function selectTab(int $tabIndex): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->selectBaseFrame();
        $locator = sprintf($this->tabButton, $tabIndex);
        $I->seeElement($locator);
        $I->click($locator);

        $tabContainer = $I->grabAttributeFrom($locator . '//a', 'href');
        $tabContainer = substr($tabContainer, strpos($tabContainer, '#'));
        $I->waitForElementVisible($tabContainer);

        return $this;
    }

    public function selectCmsType(int $typeIndex): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->selectBaseFrame();
        $locator = sprintf($this->typeRadio, $typeIndex);
        $I->seeElement($locator);
        $I->click($locator);

        return $this;
    }

    public function previewCmsContent(): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $id = $I->grabValueFrom("//form[@name='myedit']//input[@name='oxid']");
        $sid = $I->grabValueFrom("//form[@name='myedit']//input[@name='admin_sid']");
        $I->executeJS('$("#previewPopup").val("0");');

        $I->waitForAjax();
        $I->click(Translator::translate('DD_VISUAL_EDITOR_PREVIEW'));
        $I->wait(2);
        $I->waitForPageLoad();

        $I->amOnPage("/index.php?cl=ddoevisualcmspreview&id=" . $id . "&force_sid=" . $sid);
        $I->waitForPageLoad();

        $I->seeElement($this->previewHolder);
        $I->seeElement("//article[contains(@class, 'cmsContent')]");

        return $this;
    }

    /**
     * @template T of BaseWidget
     * @param class-string<T> $widgetClass
     * @return BaseWidget
     */
    public function addWidget(string $widgetClass): BaseWidget
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;
        $widget = new $widgetClass($I);
        $label = $widget->getLabel();

        $I->click($this->addWidgetButton);
        $I->wait(1); // animation
        $I->see(Translator::translate($label));
        $I->click(Translator::translate($label));

        return $widget;
    }
}
