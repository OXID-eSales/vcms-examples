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

	public function setInterfaceOptions(): void
	{
		$oLang = Registry::getLang();
		parent::setInterfaceOptions();

		$this->setOptions([
			...$this->getOptions(),
			'heading' => new TextOption(
				label: $oLang->translateString('SHOP_MODULE_oevcmsexamples_TextWidget_Heading')
			)
		]);
	}

}