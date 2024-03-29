<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

namespace OxidEsales\VcmsExamples\ShortCode;

use OxidEsales\EshopCommunity\Core\Registry;
use OxidEsales\VisualCmsModule\DataType\OptionList;
use OxidEsales\VisualCmsModule\DataType\ShortCodeMetadata;
use OxidEsales\VisualCmsModule\DataType\ShortCodeMetadataInterface;
use OxidEsales\VisualCmsModule\Option\TextOption;
use OxidEsales\VisualCmsModule\ShortCode\BaseShortCode;

class GoogleMap extends BaseShortCode
{
    protected string $template = '@oe_vcmsexamples/shortcodes/vcmsexamples_shortcode_googlemap';

    public function getMetadata(): ShortCodeMetadataInterface
    {
        return new ShortCodeMetadata(
            shortCodeTag: 'googlemap',
            isWidget: true,
            title: 'SHOP_MODULE_oevcmsexamples_ShortCode_GoogleMap',
            backgroundColor: '#e74c3c',
            icon: 'fa-map',
        );
    }

    public function getOptions(): OptionList
    {
        $oLang = Registry::getLang();
        $link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d341751.4640925346!2d7.2344488890625!3d47.995675900000016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47911b61e3aab3d3%3A0x2739f5134e70bd9e!2sOXID%20eSales%20AG!5e0!3m2!1sen!2sde!4v1697029847015!5m2!1sen!2sde'; // phpcs:ignore

        return new OptionList([
            'link' => new TextOption(
                label: $oLang->translateString('SHOP_MODULE_oevcmsexamples_GoogleMap_link'),
                value: $link
            ),
            'height' => new TextOption(
                label: $oLang->translateString('SHOP_MODULE_oevcmsexamples_GoogleMap_width'),
                value: 450
            ),
            'width' => new TextOption(
                label: $oLang->translateString('SHOP_MODULE_oevcmsexamples_GoogleMap_height'),
                value: 600
            )
        ]);
    }
}
