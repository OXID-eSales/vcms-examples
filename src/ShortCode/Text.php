<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

namespace OxidEsales\VcmsExamples\ShortCode;

use OxidEsales\EshopCommunity\Core\Registry;
use OxidEsales\VisualCmsModule\Option\TextOption;
use OxidEsales\VisualCmsModule\ShortCode\Text as TextParent;

class Text extends TextParent
{
    protected string $template = '@oe_vcmsexamples/shortcodes/vcmsexamples_shortcode_text';

    public function setOptions(array $options): void
    {
        $shopLanguage = Registry::getLang();
        $options['heading'] = new TextOption(
            label: $shopLanguage->translateString('SHOP_MODULE_oevcmsexamples_TextWidget_Heading')
        );

        parent::setOptions($options);
    }
}
