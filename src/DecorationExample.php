<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

namespace OxidEsales\VcmsExamples;

use OxidEsales\VisualCmsModule\Contract\ShortCodeInterface;
use OxidEsales\VisualCmsModule\Option\TextOption;
use OxidEsales\VisualCmsModule\ShortCode\Action;

class DecorationExample implements ShortCodeInterface
{
    public function __construct(
        private Action $actionShortcode
    ) {
        if (isAdmin()) {
            $this->setInterfaceOptions();
        }
    }

    public function getTemplate(): string
    {
        return $this->actionShortcode->getTemplate();
    }

    public function setTemplate(string $template): void
    {
        $this->actionShortcode->setTemplate($template);
    }

    public function install(): void
    {
        $this->actionShortcode->install();
    }

    public function setInterfaceOptions(): void
    {
        $this->actionShortcode->setInterfaceOptions();

        $shortcodeOptions = $this->actionShortcode->getOptions();
        $shortcodeOptions['newOption'] = new TextOption(
            label: 'SomeNewTextOption'
        );

        $this->setOptions($shortcodeOptions);
    }

    public function getShortCode(): string
    {
        return $this->actionShortcode->getShortCode();
    }

    public function setOptions(array $options): void
    {
        $this->actionShortcode->setOptions($options);
    }

    public function getOptions(): array
    {
        return $this->actionShortcode->getOptions();
    }

    public function isWidget(): bool
    {
        return $this->actionShortcode->isWidget();
    }

    public function getPreviewOption(): ?string
    {
        return $this->actionShortcode->getPreviewOption();
    }

    public function getTitle(): string
    {
        return $this->actionShortcode->getTitle();
    }

    public function getBackgroundColor(): string
    {
        return $this->actionShortcode->getBackgroundColor();
    }

    public function getIcon(): string
    {
        return $this->actionShortcode->getIcon();
    }

    public function getParams(): array
    {
        return $this->actionShortcode->getParams();
    }

    public function setParams(array $params): void
    {
        $this->actionShortcode->setParams($params);
    }

    public function prepareTemplateParams(string $content, array $params): array
    {
        return $this->actionShortcode->prepareTemplateParams($content, $params);
    }
}