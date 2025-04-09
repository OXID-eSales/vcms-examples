<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

namespace OxidEsales\VcmsExamples;

use OxidEsales\VisualCmsModule\DataType\OptionList;
use OxidEsales\VisualCmsModule\DataType\ShortCodeMetadataInterface;
use OxidEsales\VisualCmsModule\Grid\DataType\GridItemInterface;
use OxidEsales\VisualCmsModule\ShortCodeCollection\ShortCode\Action\Action;
use OxidEsales\VisualCmsModule\ShortCodeCollection\ShortCode\ShortCodeInterface;
use OxidEsales\VisualCmsModule\ShortCodeCollection\Option\TextOption;

class DecorationExample implements ShortCodeInterface
{
    public function __construct(
        private Action $actionShortcode
    ) {
    }

    public function getMetadata(): ShortCodeMetadataInterface
    {
        return $this->actionShortcode->getMetadata();
    }

    public function getTemplate(): string
    {
        return $this->actionShortcode->getTemplate();
    }

    public function getOptions(): OptionList
    {
        $originalOptions = $this->actionShortcode->getOptions();

        $originalOptions['title'] = new TextOption(
            label: 'Old title is decorated now'
        );

        $originalOptions['newOption'] = new TextOption(
            label: 'New text option'
        );

        return $originalOptions;
    }

    /**
     * @return array<string, mixed>
     */
    public function prepareTemplateParams(GridItemInterface $gridItem): array
    {
        return $this->actionShortcode->prepareTemplateParams($gridItem);
    }
}
