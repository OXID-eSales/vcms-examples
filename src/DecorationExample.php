<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

namespace OxidEsales\VcmsExamples;

use OxidEsales\VisualCmsModule\DataType\OptionList;
use OxidEsales\VisualCmsModule\DataType\ShortCodeMetadataInterface;
use OxidEsales\VisualCmsModule\Option\TextOption;
use OxidEsales\VisualCmsModule\ShortCode\Action;
use OxidEsales\VisualCmsModule\ShortCode\ShortCodeInterface;

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

    public function prepareTemplateParams(string $content, array $params): array
    {
        return $this->actionShortcode->prepareTemplateParams($content, $params);
    }
}
