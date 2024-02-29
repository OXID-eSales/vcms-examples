<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples\Tests\Codeception\Page\Widget;

class ActionWidget extends BaseWidget
{
    public function getLabel(): string
    {
        return 'DD_VISUAL_EDITOR_SHORTCODE_ACTION';
    }
}
