<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

namespace OxidEsales\VcmsExamples\ShortCode;

use OxidEsales\EshopCommunity\Core\Registry;
use OxidEsales\VisualCmsModule\DTO\OptionList;
use OxidEsales\VisualCmsModule\ShortCodeCollection\ShortCode\Text as TextParent;
use OxidEsales\VisualCmsModule\ShortCodeCollection\Option\TextOption;

class Text extends TextParent
{
    protected string $template = '@oe_vcmsexamples/shortcodes/vcmsexamples_shortcode_text';

    public function getOptions(): OptionList
    {
        $shopLanguage = Registry::getLang();
        /** @var string $heading */
        $heading = $shopLanguage->translateString('SHOP_MODULE_oevcmsexamples_TextWidget_Heading');

        $options = parent::getOptions();

        $options['heading'] = new TextOption(
            label: $heading,
        );

        return $options;
    }
}
