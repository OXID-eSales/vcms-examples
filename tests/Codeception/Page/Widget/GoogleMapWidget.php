<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget;

use OxidEsales\VcmsExamples\Tests\Codeception\Step\AdminAcceptanceTester;

class GoogleMapWidget extends BaseWidget
{
    private $mapHeightElement = ".form-group[data-area='dd-type-googlemap'] #elm_widget_googlemap_height";
    private $mapWidthElement = ".form-group[data-area='dd-type-googlemap'] #elm_widget_googlemap_width";
    private $mapLinkElement = ".form-group[data-area='dd-type-googlemap'] #elm_widget_googlemap_link";
    private $widgetIframe = "//div[contains(@class, 'dd-shortcode-googlemap')]//iframe";
    private $widgetIframeLink = "//div[contains(@class, 'dd-shortcode-googlemap')]//iframe[@src='%s']";

    public function getLabel(): string
    {
        return 'SHOP_MODULE_oevcmsexamples_ShortCode_GoogleMap';
    }

    public function fillData(array $data = []): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        if (isset($data['height'])) {
            $I->fillField($this->mapHeightElement, $data['height']);
        }

        if (isset($data['width'])) {
            $I->fillField($this->mapWidthElement, $data['width']);
        }

        if (isset($data['link'])) {
            $I->fillField($this->mapLinkElement, $data['link']);
        }

        return $this;
    }

    public function seeWidgetLink(string $link): self
    {
        /** @var AdminAcceptanceTester $I */
        $I = $this->user;

        $I->waitForElementVisible($this->widgetIframe);
        $I->seeNumberOfElements($this->widgetIframe, 1);
        $I->seeElement($this->widgetIframe);

        $locator = sprintf($this->widgetIframeLink, $link);
        $I->waitForElementVisible($locator);
        $I->seeNumberOfElements($locator, 1);
        $I->seeElement($locator);

        return $this;
    }
}
